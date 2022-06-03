<%-- 
    Document   : checkResultTable
    Created on : 19 Apr, 2021, 2:31:36 PM
    Author     : DELL
--%>

<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_info"%>
<%@page import="beans.Result2"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../css/datatable_css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="../js/jquery-3.5.1.min.js"></script>
        <script src="../js/jquery.dataTables.min.js"></script>
        <style>
            body{
                margin: 40px;
            }
        </style>
    </head>
    <body>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Roll No</td>
                    <td>Name</td>
                    <td>Backlog Count</td>
                    <td>Current Credits</td>
                    <td>Out Of Marks</td>
                    <td>Total Marks</td>
                </tr>
            </thead>
            
            <tbody>
                <%
                    List<Result2> list = AdminCon.getStudent_Result();
                    for(Result2 li: list)
                    {
                %>
                <tr>
                    <td><%=li.getId()%></td>
                    <td><%=li.getRoll_no()%></td>
                    <td><%=li.getStudent_name()%></td>
                    <td><%=li.getBacklog_count()%></td>
                    <td><%=li.getCurrent_credits()%></td>
                    <td><%=li.getOutof_marks()%></td>
                    <td><%=li.getTotal_marks()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
            <script>
                $("table").DataTable();
            </script>
    </body>
</html>
