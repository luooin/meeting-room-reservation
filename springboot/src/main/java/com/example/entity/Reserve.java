package com.example.entity;

import java.io.Serializable;

/**
 * 预约信息表
*/
public class Reserve implements Serializable {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Integer id;
    private Integer labId;
    private Integer labadminId;
    private Integer studentId;
    private String time;
    private String status;
    private String dostatus;

    private String labName;
    private String labadminName;
    private String studentName;
    private String start;
    private String end;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLabId() {
        return labId;
    }

    public void setLabId(Integer labId) {
        this.labId = labId;
    }

    public Integer getLabadminId() {
        return labadminId;
    }

    public void setLabadminId(Integer labadminId) {
        this.labadminId = labadminId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDostatus() {
        return dostatus;
    }

    public void setDostatus(String dostatus) {
        this.dostatus = dostatus;
    }

    public String getLabName() {
        return labName;
    }

    public void setLabName(String labName) {
        this.labName = labName;
    }

    public String getLabadminName() {
        return labadminName;
    }

    public void setLabadminName(String labadminName) {
        this.labadminName = labadminName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
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
}