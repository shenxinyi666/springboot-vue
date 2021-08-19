package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.entity.Book;
import com.example.demo.entity.Fruit;
import com.example.demo.mapper.BookMapper;
import com.example.demo.mapper.FruitMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/fruit")
public class FruitController {

    @Resource
    FruitMapper fruitMapper;

    @PostMapping
    public Result<?> save(@RequestBody Fruit fruit) {
        fruitMapper.insert(fruit);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody Fruit fruit) {
        fruitMapper.updateById(fruit);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> update(@PathVariable Integer id) {
        fruitMapper.deleteById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> getById(@PathVariable Integer id) {
        return Result.success(fruitMapper.selectById(id));
    }


    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search) {
        LambdaQueryWrapper<Fruit> wrapper = Wrappers.<Fruit>lambdaQuery();
        if (StrUtil.isNotBlank(search)) {
            wrapper.like(Fruit::getName, search);
        }
        Page<Fruit> FruitPage = fruitMapper.selectPage(new Page<>(pageNum, pageSize), wrapper);
        return Result.success(FruitPage);
    }
}
