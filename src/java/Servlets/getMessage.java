/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.StudentCourses;
import beans.message;
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
 * @author DELL
 */
@WebServlet(name = "getMessage", urlPatterns = {"/getMessage"})
public class getMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session1;
        SessionFactory sf;
        Boolean status = Boolean.FALSE;
        
        
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JSONObject obj = new JSONObject();
        String name = request.getParameter("name");
        
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        //out.print(name);
        List<Object[]> getMessage = session1.createSQLQuery("select * from message where receiver='"+name+"' and status='"+status+"'").list();
        tx.commit();
        session1.close();
        //out.print(getMessage.toString());
//        getMessage.forEach((o1) -> {
//                out.print(gson.toJson(o1));
//            });
            //msg = li.getMsg();
            //out.print(msg);
            //obj.put("msg",msg);
            
            out.print(gson.toJson(getMessage));
        
        response.setContentType("application/json");
        out.flush();
    }
}
