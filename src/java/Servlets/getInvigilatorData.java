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
@WebServlet(name = "getInvigilatorData", urlPatterns = {"/getInvigilatorData"})
public class getInvigilatorData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session1;
        SessionFactory sf;
        String exp, quali, addr, pass, email;
        long phone_number, department;
        PrintWriter out = response.getWriter();
//        JSONArray list = new JSONArray();
        JSONObject obj = new JSONObject();
        //response.setContentType("application/json");
        Gson gson = new Gson();
        String userId = request.getParameter("username");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Invigilator_details> details = session1.createQuery("from Invigilator_details where invigilatorId='" + userId + "'").list();
        tx.commit();
        session1.close();

        for (Invigilator_details ind : details) {
            exp = ind.getExperience();
            quali = ind.getQualification();
            addr = ind.getAddress();
            pass = ind.getInvigilatorPassword();
            department = ind.getDepartment();
            email = ind.getEmailId();
            phone_number = ind.getContactNumber();
//            obj.put("uname", userId);
            obj.put("exp", exp);
            obj.put("quali", quali);
            obj.put("addr", addr);
            obj.put("pass", pass);
            obj.put("department", department);
            obj.put("email", email);
            obj.put("phone_number", phone_number);
            //list.add(obj);
            out.print(gson.toJson(obj));
            //System.out.println(obj.toString());
        }
        response.setContentType("application/json");

        out.flush();

    }

}
