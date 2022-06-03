<%-- 
    Document   : checkExam_regNumber
    Created on : 30 Oct, 2020, 11:09:59 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Exam_regNumber.jsp" method="post">
        Year:
        <select name="year">
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
            <option>Odd</option>
            <option>Even</option>
        </select>
        <input type="submit">
        </form>
    </body>
</html>
