package com.ray.service.impl;

import com.github.pagehelper.PageHelper;
import com.ray.dao.StudentDao;
import com.ray.entity.Student;
import com.ray.service.StudentService;
import com.ray.util.WriteExcel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
@Service("StudentService")
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentDao studentDao;

    @Override
    public List<Student> selectByStudent() {
        List<Student> students = studentDao.selectByStudent();
        return students;
    }

    @Override
    public Student selectByKey(int id) {
        Student student = studentDao.selectByKey(id);
        return student;
    }

    @Override
    public Student selectByStuId(int stu_id) {
        Student student = studentDao.selectByStuId(stu_id);
        return student;
    }

    @Override
    public void insert(Student student) {
        studentDao.insert(student);
    }

    @Override
    public void update(Student student) {
        studentDao.update(student);
    }

    @Override
    public void delete(int id) {
        studentDao.delete(id);
    }

    @Override
    public int getStudentNum() {
        List<Student> studentList = studentDao.selectByStudent();
        return studentList.size();
    }

    @Override
    public List<Student> getPageStudent(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize); // 分页核心代码
        List<Student> studentList = studentDao.selectByStudent();
        return studentList;
    }

    @Override
    public InputStream getInputStream() throws Exception {
        // 导出表的列名
        String[] title = new String[]{"编号", "学号", "姓名", "年龄", "科目"};
        // 获取所有学生信息
        List<Student> list = studentDao.selectByStudent();
        // 每行作为一个Object对象
        List<Object[]> dataList = new ArrayList<Object[]>();
        for(int i = 0; i < list.size(); i++){
            Object[] objects = new Object[5];
            objects[0] = list.get(i).getId();
            objects[1] = list.get(i).getStu_id();
            objects[2] = list.get(i).getStu_name();
            objects[3] = list.get(i).getStu_age();
            objects[4] = list.get(i).getStu_major();
            dataList.add(objects);
        }
        WriteExcel ex = new WriteExcel(title, dataList);
        InputStream in;
        // 导出数据
        in = ex.export();
        return in;
    }
}
