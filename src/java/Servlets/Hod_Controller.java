/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.Hod_data;
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
import org.json.simple.JSONObject;

/**
 *
 * @author tppat
 */
@WebServlet(name = "Hod_Controller", urlPatterns = {"/Hod_Controller"})
public class Hod_Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         Session session1;
        SessionFactory sf;
        String uname1,lname,education,user,programme;
        int shift;
        PrintWriter out = resp.getWriter();
//        JSONArray list = new JSONArray();
        JSONObject obj = new JSONObject();
        //response.setContentType("application/json");
        Gson gson = new Gson();
         String uname = req.getParameter("id");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Hod_data> hoddata = session1.createQuery("from Hod_data where username='"+uname+"'").list();
        tx.commit();
        session1.close();
       // sf.close();
        
     
       
        for(Hod_data st: hoddata)
        {
            uname1 = st.getUsername();
            lname = st.getLname();
            education = st.getEducation();
            user = st.getUser();
            programme = st.getProgramme();
            shift = st.getShift();
            
            obj.put("uname", uname1);
            obj.put("lname",lname);
            obj.put("education", education);
            obj.put("user", user);
            obj.put("dept", programme);
            obj.put("shift", shift);
            //list.add(obj);
            out.print(gson.toJson(st));
            //System.out.println(obj.toString());
        }
        resp.setContentType("application/json");

        out.flush();


    }
    
}
