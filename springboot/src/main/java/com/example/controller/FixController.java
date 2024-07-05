package com.example.controller;

import com.example.common.Result;
import com.example.entity.Fix;
import com.example.service.FixService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 报修信息表前端操作接口
 **/
@RestController
@RequestMapping("/fix")
public class FixController {

    @Resource
    private FixService fixService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Fix fix) {
        fixService.add(fix);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        fixService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        fixService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Fix fix) {
        fixService.updateById(fix);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Fix fix = fixService.selectById(id);
        return Result.success(fix);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Fix fix ) {
        List<Fix> list = fixService.selectAll(fix);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Fix fix,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Fix> page = fixService.selectPage(fix, pageNum, pageSize);
        return Result.success(page);
    }

}