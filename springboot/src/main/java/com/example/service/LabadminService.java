package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Labadmin;
import com.example.exception.CustomException;
import com.example.mapper.LabadminMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 实验室管理员业务处理
 **/
@Service
public class LabadminService {

    @Resource
    private LabadminMapper labadminMapper;

    /**
     * 新增
     */
    public void add(Labadmin labadmin) {
        Labadmin dbLabadmin = labadminMapper.selectByUsername(labadmin.getUsername());
        if (ObjectUtil.isNotNull(dbLabadmin)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        if (ObjectUtil.isEmpty(labadmin.getPassword())) {
            labadmin.setPassword(Constants.USER_DEFAULT_PASSWORD);
        }
        if (ObjectUtil.isEmpty(labadmin.getName())) {
            labadmin.setName(labadmin.getUsername());
        }
        labadmin.setRole(RoleEnum.LABADMIN.name());
        labadminMapper.insert(labadmin);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        labadminMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            labadminMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Labadmin labadmin) {
        labadminMapper.updateById(labadmin);
    }

    /**
     * 根据ID查询
     */
    public Labadmin selectById(Integer id) {
        return labadminMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Labadmin> selectAll(Labadmin labadmin) {
        return labadminMapper.selectAll(labadmin);
    }

    /**
     * 分页查询
     */
    public PageInfo<Labadmin> selectPage(Labadmin labadmin, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Labadmin> list = labadminMapper.selectAll(labadmin);
        return PageInfo.of(list);
    }

    /**
     * 登录
     */
    public Account login(Account account) {
        Account dbLabadmin = labadminMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbLabadmin)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbLabadmin.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbLabadmin.getId() + "-" + RoleEnum.LABADMIN.name();
        String token = TokenUtils.createToken(tokenData, dbLabadmin.getPassword());
        dbLabadmin.setToken(token);
        return dbLabadmin;
    }


    /**
     * 修改密码
     */
    public void updatePassword(Account account) {
        Labadmin dbLabadmin = labadminMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbLabadmin)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbLabadmin.getPassword())) {
            throw new CustomException(ResultCodeEnum.PARAM_PASSWORD_ERROR);
        }
        dbLabadmin.setPassword(account.getNewPassword());
        labadminMapper.updateById(dbLabadmin);
    }

}