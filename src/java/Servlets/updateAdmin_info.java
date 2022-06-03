/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.Admin_info;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "updateAdmin_info", urlPatterns = {"/updateAdmin_info"})
public class updateAdmin_info extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentSemester = request.getParameter("currentSemester");
        String currentExaminationYear = request.getParameter("currentExaminationYear");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JSONObject val = new JSONObject();
        Session session;
        SessionFactory sf;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        //session.createQuery("update Admin_info set currentTerm='"+currentSemester+"',currentExaminationYear='"+currentExaminationYear+"' where id=1");
        Admin_info obj1 = new Admin_info(1,currentSemester,currentExaminationYear);
        session.saveOrUpdate(obj1);
        tx.commit();
        session.close();
        val.put("message", "Update Successfully...");
        out.print(gson.toJson(val));
        //out.print("Update Successfully...");
        response.setContentType("application/json");
        out.flush();
        
    }
}
