<%-- 
    Document   : importExam_reg (Register students import page)
    Created on : 12 Jan, 2021, 3:09:54 PM
    Author     : DELL
--%>

<%@page import="beans.Admin_info"%>
<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Import Examination</title>
    </head>
    <body>
        <%
            String currentSemester = "";
            String currentExaminationYear = "";
            String message = "import successful";
            List<Admin_info> list = AdminCon.getAdmin_info();
            for(Admin_info li: list)
            {
                currentSemester = li.getCurrentTerm();
                currentExaminationYear = li.getCurrentExaminationYear();
                out.print(currentExaminationYear);
            }
            boolean val = AdminCon.importExam_reg(currentExaminationYear);
            if(val = true)
            {
                response.sendRedirect("instructions.jsp");
            
            }
        %>
        
    </body>
</html>
