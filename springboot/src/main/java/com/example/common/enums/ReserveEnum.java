package com.example.common.enums;

public enum ReserveEnum {
    OK("审核通过"),
    NO("审核不通过"),
    DONE("已结束"),
    ;

    public String status;

    ReserveEnum(String status) {
        this.status = status;
    }
}
