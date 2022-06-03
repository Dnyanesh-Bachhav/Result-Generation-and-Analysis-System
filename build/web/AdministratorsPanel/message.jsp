<%-- 
    Document   : message
    Created on : 18 Oct, 2020, 12:40:40 PM
    Author     : DELL
--%>

<%@page import="beans.Invigilator_details"%>
<%@page import="mainController.invigilatorsCon"%>
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
                margin: 5%;
            }
        </style>
    </head>
    <body>
        <%
            List<Invigilator_details> invigilatorList = AdminCon.getInvigilators();
            String name = (String)session.getAttribute("admin_uname");
        %>
        
        <form action='${pageContext.request.contextPath}/sendMessage'>
        <div class="form-group">
            <label>From:</label><br>
            <input type="text" id="sender" name="sender">
            <br><br>
        <label>To:</label>
        <select class="form-control" style="width: 400px;" name="invigilatorId">
            <option></option>
            <option>All</option>
            <%
                for(Invigilator_details list: invigilatorList)
                {
            %>
            <option><%=list.getInvigilatorId()%></option>
            <%
                }
            %>
        </select><br>
        <label>Message:</label><br>
        <textarea style="width: 500px;height: 200px;" name="msg"></textarea><br><br>
        <input type="text" name="date" id="date"><br><br>
        <button class="btn btn-success" type="submit">Send Message</button>
        </div>
        </form>
        <script>
            var date = new Date();
            document.getElementById("sender").value = "<%= name%>";
            document.getElementById("date").value = date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear();
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>
