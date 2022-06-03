<%-- 
    Document   : Edit_Controller
    Created on : 15 Aug, 2020, 4:43:51 PM
    Author     : DELL
--%>

<%@page import="mainController.invigilatorsCon"%>
<%@page import="mainController.InvigilatorCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int roll = Integer.parseInt(request.getParameter("sid"));
            String course_code = request.getParameter("course_code");
            int pt = Integer.parseInt(request.getParameter("pt"));
            int th = Integer.parseInt(request.getParameter("th"));
            int tw = Integer.parseInt(request.getParameter("tw"));
            int pr = Integer.parseInt(request.getParameter("pr"));
            int or = Integer.parseInt(request.getParameter("or"));
            out.println(roll);
            out.println(course_code);
            out.println(pt);
            out.println(th);
            out.println(tw);
            out.println(pr);
            out.println(or);

//             InvigilatorCon.updateStudentAcademics(roll, course_code, pt, th, tw, pr, or);
//            System.out.println(pt);
//            
//            if(isTrue == true) 
//            response.sendRedirect("../InvigilatorPanel/getStudentsFromDB.jsp");
//            else
//            response.sendRedirect("../Error.html");
            
            invigilatorsCon.updatemarksDetails(roll, course_code, pt, th, pr, or, tw);
            session.removeAttribute("roll");
            session.removeAttribute("code");
            out.println("Updation Successfull");

//            String site = new String("Edit.jsp");
//            response.setStatus(response.SC_MOVED_TEMPORARILY);
//            response.setHeader("Location", site);
            
            //response.sendRedirect("getStudents.jsp");
        %>
    </body>
</html>
