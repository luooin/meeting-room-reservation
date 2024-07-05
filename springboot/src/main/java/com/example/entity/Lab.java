package com.example.entity;

import java.io.Serializable;

/**
 * 实验室信息表
*/
public class Lab implements Serializable {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Integer id;
    private String name;
    private String descr;
    private String start;
    private String end;
    private String status;
    private Integer typeId;
    private Integer labadminId;

    private String typeName;
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

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getLabadminId() {
        return labadminId;
    }

    public void setLabadminId(Integer labadminId) {
        this.labadminId = labadminId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getLabadminName() {
        return labadminName;
    }

    public void setLabadminName(String labadminName) {
        this.labadminName = labadminName;
    }
}