/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.Invigilator_details;
import beans.StudentCourses;
import beans.message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mainController.AdminCon;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "sendMessage", urlPatterns = {"/sendMessage"})
public class sendMessage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sender = request.getParameter("sender");
        String msg = request.getParameter("msg");
        String date = request.getParameter("date");
        String receiver = request.getParameter("invigilatorId");
        PrintWriter out = response.getWriter();
        Session session = null;
        SessionFactory sf = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Invigilator_details> list = AdminCon.getInvigilators();
        if(receiver.equals("All"))
        {
        for(Invigilator_details li: list)
            {
            message obj = new message();
            obj.setMsg(msg);
            obj.setSender(sender);
            obj.setReceiver(li.getInvigilatorId());
            obj.setDate(date);
            obj.setStatus(Boolean.FALSE);
            session.save(obj);
            }
        }
        else{
        message obj = new message();
        obj.setMsg(msg);
        obj.setSender(sender);
        obj.setReceiver(receiver);
        obj.setDate(date);
        obj.setStatus(Boolean.FALSE);
        session.save(obj);
        }
        tx.commit();
        session.close();
        response.sendRedirect("AdministratorsPanel/message.jsp");
    }

}
