<%-- 
    Document   : try1
    Created on : 4 Oct, 2020, 1:06:49 PM
    Author     : tppat
--%>

<%@page import="mainController.HodCon.getCourses(int, String, String)"%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Try Page</title>
    </head>
    <body>
        <h1>Here You Can Perform Any Operation Releted To the Project </h1>
        <%--!
         String[] coursecode =null;
         int i = 0;
        --%>    
        
        <%
                
                int year = Integer.parseInt(request.getParameter("year"));
                String branch = request.getParameter("branch");
                String term = request.getParameter("term");
                List<Courses> getCoursesList = HodCon.getCourses(year, branch, term);
                out.println(getCoursesList.size());
                
                for (Courses list : getCoursesList) {
                           
                    out.println(list.getC_name());
                    
//                 
            
            }
            %>
           
    </body>
</html>
