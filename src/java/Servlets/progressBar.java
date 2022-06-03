/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import beans.Courses;
import beans.Invigilator_details;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mainController.invigilatorsCon;
import org.hibernate.Session;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "progressBar", urlPatterns = {"/progressBar"})
public class progressBar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
            int[] pt = new int[2];
            int[] th = new int[2];
            int[] pr = new int[2];
            int[] or = new int[2];
            int[] tw = new int[2];
            int ptAverage = 0;
            int thAverage = 0;
            int prOrTwAverage = 0;
            HttpSession session = request.getSession();
            Gson gson = new Gson();
            JSONObject obj = new JSONObject();
            String name = request.getParameter("uname");
            List<String> array = new ArrayList<>();
            List<String> array2 = new ArrayList<>();
            List<Integer> ptList = new ArrayList<>();
            List<Integer> thList = new ArrayList<>();
            List<Integer> prList = new ArrayList<>();
            List<Integer> orList = new ArrayList<>();
            List<Integer> twList = new ArrayList<>();
            PrintWriter out = response.getWriter();
            List<Invigilator_details> li = invigilatorsCon.getInvigilatorDetails(name);
            //out.print(sub);
             //           out.print(name);

            for(Invigilator_details item: li)
            {
                array.add(item.getSpecializedSubject1());
                array.add(item.getSpecializedSubject2());
                array.add(item.getSpecializedSubject3());
                array.add(item.getSpecializedSubject4());
            }
            // out.print(array.get(0));
            int code = Integer.parseInt(request.getParameter("code"));
           // out.print(code);
            //out.println(course_name);
            if(!array.get(0).equals("None"))
            {
            //List<Courses> courseId_1 = invigilatorsCon.getCourseCodeByCourseName(array.get(0), code);
           // out.print("List: "+ array.get(0));
            array2.add(array.get(0));
            }
            if(!array.get(1).equals("None"))
            {
            //List<Courses> courseId_2 = invigilatorsCon.getCourseCodeByCourseName(array.get(1), code);
            //out.print("List: "+courseId_2.get(0).getCourse_code());
            array2.add(array.get(1));
            }
            if(!array.get(2).equals("None"))
            {
            //List<Courses> courseId_3 = invigilatorsCon.getCourseCodeByCourseName(array.get(2), code);
            //out.print("List: "+courseId_3.get(0).getCourse_code());
            array2.add(array.get(2));
            }
            if(!array.get(3).equals("None"))
            {
            //List<Courses> courseId_4 = invigilatorsCon.getCourseCodeByCourseName(array.get(3), code);
            //out.print("List: "+courseId_4.get(0).getCourse_code());
            array2.add(array.get(3));
            }
            
            for (int i = 0; i < array2.size(); i++) 
            {
                if(!array2.get(i).equals("None"))
                {                    
                    pt = invigilatorsCon.getCountOfPT(array2.get(i));
                    //Periodic Test
                    float pt1 = (float)pt[1]/pt[0];
                    int pt2 = Math.round(pt1*100);
                    ptList.add(pt2);
                    
                    th = invigilatorsCon.getCountOfTH(array2.get(i));
                    //Theory
                    float th1 = (float)th[1]/th[0];
                    int th2 = Math.round(th1*100);
                    thList.add(th2);
                    
                    pr = invigilatorsCon.getCountOfPractical(array2.get(i));
                    //Practical
                    float pr1 = (float)pr[1]/pr[0];
                    int pr2 = Math.round(pr1*100);
                    prList.add(pr2);
                    
                    or = invigilatorsCon.getCountOfOral(array2.get(i));
                    //Oral
                    float or1 = (float)or[1]/or[0];
                    int or2 = Math.round(or1*100);
                    orList.add(or2);
                    
                    tw = invigilatorsCon.getCountOfTermwork(array2.get(i));
                    //Termwork
                    float tw1 = (float)tw[1]/tw[0];
                    int tw2 = Math.round(tw1*100);
                    twList.add(tw2);
                }
            }
//            out.println(ptList);
//            out.println(thList);
//            out.println(prList);
//            out.println(orList);
//            out.println(twList);
            ptAverage = Math.round((ptList.get(0)+ptList.get(1)+ptList.get(2))/3);
            thAverage = Math.round((thList.get(0)+thList.get(1)+thList.get(2))/3);
            prOrTwAverage = Math.round((prList.get(0)+prList.get(1)+prList.get(2)+orList.get(0)+orList.get(1)+orList.get(2)+twList.get(0)+twList.get(1)+twList.get(2))/9);
//            out.println(ptAverage);
//            out.println(thAverage);
//            out.println(prOrTwAverage);
            
            
            obj.put("ptAverage", ptAverage);
            obj.put("thAverage", thAverage);
            obj.put("prOrTwAverage", prOrTwAverage);
            out.println(gson.toJson(obj));
            response.setContentType("application/json");

            out.flush();
            
            
            
            
            
            
            
            
            
    }
}
