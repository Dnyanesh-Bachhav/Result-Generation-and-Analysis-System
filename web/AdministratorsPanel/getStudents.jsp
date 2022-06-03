<%-- 
    Document   : getStudents
    Created on : 4 Aug, 2020, 10:21:48 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Students</title>
    </head>
    <body>
        <form action="studentsTable.jsp" method="post">
        Year:
        <select name="year">
            <option>1</option>
                <option>2</option>
                <option>3</option>
        </select>
        Branch:
        <select name="branch">
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
