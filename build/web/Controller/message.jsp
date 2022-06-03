<%-- 
    Document   : Controller for message
    Created on : 16 Oct, 2020, 2:16:17 PM
    Author     : tppat
--%>

<%@page import="beans.Hod_data"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="beans.Invigilator_details"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Controller</title>
    </head>
    <body>
        <%!
            String to;
            int dept_code;
            String Program;
            String fname;
            String lname;
            String sender;
            boolean state;
        %>
        <%
            String username = ((String) session.getAttribute("hod_uname"));
            List<Hod_data> details = HodCon.getHodData(username);
            for (Hod_data Details : details) {
                Program = Details.getProgramme();
                fname =  Details.getFname();
                lname = Details.getLname();
                sender = fname + " " + lname;
            }

            Map<String, Integer> program = HodCon.getAllbranchcode(Program);
            dept_code = (program.get(Program));

        %>
        <%  
            String receiver = request.getParameter("to");
            if (receiver.equals("all")) {
                List<Invigilator_details> invigilatordetails = HodCon.getInvigilatordetails(dept_code);
                for (Invigilator_details ind : invigilatordetails) {
                    String invigilator_id = ind.getInvigilatorId();
                    String message = request.getParameter("msg");
                    String date = request.getParameter("date");
                    state =  HodCon.message(message, sender, invigilator_id, date);
                        
                }   
                session.setAttribute("state", state);
//                response.sendRedirect("../HODPanel/HODPanel.jsp");

            } else {
                String message = request.getParameter("msg");
                String date = request.getParameter("date");
                 state = HodCon.message(message, sender, receiver, date);
                

//                if (state == true) {
//                    response.sendRedirect("../HODPanel/HODPanel.jsp");
//                }
                            session.setAttribute("state", state);
            }
            
            
        %>
    </body>
</html>
