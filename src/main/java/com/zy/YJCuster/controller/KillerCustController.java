package com.zy.YJCuster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zy.YJCuster.service.KillerCustService;
import com.zy.YJCuster.util.AjaxResult;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 1:08
 **/
@RestController
@RequestMapping("/killer/cust")
public class KillerCustController {
    @Autowired
    private KillerCustService killerCustService;
    @RequestMapping("/add")
    public AjaxResult addKillerCust(String name, String wx, String gender, String phone, String recommendWx){



        killerCustService.saveKillerCust(name,  wx,  gender,  phone, recommendWx);
        return AjaxResult.instanceForSuccess();
    }

}
