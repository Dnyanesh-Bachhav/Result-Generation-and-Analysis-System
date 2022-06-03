<%-- 
    Document   : AnalysisResult
    Created on : 21 Apr, 2021, 3:04:23 PM
    Author     : tppat
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">  
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>       
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>       
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>  
        <title>Analysis Result</title>
    </head>
    <body>
        <%!
            int i = 1;
            String term;
            int year;
            String branch;  
            ArrayList<String> coursecode = new ArrayList(); 

        %>

        <table id="table" class="table table-striped-dark table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th scope="col">Course</th>
                    <th scope="col">Registered Student</th>
                    <th scope="col">Pass Student</th>
                    <th scope="col">Pending Student</th>

                </tr>
            </thead>
                    <%
            year = Integer.parseInt(request.getParameter("year"));
            branch = request.getParameter("branch");
            term = request.getParameter("term");
            List<Courses> course = AdminCon.getCourses(year, branch, term);
            for (Courses sd : course) {
                coursecode.add(sd.getCourse_code());
                  
        %>

            <tr>
                <td><%=i++%></td>
                <td><%= sd.getCourse_code()%></td>
            </tr>
<%
    
}
%>

        </table>




        <script type="text/javascript">
            $(document).ready(function () {
                $('#table').DataTable();
            });
        </script>
    </body>
</html>
