package com.zy.YJCuster.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 21:48
 **/
@Entity
@Table(name = "cust_rela")
public class CustRelaEntity {
    @Id
    @Column(name = "cust_number")
    private String custNumber;
    @Column(name = "rela_cust_number")
    private String relaCustNumber;
    @Column(name = "rela_cust_kill_time")
    private String time;

    public String getCustNumber() {
        return custNumber;
    }

    public void setCustNumber(String custNumber) {
        this.custNumber = custNumber;
    }

    public String getRelaCustNumber() {
        return relaCustNumber;
    }

    public void setRelaCustNumber(String relaCustNumber) {
        this.relaCustNumber = relaCustNumber;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
