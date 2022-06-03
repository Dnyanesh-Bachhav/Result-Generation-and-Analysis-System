<%-- 
    Document   : checkExamination
    Created on : 12 Jan, 2021, 3:04:34 PM
    Author     : DELL
--%>

<%@page import="beans.StudentCourses"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_info"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
        h1{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
    <body>
        <h1 class="mt-5 mb-5">Current Examination and Current Semester:</h1>
        <%
            String currentSemester = "";
            String currentExaminationYear = "";
            List<Admin_info> list = AdminCon.getAdmin_info();
            for(Admin_info li: list)
            {
                currentSemester = li.getCurrentTerm();
                currentExaminationYear = li.getCurrentExaminationYear();
            }
            
        %>
        <div class="container">
        <div class="card" style="width: 18rem;">
            <div class="card-header">Current</div>
            <div class="card-body">
              <h5 class="card-title">Semester</h5>
              <a href="#" class="btn btn-success"><%=currentSemester%></a>
            </div>
        </div>
        <div class="card m-5" style="width: 18rem;">
            <div class="card-header">Current</div>
            <div class="card-body">
              <h5 class="card-title">Examination Year</h5>
              <a href="#" class="btn btn-success"><%=currentExaminationYear%></a>
            </div>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"></script>
    </body>
</html>
