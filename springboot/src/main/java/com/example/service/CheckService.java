package com.example.service;

import com.example.entity.Checks;
import com.example.mapper.CheckMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 检修记录表业务处理
 **/
@Service
public class CheckService {

    @Resource
    private CheckMapper checkMapper;

    /**
     * 新增
     */
    public void add(Checks checks) {
        checkMapper.insert(checks);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        checkMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            checkMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Checks checks) {
        checkMapper.updateById(checks);
    }

    /**
     * 根据ID查询
     */
    public Checks selectById(Integer id) {
        return checkMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Checks> selectAll(Checks checks) {
        return checkMapper.selectAll(checks);
    }

    /**
     * 分页查询
     */
    public PageInfo<Checks> selectPage(Checks checks, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Checks> list = checkMapper.selectAll(checks);
        return PageInfo.of(list);
    }

}