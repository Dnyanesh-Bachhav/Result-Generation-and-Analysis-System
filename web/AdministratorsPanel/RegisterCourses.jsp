<%-- 
    Document   : RegisterCourses
    Created on : 24 Apr, 2021, 1:04:10 PM
    Author     : tppat
--%>

<%@page import="java.util.Map"%>
<%@page import="beans.Exam_reg"%>
<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Courses</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%!
            int rollno;
        %>

        <%  rollno = Integer.parseInt(request.getParameter("rollno"));%>
        <div class="text-center" style="margin-top: 30px;"><h1>Student's Registered Courses</h1></div><br>
        <div class="container" style="border: 1px solid black; padding: 30px; border-radius: 20px;"> 
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Roll No:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control border-0"  id="invigilatorName"  value="<%=rollno%>" readonly>
            </div>
        </div>
        <%
            List<Exam_reg> list = AdminCon.getRegisteredCoursesByRoll(rollno);
            Map<String, String> coursename = AdminCon.courseCodeList();
            int i = 1;
            for (Exam_reg li : list) {
                

        %>
        <br>
        <div class="form-group">
            <label class="control-label col-sm-2 " for="name">Courses &nbsp;<%= i%></label>
            <div class="col-sm-10">
                <input type="text" class="form-control "  id="invigilatorName"  value="<%=coursename.get(li.getCourse_code() ) %>" readonly>
            </div>
        </div>
        <%
                i++;
            }
        %>
        </div>
    </body>
</html>
