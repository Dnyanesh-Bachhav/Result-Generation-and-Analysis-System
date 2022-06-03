<%-- 
    Document   : HOD Panel 
    Created on : 13 Jun, 2020, 12:29:08 PM
    Author     : tppat
--%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.List"%>
<%@page import="mainController.HodCon"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOD Panel</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

        <style>
            *{
                font-family: Arial, Helvetica, sans-serif;
            }   
            .setMargin
            {
                margin: 5%;
            }
            .btn1
            {
                font-size: 50px;
                font-family: arial;
                color: brown;
            }
            .cardStyle{
                border: 2px solid red;
                box-shadow: 10px 10px 10px 1px rgb(0 0 0 / 40%), 0px 0px 20px rgb(0 0 0 / 40%);
            }
            .settings{
                position: fixed;
                right: 10px;
                bottom: 10px;
                width: 60px;
                height: 60px;
                background-color: transparent;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 34px;
                border-radius: 50%; 
            }
            .settings:hover{
                background-color: rgb(188, 186, 207);
                transition: 0.6s ease;
            }
        </style>
    </head>
    <body style="position: relative;background-image: url('../img/background.png');">
        <%!
            String name;
            String program;
        %>
        <%
            name = ((String) session.getAttribute("hod_uname"));
            List<Hod_data> details = HodCon.getHodData(name);
            for (Hod_data Details : details) {
                program = Details.getProgramme();
            }

            try {
                if (!name.equals(null)) {
                    //response.sendRedirect("hodLoginForm.jsp");
//                  List<Hod_data> details = HodCon.getHodData(name);
//                  for(Hod_data Details:details){
//                      Details.getFname();
//
//                  }

        %>
        <%@include file="../HODPanel/HodHeader.jsp"%> 
        <h1 class="m-5" style="font-family: arial;font-style: italic;font-weight: bold;">Welcome To HOD Panel <hr></h1>
        <div class="m-5">
            <div class="row">
                <div class="col-lg-4">
                    <div class="setMargin">
                        <div class="card card-primary cardStyle" style="border: 2px solid black;">
                            <div class="card-header bg-primary" style="font-size:25px; color:white;">
                                Account Setting
                            </div>
                            <div class="card-body">
                                <form>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Change your password" class="btn btn-dark" formaction="PasswordChange.jsp">HOD Password Change</button><br><br>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Get Your Profile details and you can edit to" class="btn btn-dark" formaction="../HODPanel/HODDetails.jsp">Hod Details</button><br><br>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="setMargin">
                        <div class="card card-primary cardStyle" style="border: 2px solid black;">
                            <div class="card-header bg-primary" style="font-size:25px; color:white;">
                                View Information
                            </div>
                            <div class="card-body">
                                <form>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Get department courses" class="btn btn-dark" formaction="../HODPanel/ViewCourses.jsp">Available Courses </button><br><br>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Get students of department" class="btn btn-dark" formaction="../HODPanel/ViewStudent.jsp">Register Students </button><br><br>   
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="setMargin">
                        <div class="card card-primary cardStyle" style="border: 2px solid black;">
                            <div class="card-header bg-primary" style="font-size:25px; color:white;">
                                Invigilator Settings
                            </div>
                            <div class="card-body">
                                <form>
                                    <!--<button class="btn btn-dark" formaction="../HODPanel/Instructions.jsp">Instructions</button><br><br>-->
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Get invigilators of department" class="btn btn-dark" formaction="ViewInvigilator.jsp"> Invigilators of Department</button><br><br> 
                                    <button class="btn btn-dark" data-toggle="tooltip" data-placement="top" data-html="true" title="Register New Invigilator" formaction="InvigilatorRegister.jsp">Register New Invigilator</button><br><br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>


            <div class="row">
                <div class="col-lg-4">
                    <div class="setMargin">
                        <div class="card card-primary cardStyle" style="border: 2px solid black;">
                            <div class="card-header bg-primary" style="font-size:25px; color:white;">
                                Analytics
                            </div>
                            <div class="card-body">
                                <form method="post">
                                    Year:
                                    <select name="year">
                                        <!--<option>0</option>-->
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                    Branch:
                                    <select name="branch">
                                        <!--<option></option>-->
                                        <option><%=program%></option>

                                    </select>
                                    Term:
                                    <select name="term">
                                        <!--<option></option>-->
                                        <option>Odd</option>
                                        <option>Even</option>
                                    </select>
                                    <!--<input type="submit">-->

                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Register Students Analysis for courses"  class="btn btn-dark mt-4" formaction="../HODPanel/Exam_regNumber.jsp">Registered Students</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Pending students in 1,2 and more courses"  class="btn btn-dark mt-4" formaction="../HODPanel/Noofpendingstudents.jsp">Pending Students</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Pass students in 1,2 and more courses"  class="btn btn-dark mt-4 ml-1" formaction="../HODPanel/Noofpassstudents.jsp">Pass Students</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Course wise number of pending students"  class="btn btn-dark mt-4 " formaction="../HODPanel/OverallResultAnalysis.jsp">Pending Students Analysis</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Course wise number of pass students"  class="btn btn-dark mt-4 " formaction="../HODPanel/OverallResultofPassStudents.jsp">Pass Students Analysis</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Overall Analysis of registered courses"  class="btn btn-dark mt-4 " formaction="../HODPanel/OverallAnalysisWithTable.jsp">Overall Analysis</button>
                                </form>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="setMargin">
                        <div class="card card-primary cardStyle" style="border: 2px solid black;">
                            <div class="card-header bg-primary" style="font-size:25px; color:white;">
                                Communication
                            </div>
                            <div class="card-body">
                                <form>
                                    <button class="btn btn-dark" data-toggle="tooltip" data-placement="top" data-html="true" title="Send Message to invigilator of our department" formaction="../HODPanel/HodMessage.jsp">Message</button><br><br>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <div class="settings"><a href="../InvigilatorsPanel/settings.jsp" class="text-decoration-none" style="color: black;"><i class="fas fa-cog"></i></a></div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <script>
            var btn_tooltip = localStorage.getItem("show_tooltip");
//            console.log("Show: " + btn_tooltip);
            let btn = (btn_tooltip === "true") ? true : false;
//            console.log("tooltip: " + btn);
            if (btn)
            {
//                console.log("Show Tooltip");
//                console.log(localStorage.getItem("show_tooltip"));
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            } else {
//                console.log("Hide Tooltip");
                $('[data-toggle="tooltip"]').tooltip('hide');
            }

        </script>


        <%                }
            } catch (Exception e) {
                response.sendRedirect("../HODPanel/HODLogin.jsp");
            }
        %>

    </body>
</html>
