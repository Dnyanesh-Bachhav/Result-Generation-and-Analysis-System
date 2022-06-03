<%-- 
    Document   : try3
    Created on : 14 Oct, 2020, 2:35:30 PM
    Author     : tppat
--%>

<%@page import="mainController.CourseList"%>
<%@page import="java.util.Map"%>
<%@page import="mainController.HodCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Hod_data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%!
          String Fname;
          String Lname;
          String Education;
          String Program;
          String User;
          String Username;
          int Id;
          int Shift;
        %>
<%
       String username= ((String) session.getAttribute("hod_uname"));
       List<Hod_data> details = HodCon.getHodData(username);
                  for(Hod_data Details:details){
                       Fname = Details.getFname();
                       Lname = Details.getLname();
                       Education = Details.getEducation();
                       Program = Details.getProgramme();
                       User = Details.getUser();
                       Username = Details.getUsername();
                       Id = Details.getId();
                       Shift = Details.getShift();
                       
                  }

 %>
 <%
             Map<String, Integer> program = CourseList.getAllbranchcode(Program);
             out.println(program.get(Program));
 %>
    </body>
</html>
