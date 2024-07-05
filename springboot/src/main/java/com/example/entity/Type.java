package com.example.entity;

import java.io.Serializable;

/**
 * 实验室分类表
*/
public class Type implements Serializable {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Integer id;
    private String name;
    private String descr;
    private Integer labadminId;

    private String labadminName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public Integer getLabadminId() {
        return labadminId;
    }

    public void setLabadminId(Integer labadminId) {
        this.labadminId = labadminId;
    }

    public String getLabadminName() {
        return labadminName;
    }

    public void setLabadminName(String labadminName) {
        this.labadminName = labadminName;
    }
}