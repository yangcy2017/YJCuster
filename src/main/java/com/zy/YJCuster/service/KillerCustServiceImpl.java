package com.zy.YJCuster.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.YJCuster.entity.CustRelaEntity;
import com.zy.YJCuster.entity.KillerCustEntity;
import com.zy.YJCuster.repository.CustRelaRepository;
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
    @Autowired
    private CustRelaRepository custRelaRepository;
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveKillerCust(String name, String wx, String gender, String phone, String recommendWx){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(new Date());

        KillerCustEntity killerCustEntity = new KillerCustEntity();
        killerCustEntity.setName(name);
        killerCustEntity.setNumber(wx);
        killerCustEntity.setGender(gender);
        killerCustEntity.setPhone(phone);
        killerCustEntity.setFtime(time);
        killerCustRepository.save(killerCustEntity);
        if(recommendWx != null && recommendWx.trim().length() > 0){
            CustRelaEntity custRelaEntity = new CustRelaEntity();
            custRelaEntity.setCustNumber(wx);
            custRelaEntity.setRelaCustNumber(recommendWx);
            custRelaEntity.setTime(time);
            custRelaRepository.save(custRelaEntity);
        }
    }
    @Override
    public List<KillerCustEntity> searchKillerCust(String keyword, String searchType){
        List<KillerCustEntity> custs = killerCustRepository.findByName(keyword);
        switch (searchType){
            case "wx":
                custs = killerCustRepository.findByNumber(keyword);
                break;
            case "name":
                custs = killerCustRepository.findByName(keyword);
                break;
            case "phone":
                custs = killerCustRepository.findByPhone(keyword);
                break;
            default:break;
        }
        return custs;
    }
    @Override
    public boolean  isExistByWx(String wx){
        if(wx == null || wx.trim().length() == 0){
            return false;
        }
        List<KillerCustEntity> byNumber = killerCustRepository.findByNumber(wx);
        if(byNumber == null || byNumber.isEmpty()){
            return false;
        }else{
            return true;
        }

    }
    @Override
    public boolean  isExistByPhone(String phone){
        if(phone == null || phone.trim().length() == 0){
            return false;
        }
        List<KillerCustEntity> byPhone = killerCustRepository.findByPhone(phone);
        if(byPhone == null || byPhone.isEmpty()){
            return false;
        }else{
            return true;
        }

    }


}
