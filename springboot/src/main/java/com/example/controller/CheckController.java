package com.example.controller;

import com.example.common.Result;
import com.example.entity.Checks;
import com.example.service.CheckService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 检修记录表前端操作接口
 **/
@RestController
@RequestMapping("/checks")
public class CheckController {

    @Resource
    private CheckService checkService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Checks checks) {
        checkService.add(checks);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        checkService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        checkService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Checks checks) {
        checkService.updateById(checks);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Checks checks = checkService.selectById(id);
        return Result.success(checks);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Checks checks) {
        List<Checks> list = checkService.selectAll(checks);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Checks checks,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Checks> page = checkService.selectPage(checks, pageNum, pageSize);
        return Result.success(page);
    }

}