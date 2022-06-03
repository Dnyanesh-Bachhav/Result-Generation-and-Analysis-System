
<!--View Student data-->

<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.Map"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="beans.Student_data"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Students</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">  
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>       
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>       
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>       
        </head>
    <body>

        <%--<%@include file="HodHeader.jsp"%>--%>
           <%!
          String Program;
          int dept_code;
        %>
<%
       String username=((String) session.getAttribute("hod_uname"));
       List<Hod_data> details = HodCon.getHodData(username);
                  for(Hod_data Details:details){
                       Program = Details.getProgramme();                  
                  }

 %>
 
        <h1 class="m-3" style="padding: 50px;">View Details Of Student </h1>
        <div class="m-3">
            
        <table id="table" class="table table-dark table-bordered" style="width:100%">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Student_Rollno</th>
      <th scope="col">Programme</th>
      <th scope="col">Year</th>
      <th scope="col">Term</th>                                                      
      <th scope="col">Shift</th>
      <th scope="col">Student_Name</th>

    </tr>
  </thead>
    <% 
          List<Student_data> studentdata = HodCon.getAllStudents(Program);
          for(Student_data sd:studentdata){
               
          
    %>
    <tr>
      <td><%=sd.getId()%></td>
      <td><%=sd.getRollno()%></td>
      <td><%=sd.getProgramme()%></td>
      <td><%=sd.getYear()%></td>
      <td><%=sd.getTerm()%></td>
      <td><%=sd.getShift()%></td>
      <td><%=sd.getS_name()%></td>
 
    </tr>
    <%
      }
    %>          
              
</table>
        <script type="text/javascript">
        $(document).ready(function() {
    $('#table').DataTable();
} );
    </script>
        </div>
    </body>
</html>
