/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.Invigilator_details;
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
@WebServlet(name = "Invigilator_Edit", urlPatterns = {"/Invigilator_Edit"})
public class Invigilator_Edit extends HttpServlet {

    @Override
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
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Invigilator_details> getDetails = session1.createQuery("from Invigilator_details where invigilatorId='" + id + "'").list();
        tx.commit();
        session1.close();

        for (Invigilator_details id2: getDetails) {
            id = id2.getInvigilatorId();
            name = id2.getInvigilatorName();
            base = id2.getInvigilatorBase();
            quali = id2.getQualification();
            desg = id2.getDesignation();
            sub1 = id2.getSpecializedSubject1();
            sub2 = id2.getSpecializedSubject2();
            sub3 = id2.getSpecializedSubject3();
            sub4 = id2.getSpecializedSubject4();
            obj.put("id", id);
            obj.put("name", name);
            obj.put("base", base);
            obj.put("quali", quali);
            obj.put("desg", desg);
            obj.put("sub1",sub1);
            obj.put("sub2", sub2);
            obj.put("sub3", sub3);
            obj.put("sub4", sub4);
            
            //list.add(obj);
            out.print(gson.toJson(id2));
            //System.out.println(obj.toString());
        }
        response.setContentType("application/json");

        out.flush();

    }

}
