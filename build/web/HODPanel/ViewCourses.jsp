<%-- 
    Document   : ViewCourses
    Created on : 2 Aug, 2020, 7:09:58 PM
    Author     : tppat
--%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.Map"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.lang.String"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Course</title>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">  
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>       
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>       
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
       
      
    </head>
    <body>
        <%--<%@include file="HodHeader.jsp"%>--%>
        <%--!
            String[] array = null;
            int i = 0;
        --%>
           <%!
          String Program;
          int dept_code;
        %>
<%
    try{
       String username=((String) session.getAttribute("hod_uname"));
       List<Hod_data> details = HodCon.getHodData(username);
                  for(Hod_data Details:details){
                       Program = Details.getProgramme();                  
                  }

 %>
 <%
             Map<String, Integer> program = HodCon.getAllbranchcode(Program);
             dept_code=(program.get(Program));
             }catch(Exception e){} 
           finally{
 %>
        <h1 class="m-3" style="padding: 50px;">View All Details Of Course </h1>
        <div class="m-3">

            <table id="table" class="table table-dark table-bordered table-hover" style="width:100%">
                <thead>
                    <tr>
                        <th scope="col">Programe</th>
                        <th scope="col">Course_Credit</th>
                        <th scope="col">Total_marks</th>
                        <th scope="col">Course_Code</th>
                        <th scope="col">Course_Name</th>
                        <th scope="col">Is_Exempted</th>                                                      
                        <th scope="col">Is_Offered</th>
                        <th scope="col">Department</th>
                        <th scope="col">Term</th>
                        <th scope="col">Year</th>                        
                    </tr>
                </thead>
                <%

                    List<Courses> course = HodCon.getAllCourses1(dept_code);
                    for (Courses courses : course) {

            //          List cl = CourseList.getAllCourses();
            //          cl.forEach((item)->{
            //              array[i]=(String)item;
            //              System.out.println(array[i]);
            //              i++;
            //          });
            //               

                %>
                <tr>
                    <td><%=courses.getProgramme()%></td>
                    <td><%=courses.getCou_credit()%></td>
                    <td><%=courses.getTotal_Marks()%></td>
                    <td><%=courses.getCourse_code()%></td>
                    <td><%=courses.getCourse_name()%></td>
                    <td><%=courses.getIs_exempted()%></td>
                    <td><%=courses.getIs_offered() %></td>
                    <td><%=courses.getDepartment()%></td>
                    <td><%=courses.getTerm()%></td>
                    <td><%=courses.getYear()%></td>
                </tr>

                <%
                    }
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
