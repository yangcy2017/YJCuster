package com.zy.YJCuster.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zy.YJCuster.entity.CustRelaEntity;

/**
 * @Description TODO
 * @Author yangcy
 * @Date 2019/9/21 21:56
 **/
@Repository
public interface CustRelaRepository  extends JpaRepository<CustRelaEntity, String> {



}
