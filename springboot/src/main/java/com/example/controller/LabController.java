package com.example.controller;

import com.example.common.Result;
import com.example.common.enums.StatusEnum;
import com.example.entity.Lab;
import com.example.service.LabService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 实验室信息表前端操作接口
 **/
@RestController
@RequestMapping("/lab")
public class LabController {

    @Resource
    private LabService labService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Lab lab) {
        labService.add(lab);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        labService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        labService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Lab lab) {
        labService.updateById(lab);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Lab lab = labService.selectById(id);
        return Result.success(lab);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Lab lab ) {
        List<Lab> list = labService.selectAll(lab);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Lab lab,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Lab> page = labService.selectPage(lab, pageNum, pageSize);
        return Result.success(page);
    }

    @GetMapping("/pie")
    public Result pie() {
        Map<String, Object> resultMap = new HashMap<>();
        List<Map<String, Object>> resultList = new ArrayList<>();
        // 分别处理空闲中和使用中两种状态的数据，封装到resultList里面即可
        List<Lab> labs = labService.selectAll(new Lab());
        long okCount = labs.stream().filter(x -> StatusEnum.OK.status.equals(x.getStatus())).count();
        long noCount = labs.stream().filter(x -> StatusEnum.NO.status.equals(x.getStatus())).count();

        Map<String, Object> okMap = new HashMap<>();
        okMap.put("name", StatusEnum.OK.status);
        okMap.put("value", okCount);
        resultList.add(okMap);

        Map<String, Object> noMap = new HashMap<>();
        noMap.put("name", StatusEnum.NO.status);
        noMap.put("value", noCount);
        resultList.add(noMap);

        resultMap.put("name", "数量");
        resultMap.put("data", resultList);
        return Result.success(resultMap);
    }

    @GetMapping("/bar")
    public Result bar() {
        Map<String, Object> resultMap = new HashMap<>();
        List<String> xList = new ArrayList<>();
        List<Long> yList = new ArrayList<>();

        long okCount = labService.selectCount(StatusEnum.OK.status);
        long noCount = labService.selectCount(StatusEnum.NO.status);

        xList.add(StatusEnum.OK.status);
        xList.add(StatusEnum.NO.status);

        yList.add(okCount);
        yList.add(noCount);

        resultMap.put("text", "实验室状态统计（柱状图）");
        resultMap.put("subtext", "统计维度：状态");
        resultMap.put("xAxis", xList);
        resultMap.put("yAxis", yList);
        return Result.success(resultMap);
    }
}