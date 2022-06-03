<%-- 
    Document   : try
    Created on : 4 Oct, 2020, 10:34:49 AM
    Author     : tppat
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
             Map<String, String> coursename = CourseList.getAllCourses();
             out.println(coursename.get("IF6240"));
             
        %>
        
    </body>
</html>
