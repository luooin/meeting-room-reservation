package com.example.mapper;

import com.example.entity.Fix;

import java.util.List;

/**
 * 操作fix相关数据接口
*/
public interface FixMapper {

    /**
      * 新增
    */
    int insert(Fix fix);

    /**
      * 删除
    */
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Fix fix);

    /**
      * 根据ID查询
    */
    Fix selectById(Integer id);

    /**
      * 查询所有
    */
    List<Fix> selectAll(Fix fix);

}