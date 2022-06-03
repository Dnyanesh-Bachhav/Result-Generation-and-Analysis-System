package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import HelpingClasses.SessionFact;
import beans.StudentCourses;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Edit_Controller1", urlPatterns = {"/Edit_Controller1"})
public class Edit_Controller1 extends HttpServlet {

        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session1;
        SessionFactory sf;
        String pt,th;
        int tw,or,pr,roll1;
        PrintWriter out = response.getWriter();
//        JSONArray list = new JSONArray();
        JSONObject obj = new JSONObject();
        //response.setContentType("application/json");
        Gson gson = new Gson();
        int roll = Integer.parseInt(request.getParameter("sid"));
        String courseId = request.getParameter("courseId");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<StudentCourses> getStudentCourses = session1.createQuery("from StudentCourses where studentId='"+roll+"' and courseCode='"+courseId+"'").list();
        tx.commit();
        session1.close();
        
     
       
        for(StudentCourses st: getStudentCourses)
        {
            roll1 = st.getStudentId();
            pt = st.getPeriodicTest();
            th = st.getTheory();
            tw = st.getTermwork();
            pr = st.getPractical();
            or = st.getOral();
            obj.put("pt", pt);
            obj.put("th", th);
            obj.put("tw", tw);
            obj.put("pr", pr);
            obj.put("or", or);
            //list.add(obj);
            out.print(gson.toJson(st));
            //System.out.println(obj.toString());
        }
        response.setContentType("application/json");

        out.flush();


    }
    
}
