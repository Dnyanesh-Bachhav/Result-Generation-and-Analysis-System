<%-- 
    Document   : getCourses
    Created on : 3 Aug, 2020, 11:35:00 AM
    Author     : DELL
--%>

<%@page import="beans.Admin_data"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
    </head>
    <body>
        <form action="courseTable.jsp" method="post">
        Year:
        <select name="year">
            <option>0</option>
            <option>1</option>
                <option>2</option>
                <option>3</option>
        </select>
        Branch:
        <select name="branch">
            <option></option>
            <option>IF</option>
            <option>CM</option>
            <option>CE</option>
            <option>ME</option>
            <option>EE</option>
        </select>
        Term:
        <select name="term">
            <option></option>
            <option>Odd</option>
            <option>Even</option>
        </select>
        <input type="submit">
        </form>
    </body>
</html>
