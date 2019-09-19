package com.zy.YJCuster.repository;

import com.zy.YJCuster.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Repository // 添加注解
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    /**
     * @param firstName
     * @param qLastName
     * @param password
     * @param id
     */
    // 说明该方法是修改操作
    @Modifying
    // 说明该方法是事务性操作
    @Transactional(rollbackFor = Exception.class)
    // @Param注解用于提取参数
    @Query("update UserEntity us set us.firstName=:qFirstName, us.lastName=:qLastName, us.password=:qPassword where us.id=:qId")
    void updateUser(@Param("qFirstName") String firstName,
                    @Param("qLastName") String qLastName,
                    @Param("qPassword") String password,
                    @Param("qId") Integer id);

    UserEntity findById(Integer userId);
}