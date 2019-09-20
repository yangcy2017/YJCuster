package com.zy.YJCuster.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.YJCuster.repository.KillerCustRepository;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 0:56
 **/
@Service
public class KillerCustServiceImpl implements KillerCustService{
    @Autowired
    private KillerCustRepository killerCustRepository;

    @Override
    public void saveKillerCust(String name, String wx, String gender, String phone, String recommendWx){




    }




}
