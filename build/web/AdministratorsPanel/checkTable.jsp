<%-- 
    Document   : checkTable
    Created on : 12 Jan, 2021, 5:13:50 PM
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
        <title>Check Exam</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <style>
        h1{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        body{
            margin: 5%;
        }
    </style>
    <body>
        <h1 class="mb-5">All new Records from Exam Registration Table:</h1>
        <%
            String currentExaminationYear = "";
            List<Admin_info> list = AdminCon.getAdmin_info();
            for(Admin_info li: list)
            {
                currentExaminationYear = li.getCurrentExaminationYear();
            }
            
        %>
        <table id="table1" class="table table-dark table-hover table-sripped">
            <thead>
                <tr>
                    <!--<th>ID</th>-->
                    <th>Roll No.</th>
                    <th>Course Code</th>
                    <th>PT</th>
                    <th>TH</th>
                    <th>TW</th>
                    <th>PR</th>
                    <th>OR</th>
                </tr>
            </thead>
            <tbody id="tbody">
                <%
                    List<StudentCourses> list2 = AdminCon.getStudentCoursesForCurrentAcademics(currentExaminationYear);
                    for (StudentCourses obj : list2) {

                %>
                <tr>
                    <td><%=obj.getStudentId()%></td>
                    <td><%=obj.getCourseCode()%></td>
                    <td><%=obj.getPeriodicTest()%></td>
                    <td><%=obj.getTheory()%></td>
                    <td><%=obj.getTermwork()%></td>
                    <td><%=obj.getPractical()%></td>
                    <td><%=obj.getOral()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</html>
