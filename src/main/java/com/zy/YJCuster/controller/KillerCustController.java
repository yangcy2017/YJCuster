package com.zy.YJCuster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zy.YJCuster.entity.KillerCustEntity;
import com.zy.YJCuster.service.KillerCustService;
import com.zy.YJCuster.util.AjaxResult;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 1:08
 **/
@RestController
@RequestMapping(value = "/killer/cust", produces="application/json;charset=UTF-8")
public class KillerCustController {
    @Autowired
    private KillerCustService killerCustService;
    @RequestMapping("/add")
    public String addKillerCust(String name, String wx, String gender, String phone, String recommendWx){
        if(killerCustService.isExistByWx(wx)){
            return AjaxResult.instanceForError("微信号重复").toJsonString();
        }
        if(killerCustService.isExistByPhone(phone)){
            return AjaxResult.instanceForError("手机重复").toJsonString();
        }
        if(recommendWx != null && recommendWx.trim().length() > 0){
            if(!killerCustService.isExistByWx(recommendWx)){
                return AjaxResult.instanceForError("推荐人微信号不存在").toJsonString();
            }
        }

        killerCustService.saveKillerCust(name,  wx,  gender,  phone, recommendWx);
        return AjaxResult.instanceForSuccess().toJsonString();
    }
    @RequestMapping("/search")
    public String searchKillerCust(String keyword, String searchType){
        if(keyword == null || keyword.trim().length() == 0){
            return AjaxResult.instanceForError("缺少关键字").toJsonString();
        }
        List<KillerCustEntity> custs = killerCustService.searchKillerCust(keyword, searchType);
        if(custs == null || custs.isEmpty()){
            return AjaxResult.instanceForError("未能查到数据").toJsonString();
        }
        return AjaxResult.instanceForSuccess(custs).toJsonString();
    }
}
