/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.simple.JSONObject;

/**
 *
 * @author tppat
 */
@WebServlet(name = "Invigilator_Update", urlPatterns = {"/Invigilator_Update"})
public class Invigilator_Update extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session1;
        SessionFactory sf;
        String id, name, base, quali, desg, sub1, sub2, sub3, sub4;
        PrintWriter out = response.getWriter();
//        JSONArray list = new JSONArray();
        JSONObject obj = new JSONObject();
        //response.setContentType("application/json");
        Gson gson = new Gson();
        id = request.getParameter("sid");
        name = request.getParameter("name");
        base = request.getParameter("base");
        quali = request.getParameter("quali");
        desg = request.getParameter("desg");
        sub1 = request.getParameter("sub1");
        sub2 = request.getParameter("sub2");
        sub3 = request.getParameter("sub3");
        sub4 = request.getParameter("sub4");

        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        String hql2 = "update Invigilator_details id set id.invigilatorId=?,id.invigilatorName=?,id.invigilatorBase=?,id.qualification=?,id.designation=?,id.specializedSubject1=?,id.specializedSubject2=?,id.specializedSubject3=?,id.specializedSubject4=?  where id.invigilatorId=?";
        Query query2 = session1.createQuery(hql2);
        // Set  parameters
        query2.setParameter(0, id);
        query2.setParameter(1, name);
        query2.setParameter(2, base);
        query2.setParameter(3, quali);
        query2.setParameter(4, desg);
        query2.setParameter(5, sub1);
        query2.setParameter(6, sub2);
        query2.setParameter(7, sub3);
        query2.setParameter(8, sub4);
        query2.setParameter(9, id);
        

        query2.executeUpdate();
        tx.commit();
        session1.close();
        //response.setContentType("application/json");
        out.print("Updated Succesfully...!!!");
        out.flush();

    }

}
