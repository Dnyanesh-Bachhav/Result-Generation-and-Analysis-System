<%-- 
    Document   : ResultAnalysis
    Created on : 21 Apr, 2021, 3:01:47 PM
    Author     : tppat
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Analysis</title>
    </head>
    <body>
        <form action="../HODPanel/AnalysisResult.jsp" method="post">
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
