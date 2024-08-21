package com.sky.annotation;

import com.sky.enumeration.OperationType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AutoFill { //注解是可以用声明属性的选取的，即声明注解中的元素！！！！！！
    //数据库操作类型：UPDATE INSERT
    OperationType value();//使用枚举类型

    int num() default 10;//元素名为num,值为10,在使用注解时采用@AutoFill(num=10)来进行
    String []names() default {"1", "2"};
}
