<%-- 
    Document   : viewInvigilators
    Created on : 4 Aug, 2020, 12:02:05 PM
    Author     : DELL
--%>

<%@page import="beans.Invigilator_details"%>
<%@page import="mainController.AdminCon"%>
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
        <table class="table table-dark table-striped table-hover table-bordered mt-5">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Qualification</th>
                <th>Specialized Subject</th>
                <th>Contact Number</th>
                <th>Designation</th>
            </tr>
            </thead>
            <%
                List<Invigilator_details> getInvigilators = AdminCon.getInvigilators();
                for (Invigilator_details list : getInvigilators) {

            %>
            <tr>
                <td><%= list.getInvigilatorId()%></td>
                <td><%= list.getInvigilatorName()%></td>
                <td><%= list.getDepartment()%></td>
                <td><%= list.getQualification()%></td>
                <td><%= list.getSpecializedSubject1()%></td>
                <td><%= list.getContactNumber()%></td>
                <td><%= list.getDesignation()%></td>
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
