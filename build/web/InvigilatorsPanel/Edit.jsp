<%-- 
    Document   : Edit
    Created on : 14 Aug, 2020, 12:04:37 PM
    Author     : DELL
--%>

<%@page import="mainController.invigilatorsCon"%>
<%@page import="java.util.Map"%>
<%@page import="HelpingClasses.SessionFact"%>
<%@page import="mainController.InvigilatorCon"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.StudentCourses"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            body{
                margin-left: 5%;
                margin-right: 5%;
            }
        </style>
    </head>
    <body>
        <br>
        <%!
            private static Session session1;
            private static SessionFactory sf;
        %>
        <%
            
            int roll = Integer.parseInt(request.getParameter("u"));
            //String Course_Code = (String)session.getAttribute("course_code");
            String Course_Code = (String)request.getParameter("v");
            session.setAttribute("roll", roll);
            session.setAttribute("courseId", Course_Code);
            Map<String, Integer> list2 = invigilatorsCon.getStudentCoursesByRollCode(roll, Course_Code);

        %>
        <form action="../Edit_Controller">
        <div class="form-group">
            <label>Name</label>
            <input type="text" name="roll" class="form-control" value='<%= roll%>'>
        </div>
        <input type="hidden" name="course_code" value='<%= Course_Code %>'>
        <div class="form-group">
            <label>PT</label>
            <input type="text" name="pt" class="form-control" value='<%= list2.get("Val1")%>'>
        </div>
        <div class="form-group">
            <label>TH</label>
            <input type="text" name="th" class="form-control" value='<%= list2.get("Val2")%>'>
        </div>
        <div class="form-group">
            <label>TW</label>
            <input type="text" name="tw" class="form-control" value='<%= list2.get("Val3")%>'>
        </div>
        <div class="form-group">
            <label>PR</label>
            <input type="text" name="pr" class="form-control" value='<%= list2.get("Val4")%>'>
        </div>
        <div class="form-group">
            <label>OR</label>
            <input type="text" name="or" class="form-control" value='<%= list2.get("Val5")%>'>
        </div>
        
        
        
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="getStudents.jsp" class="btn btn-default">Back</a>
        </form>
         <%
            }
        %>       

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>
