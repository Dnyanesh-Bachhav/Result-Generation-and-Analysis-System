/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.Hod_data;
import beans.Invigilator_details;
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
@WebServlet(name = "HODUpdate", urlPatterns = {"/HODUpdate"})
public class HODUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session1;
        SessionFactory sf;
        String fname, lname, program, user, uname, education;
        int shift;
        PrintWriter out = response.getWriter();
//        JSONArray list = new JSONArray();
        JSONObject obj = new JSONObject();
        //response.setContentType("application/json");
        Gson gson = new Gson();
        String userId = request.getParameter("id");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Hod_data> details = session1.createQuery("from Hod_data where username='" + userId + "'").list();
        tx.commit();
        session1.close();

        for (Hod_data data : details) {
            fname = data.getFname();
            lname = data.getLname();
            program = data.getProgramme();
            education = data.getEducation();
            user = data.getUser();
            uname = data.getUsername();
            shift = data.getShift();
//            obj.put("uname", userId);
            obj.put("fname", fname);
            obj.put("lname", lname);
            obj.put("program", program);
            obj.put("education", education);
            obj.put("user", user);
            obj.put("username", uname);
            obj.put("shift", shift);
            //list.add(obj);
            out.print(gson.toJson(obj));
            //System.out.println(obj.toString());
        }
        response.setContentType("application/json");

        out.flush();

    }

}
