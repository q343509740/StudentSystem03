package com.ray.entity;

/**
 * @author Ray
 * @date 2018/6/23 0023
 * 表中字段名应该和实体类中的名称一一对应
 */
public class Student {
    private int id;
    private int stu_id;
    private String stu_name;
    private int stu_age;
    private String stu_major;

    public Student() {
    }

    public Student(int stu_id, String stu_name, int stu_age, String stu_major) {
        this.stu_id = stu_id;
        this.stu_name = stu_name;
        this.stu_age = stu_age;
        this.stu_major = stu_major;
    }

    public Student(int id, int stu_id, String stu_name, int stu_age, String stu_major) {
        this.id = id;
        this.stu_id = stu_id;
        this.stu_name = stu_name;
        this.stu_age = stu_age;
        this.stu_major = stu_major;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", stu_id=" + stu_id +
                ", stu_name='" + stu_name + '\'' +
                ", stu_age=" + stu_age +
                ", stu_major='" + stu_major + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public int getStu_age() {
        return stu_age;
    }

    public void setStu_age(int stu_age) {
        this.stu_age = stu_age;
    }

    public String getStu_major() {
        return stu_major;
    }

    public void setStu_major(String stu_major) {
        this.stu_major = stu_major;
    }
}
