package com.ray.controller;

import com.ray.entity.Student;
import com.ray.entity.StudentGrid;
import com.ray.service.StudentService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.List;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
@Controller
@RequestMapping("/stu")
public class StudentController {

    @Resource
    private StudentService studentService;

    /**
     * 显示学生信息列表页面
     */
    @RequestMapping(value = "/student/stuList" , method = RequestMethod.GET)
    public String stuList(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("username") != null){
            return "/student/studentList";
        }
        return "redirect:/user/login";
    }

    /**
     *  显示所有学生信息列表 + 分页
     */
    @RequestMapping(value = "/stuList", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public StudentGrid getStuList(@RequestParam("current") int current, @RequestParam("rowCount") int rowCount){
        // 获取学生数量
        int total = studentService.getStudentNum();
        // 包含学生信息 + 分页
        List<Student> studentList = studentService.getPageStudent(current, rowCount);
        StudentGrid studentGrid = new StudentGrid();
        // 当前页面号
        studentGrid.setCurrent(current);
        // 每页行数
        studentGrid.setRowCount(rowCount);
        // 学生信息
        studentGrid.setRows(studentList);
        //总行数
        studentGrid.setTotal(total);
        return studentGrid;
    }

    /**
     * 根据 id 获取学生信息
     */
    @RequestMapping(value = "/getStuInfo", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Student getStuById(@RequestParam("id") int id){
        Student student = studentService.selectByKey(id);
        return student;
    }

    /**
     *  修改学生信息(使用构造器)
     */
    @RequestMapping(value = "/updateStu", method = RequestMethod.POST)
    public String update(@RequestParam("id") int id,
                         @RequestParam("stu_id") int stu_id,
                         @RequestParam("stu_name") String stu_name,
                         @RequestParam("stu_age") int stu_age,
                         @RequestParam("stu_major") String stu_major){
        Student student = new Student(id, stu_id, stu_name, stu_age, stu_major);
        studentService.update(student);
        return "redirect:student/stuList";
    }

    /**
     * 删除学生信息(id)
     */
    @RequestMapping(value = "/delStu", method = RequestMethod.POST)
    public String delete(@RequestParam("id") int id){
        System.out.println("del_id: " + id);
        studentService.delete(id);
        return "redirect:student/stuList";
    }

    /**
     * 新增学生信息
     */
    @RequestMapping(value = "/addStu", method = RequestMethod.POST)
    public String add(@RequestParam("stu_id") int stu_id,
                      @RequestParam("stu_name") String stu_name,
                      @RequestParam("stu_age") int stu_age,
                      @RequestParam("stu_major") String stu_major,
                      HttpServletRequest request){
        if(studentService.selectByStuId(stu_id) == null) {
            Student student = new Student(stu_id, stu_name, stu_age, stu_major);
            studentService.insert(student);
            HttpSession session = request.getSession();
            System.out.println("新增学生成功");
            return "redirect:student/stuList";
        }
        System.out.println("新增学生失败");
        return "redirect:student/stuList";
    }

    /**
     * 导出学生信息 Excel
     */
    @RequestMapping("/exportStu")
    public void export(HttpServletResponse response) throws Exception {
        InputStream is = studentService.getInputStream();
        // 使客户端浏览器 区分不同种类的数据, 并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        // Content-Disposition中指定的类型是文件的扩展名，并且弹出的下载对话框中的文件类型图片是按照文件的扩展名显示的，点保存后，文件以filename的值命名，保存类型以Content中设置的为准。
        response.setHeader("Content-Disposition", "attachment;filename=AllStudents.xls");
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(is, output);
    }
}
