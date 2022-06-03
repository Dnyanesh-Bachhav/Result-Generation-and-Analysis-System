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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "HodDataRetrieve", urlPatterns = {"/HodDataRetrieve"})
public class HodDataRetrieve extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    Session session1;
        SessionFactory sf;
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        //String uname = req.getParameter("uname");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Object[]> list = session1.createSQLQuery("select firstname,lastname,education,user,programme,shift,username from hod_data").list();
        tx.commit();
        session1.close();
        out.print(gson.toJson(list));
        response.setContentType("application/json");
        out.flush();

    }
}
