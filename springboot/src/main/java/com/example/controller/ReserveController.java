package com.example.controller;

import com.example.common.Result;
import com.example.entity.Reserve;
import com.example.service.ReserveService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 预约信息表前端操作接口
 **/
@RestController
@RequestMapping("/reserve")
public class ReserveController {

    @Resource
    private ReserveService reserveService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Reserve reserve) {
        reserveService.add(reserve);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        reserveService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        reserveService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Reserve reserve) {
        reserveService.updateById(reserve);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Reserve reserve = reserveService.selectById(id);
        return Result.success(reserve);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Reserve reserve ) {
        List<Reserve> list = reserveService.selectAll(reserve);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Reserve reserve,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Reserve> page = reserveService.selectPage(reserve, pageNum, pageSize);
        return Result.success(page);
    }

}