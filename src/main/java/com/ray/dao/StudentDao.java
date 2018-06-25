package com.ray.dao;

import com.ray.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Ray
 * @date 2018/6/23 0023
 * 对数据库相关操作的封装
 */
public interface StudentDao {

    /**
     * 查询所有学生信息
     */
    List<Student> selectByStudent();

    /**
     * 根据编号查询学生信息
     */
    Student selectByKey(@Param("id") int id);

    /**
     *  根据学号查询学生信息
     */
    Student selectByStuId(@Param("stu_id") int stu_id);

    /**
     * 新增学生信息
     */
    void insert(Student student);

    /**
     * 修改学生信息
     */
    void update(Student student);

    /**
     * 删除学生信息
     */
    void delete(@Param("id") int id);
}
