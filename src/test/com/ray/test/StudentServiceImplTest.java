package com.ray.test;

import com.ray.dao.StudentDao;
import com.ray.entity.Student;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
public class StudentServiceImplTest extends BaseTest{

    @Resource
    private StudentDao studentDao;

    @Test
    public void selectByStudent() {
        List<Student> students = studentDao.selectByStudent();
        for (Student student :
             students) {
            System.out.println(student);
        }
        System.out.println("size: " + students.size());
    }

    @Test
    public void selectByKey() {
        Student student = studentDao.selectByKey(1);
        System.out.println(student);
    }

    @Test
    public void insert() {
//        Student student = new Student(10,"Ray10",48,"Java2EE");
//        studentDao.insert(student);
        Student student = null;
        for(int i = 10; i < 50; i++){
            student = new Student();
            student.setId(i);
            student.setStu_id(i);
            student.setStu_name("Ray" + i);
            student.setStu_age(11 + i);
            student.setStu_major("Java" + i);
            studentDao.insert(student);
        }
    }

    @Test
    public void update() {
//        Student student = new Student(3,"Ray3",18,"Java2ee");
//        student.setId(2);
//        studentDao.update(student);
    }

    @Test
    public void delete() {
        studentDao.delete(3);
    }
}