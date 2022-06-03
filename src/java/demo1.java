
import beans.Courses;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mainController.AdminCon;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DELL
 */
public class demo1 {
    public static void main(String[] args) {
        AdminCon obj = new AdminCon();
        obj.getCoursesTable();
        Map<String,String> courseCodeList = new HashMap<>();
        List<Courses> list2 = AdminCon.getCoursesTable();
        for (Courses getCourse : list2) {
                courseCodeList.put(getCourse.getCourse_code(), getCourse.getCourse_name());
                     
                }
        
        System.out.println(courseCodeList.get("IF6238"));
    }
}
