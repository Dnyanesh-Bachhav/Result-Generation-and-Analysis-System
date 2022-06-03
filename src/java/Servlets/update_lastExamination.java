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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "update_lastExamination", urlPatterns = {"/update_lastExamination"})
public class update_lastExamination extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentSemester = request.getParameter("currentSemester");
        String currentExaminationYear = request.getParameter("currentExaminationYear"); 
        String lastExaminationYear = request.getParameter("lastExaminationYear");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JSONObject val = new JSONObject();
        Session session;
        SessionFactory sf;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        //session.createQuery("update Admin_info set currentTerm='"+currentSemester+"',currentExaminationYear='"+currentExaminationYear+"' where id=1");
        Query query = session.createQuery("update Admin_info o set o.lastExaminationYear = '"+lastExaminationYear+"' where o.id=1");
        query.executeUpdate();
        tx.commit();
        session.close();
//                val.put("message", "Update Successfully...");
val.put("message", lastExaminationYear);
        out.print(gson.toJson(val));
        //out.print("Update Successfully...");
        response.setContentType("application/json");
        out.flush();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
