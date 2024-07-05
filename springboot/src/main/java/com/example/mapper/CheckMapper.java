package com.example.mapper;

import com.example.entity.Checks;

import java.util.List;

/**
 * 操作check相关数据接口
*/
public interface CheckMapper {

    /**
      * 新增
    */
    int insert(Checks checks);

    /**
      * 删除
    */
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Checks checks);

    /**
      * 根据ID查询
    */
    Checks selectById(Integer id);

    /**
      * 查询所有
    */
    List<Checks> selectAll(Checks checks);

}