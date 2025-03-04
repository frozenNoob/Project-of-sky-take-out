package com.sky.controller.user;

import com.github.benmanes.caffeine.cache.Cache;
import com.sky.constant.StatusConstant;
import com.sky.entity.Dish;
import com.sky.result.Result;
import com.sky.service.DishService;
import com.sky.vo.DishVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("userDishController")
@RequestMapping("/user/dish")
@Slf4j
@Api(tags = "C端-菜品浏览接口")
public class DishController {
    @Autowired
    private DishService dishService;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private Cache<String, Object> caffeineCache;

    /**
     * 根据分类id查询菜品
     *
     * @param categoryId
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("根据分类id查询菜品")
    public Result<List<DishVO>> list(Long categoryId) {
        if(categoryId == null){
            throw new RuntimeException("数据为空");
        }
        //构造redis中的key，规则：dish_分类id
        String key = "dish_" + categoryId;

        //先查询Caffeine
        List<DishVO> list = (List<DishVO>) caffeineCache.getIfPresent(key);
        if (list != null && list.size() > 0) {
            //如果存在，直接返回，无须查询数据库
            return Result.success(list);
        }

        //查询redis中是否存在菜品数据
        list = (List<DishVO>) redisTemplate.opsForValue().get(key);
        if (list != null && list.size() > 0) {
            //如果存在，直接返回，无须查询数据库
            caffeineCache.put(key, list);
            return Result.success(list);
        }

        Dish dish = new Dish();
        dish.setCategoryId(categoryId);
        dish.setStatus(StatusConstant.ENABLE);//查询起售中的菜品

        //如果不存在，查询数据库，将查询到的数据放入redis和Caffeine中
        list = dishService.listWithFlavor(dish);
        caffeineCache.put(key, list);
        redisTemplate.opsForValue().set(key, list);
        return Result.success(list);
    }

    /**
     * 查询所有菜品
     *
     * @return
     */
    @GetMapping("/listAll")
    @ApiOperation("列出所有菜品")
    public Result<List<DishVO>> listAll() {
        List<DishVO> list = dishService.getAllDish();//在SQL中已经编写了withFlavor

        return Result.success(list);
    }
}
