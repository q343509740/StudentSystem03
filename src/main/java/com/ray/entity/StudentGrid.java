package com.ray.entity;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * @author Ray
 * @date 2018/6/23 0023
 * 当使用 @XmlRootElement 注释对顶层类或枚举类型进行注释时，类型值被表示为 XML 文档中的 XML 元素
 */
@XmlRootElement
public class StudentGrid {

    private int current; // 当前页面号
    private int rowCount; // 每页行数
    private int total; //总行数
    private List<Student> rows; //学生信息

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Student> getRows() {
        return rows;
    }

    public void setRows(List<Student> rows) {
        this.rows = rows;
    }
}
