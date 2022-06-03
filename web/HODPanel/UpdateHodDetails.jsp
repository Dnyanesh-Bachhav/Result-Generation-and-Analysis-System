<%-- 
    Document   : UpdateHodDetails
    Created on : 19 Nov, 2020, 4:28:59 PM
    Author     : tppat
--%>

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Update Hod Details</title>
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
            String username = ((String) session.getAttribute("hod_uname"));
            List<Hod_data> details = HodCon.getHodData(username);
            for (Hod_data Details : details) {
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
    <center><h2>HOD Details Update Here</h2></center>
    <form class="form-horizontal" action="../Controller/HODdetailsupdate.jsp" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">First Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"  id="FirstName" name="fname"  value="<%=Fname%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Last Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"  id="LastName" name="lname"  value="<%=Lname%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">User Education:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"  id="Education" name="education" value="<%=Education%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Program:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"  id="Program" name="program"  value="<%=Program%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">User Type:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0" name="usertype"  id="UserType" value="<%=User%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Username:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0" name="username"  id="username" value="<%=Username%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">User Id:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0" name="userid"  id="UserId"  value="<%=Id%>" readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Shift:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"  id="Shift" name="shift" value="<%=Shift%>" >
            </div>
        </div>
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10 ">
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>             

    </form>
</body>
</html>
