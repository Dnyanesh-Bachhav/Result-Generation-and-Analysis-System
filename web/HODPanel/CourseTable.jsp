<%-- 
    Document   : Get Coureses of specific department
    Created on : 13 Aug, 2020, 6:00:06 PM
    Author     : tppat
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
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
        <%@include file="getcourses.jsp" %>
        <table class="table table-dark table-striped table-hover table-bordered mt-5">
            <thead>
            <tr>
                <th>ID</th>
                <th>Year</th>
                <th>Branch</th>
                <th>Term</th>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Course Credits</th>
                <th>Actions</th>
            </tr>
            </thead>
            <%
                int year = Integer.parseInt(request.getParameter("year"));
                String branch = request.getParameter("branch");
                String term = request.getParameter("term");
                List<Courses> getCoursesList = HodCon.getCourses(year, branch, term);
                for (Courses list : getCoursesList) {

            %>
            <tr>
                <td><%= list.getId()%></td>
                <td><%= list.getYear()%></td>
                <td><%= list.getProgramme()%></td>
                <td><%= list.getTerm()%></td>
                <td><%= list.getCourse_code()%></td>
                <td><%= list.getCourse_name()%></td>
                <td><%= list.getCou_credit()%></td>
                <td><button class="btn btn-primary">GetStudents</button></td>
            </tr>
            <%
                }
            %>
        </table>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>