package com.sky.controller.user;

import com.sky.api.dto.Result;
import com.sky.api.dto.Setmeal;
import com.sky.constant.StatusConstant;
import com.sky.mapper.SetmealMapper;
import com.sky.service.SetmealService;
import com.sky.vo.DishItemVO;
import com.sky.vo.SetmealVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("userSetmealController")
@RequestMapping("/user/setmeal")
@Api(tags = "C端-套餐浏览接口")
public class SetmealController {
    @Autowired
    private SetmealService setmealService;

    @Autowired
    private SetmealMapper setmealMapper;
    /**
     * 条件查询
     *
     * @param categoryId
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("根据分类id查询套餐")
//    Spring Cache 是作用在方法上的，其核心思想是，当我们在调用一个缓存方法时会把该方法参数和返回结果作为一个键值对存在缓存中。
//    这里调用的是Spring自带的缓存，和Redis缓存作用相似。
    @Cacheable(cacheNames = "setmealCache",key = "#categoryId") //key: setmealCache::100
    public Result<List<Setmeal>> list(Long categoryId) {
        Setmeal setmeal = new Setmeal();
        setmeal.setCategoryId(categoryId);
        setmeal.setStatus(StatusConstant.ENABLE);

        List<Setmeal> list = setmealService.list(setmeal);
        return Result.success(list);
    }

    /**
     * 根据套餐id查询包含的菜品列表
     *
     * @param id
     * @return
     */
    @GetMapping("/dish/{id}")
    @ApiOperation("根据套餐id查询包含的菜品列表")
    public Result<List<DishItemVO>> dishList(@PathVariable("id") Long id) {
        List<DishItemVO> list = setmealService.getDishItemById(id);
        return Result.success(list);
    }

    /**
     * 根据所有套餐
     *
     * @return
     */
    @GetMapping("/listAll")
    @ApiOperation("列出所有套餐")
    public Result<List<SetmealVO>> listAll() {
        List<SetmealVO> list = setmealService.getAllSetmeal();

        return Result.success(list);
    }

    /*
     * 根据套餐id查询套餐
     */
    @GetMapping("/{id}")
    public Setmeal getSetmealById(@PathVariable("id") Long dishId){
        return setmealMapper.getById(dishId);
    }
}
