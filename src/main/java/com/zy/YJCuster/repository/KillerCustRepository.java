package com.zy.YJCuster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zy.YJCuster.entity.KillerCustEntity;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 0:48
 **/
@Repository
public interface KillerCustRepository extends JpaRepository<KillerCustEntity, String> {
    List<KillerCustEntity> findByNumber(String number);
    List<KillerCustEntity> findByName(String name);
    List<KillerCustEntity> findByPhone(String phone);
}
