package com.example.common.enums;

public enum StatusEnum {

    OK("空闲中"),
    NO("使用中"),
    ;

    public String status;

    StatusEnum(String status) {
        this.status = status;
    }
}
