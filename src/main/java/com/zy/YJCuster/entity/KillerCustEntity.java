package com.zy.YJCuster.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Description 客户表
 * @Author yangcy
 * @Date 2019/9/21 0:35
 **/
@Entity
@Table(name = "killer_cust")
public class KillerCustEntity {
    @Column(name = "cust_name")
    private String name;
    @Id
    @Column(name = "cust_number")
    private String number;
    @Column(name = "cust_gender")
    private String gender;
    @Column(name = "cust_phone")
    private String phone;
    @Column(name = "cust_ftime")
    private String ftime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime;
    }
}
