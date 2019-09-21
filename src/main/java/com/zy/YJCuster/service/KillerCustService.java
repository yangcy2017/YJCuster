package com.zy.YJCuster.service;

import java.util.List;

import com.zy.YJCuster.entity.KillerCustEntity;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 0:55
 **/
public interface KillerCustService {
    void saveKillerCust(String name, String wx, String gender, String phone, String recommendWx);

    List<KillerCustEntity> searchKillerCust(String keyword, String searchType);

    boolean  isExistByWx(String wx);

    boolean  isExistByPhone(String phone);
}
