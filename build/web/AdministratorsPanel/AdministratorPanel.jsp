 
<!--Admin Panel Page-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>

<html>
    <head>
        <title>Administrator Panel</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=PT+Serif&display=swap" rel="stylesheet">
        <style>

            *{
                text-decoration: none;
                font-family: Arial, Helvetica, sans-serif;
            }


            body{
                /*background-color: rgb(224, 202, 250);*/
                position: relative;

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

            /*            .card-body{
                            background: #b3ffd9;
                        }*/
            .card{
                border: 10px solid black;
            }

            /*            .bgImage{
                            background: #f2f2f2;
                            position: relative;
                            display: flex;
                            
                        }
                        .bgImage::before{
                                content: '';
                                position: absolute;
                                top: 0px;
                                right: 0px;
                                left: 0px;
                                bottom: 0px;
                                background-image: url('../img/background.png');
                                background-size: cover;
                                background-position: top center;
                                opacity: 0.34;
                            }*/
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
    <body class="bgImage" style="position: relative;background-image: url('../img/background.png');">
        <%!
            String name;
        %>
        <%
            name = ((String) session.getAttribute("admin_uname"));
            try {
                if (!name.equals(null)) {
                    //response.sendRedirect("hodLoginForm.jsp");
//                  List<Hod_data> details = HodCon.getHodData(name);
//                  for(Hod_data Details:details){
//                      Details.getFname();
//
//                  }

        %>

        <%@include file="adminHeader.jsp" %>
        <!-- Modal -->
        <div class="modal fade" id="exampleModalbackup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Want Backup</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Database Sql file is downloaded and stored in Backup_RG folder in C drive.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" data-dismiss="modal">Save File</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="setMargin">
            <h1 style="font-family: lobster;">Welcome to Admin Panel</h1><hr style="color: black;"><br>
            <div class="row">
                <div class="col-3">
                    <div class="card cardStyle" style="width: 18rem;border: 2px solid black;">
                        <div class="card-header text-white bg-primary" style="font-size: 25px; ">General Settings</div>
                        <div class="card-body">   
                            <div class="mt-2"></div>
                            <a href="changePassword.jsp" class="btn btn-dark" data-toggle="tooltip" data-placement="top" data-html="true" title="Allow you to change Password <i class='fas fa-key'></i>" id="change">Change Password</a>
                            <a href="Departments.jsp" class="btn btn-dark mt-2" data-toggle="tooltip" data-placement="top" data-html="true" title="Allows to quickly navigate to departments in college website <i class='fas fa-university' style='font-weight: bold;'></i>">Departments</a>
                            <a href="../Controller/Backup.jsp" class="btn btn-dark ml-2 mt-2" data-toggle="modal" data-target="#exampleModalbackup" data-tooltip="tooltip" data-placement="top" data-html="true" title="Allows to get backup of System Database">Backup</a>
                            <div class="mb-2"></div>
                        </div>
                    </div>
                </div>

                <div class="col-4 ml-5 ">
                    <div class="card cardStyle" style="width: 22rem;border: 2px solid black;">
                        <div class="card-header text-white bg-primary" style="font-size: 25px;">Student Settings</div>
                        <div class="card-body">   
                            <div class="mt-2"></div>
                            <!--                    <a href="getCourses.jsp" class="btn btn-dark mb-2">Get Courses</a>
                                                <a href="getStudents.jsp" class="btn btn-dark ml-2 mb-2">Get Students</a>-->

                            <form action="document.jsp" method="post">
                                Year:
                                <select name="year">
                                    <!--<option>0</option>-->
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
                                    <option>EL</option>
                                    <option>ME</option>
                                    <option>CE</option>
                                    <option>AE</option>
                                    <option>EL</option>
                                    <option>PE</option>
                                    <option>ID</option>
                                    <option>DD</option>

                                </select>
                                Term:
                                <select name="term">
                                    <option></option>
                                    <option>Odd</option>
                                    <option>Even</option>
                                </select>
                                <!--<input type="submit">-->

                                <button formaction="courseTable.jsp" type="submit" class="btn btn-dark mt-3" data-toggle="tooltip" data-placement="top" data-html="true" title="Get courses based on above Selection <i class='fad fa-books'></i>">Get Courses</button>
                                <button formaction="studentsTable.jsp" type="submit" class="btn btn-dark ml-2 mt-3" data-toggle="tooltip" data-placement="top" data-html="true" title="Get Students based on above selection">Get Students</button>

                            </form>
                            <div class="mb-2"></div>
                        </div>
                    </div>
                </div>

                <div class="col-4 ml-1">
                    <div class="card cardStyle" style="width: 18rem;border: 2px solid black;">
                        <div class="card-header text-white bg-primary " style="font-size: 25px;" >HOD Settings</div>
                        <div class="card-body">   
                            <div class="mt-2"></div>
                            <!--                    <a href="addInvigilator.jsp" class="btn btn-dark  m-2">Add Invigilator</a>
                                                <a href="message.jsp" class="btn btn-dark m-2">Message</a>
                                                <a href="viewInvigilators.jsp" class="btn btn-dark  m-2">Get Invigilators</a>-->
                            <a href="ViewHoddata.jsp"  class="text-decoration-none btn btn-dark ml-2 mb-2" data-toggle="tooltip" data-placement="top" data-html="true" title="Allow to get information of HOD's">Get HOD's</a>
                            <a href="instructions.jsp" class="btn btn-dark ml-2" data-toggle="tooltip" data-placement="top" data-html="true" title="Import Student's from examreg to student_courses <i class='fas fa-file-import'></i> table...">Import Exam_reg</a>
                            <div class="mb-2"></div>
                        </div>
                    </div>
                </div>
            </div>   
            <br>
            <hr>
            <div class="row">
                <div class="col-3">
                    <div class="card cardStyle" style="width: 18rem;border: 2px solid black;">
                        <div class="card-header  text-white bg-primary"  style="font-size: 25px;">About Result</div>
                        <div class="card-body">   
                            <div class="mt-2"></div>   
                            <div class="border  border-1 border-success p-2 ml-2 mb-2" style="border-radius: 10px;" >
                                <form action="document.jsp" method="post">
                                Year:
                                <select name="year">
                                    <!--<option>0</option>-->
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
                                    <option>EL</option>
                                    <option>ME</option>
                                    <option>CE</option>
                                    <option>AE</option>
                                    <option>EL</option>
                                    <option>PE</option>
                                    <option>ID</option>
                                    <option>DD</option>

                                </select>
                                Term:
                                <select name="term">
                                    <option></option>
                                    <option>Odd</option>
                                    <option>Even</option>
                                </select>
                                <!--<input type="submit">-->

                                <button type="submit" data-toggle="tooltip" data-placement="top" data-html="true" title="Generate Result in form of pdf" class="btn btn-dark  m-2">Prints</button>     
                            </form>
                           
                            </div>
                            <a href="declareResultInstructions.jsp" data-toggle="tooltip" data-placement="top" data-html="true" title="Declare the result" class="btn btn-dark  m-2">Declare Result</a>
                            <a href="searchResult.jsp" data-toggle="tooltip" data-placement="top" data-html="true" title="View Result Online" class="btn btn-dark ml-2">View Result</a>
                            <div class="mb-2"></div>
                        </div>
                    </div>
                </div>    

                <div class="col-4 ml-5">
                    <div class="card cardStyle" style="width: 22rem;border: 2px solid black;">
                        <div class="card-header text-white bg-primary" style=" font-size: 25px; ">Students Information</div>
                        <div class="card-body">   
                            <form action="../AdministratorsPanel/RegisterCourses.jsp" method="POST">
                                <input type="number" class="form-control" style="border:1px solid #222;" required="" name="rollno" id="rollno" placeholder="Enter Roll No"><br>
                                <button class="text-decoration-none btn btn-dark  mb-2" data-toggle="tooltip" data-placement="top" data-html="true" title="Get the register courses of any student" type="submit">Student's Courses</button>
                            </form>
                            <div class="mb-2"></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-4 ml-1 ">
                    <div class="card cardStyle" style="width: 22rem;border: 2px solid black;">
                        <div class="card-header text-white bg-primary" style="font-size: 25px;">Analytics </div>
                        <div class="card-body">   
                            <div class="mt-2"></div>
                            <!--                    <a href="getCourses.jsp" class="btn btn-dark mb-2">Get Courses</a>
                                                <a href="getStudents.jsp" class="btn btn-dark ml-2 mb-2">Get Students</a>-->

                            <form>
                                Year:
                                <select name="year">
                                    <!--<option>0</option>-->
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
                                    <option>EL</option>
                                    <option>ME</option>
                                    <option>CE</option>
                                    <option>AE</option>
                                    <option>EL</option>
                                    <option>PE</option>
                                    <option>ID</option>
                                    <option>DD</option>
                                </select>
                                Term:
                                <select name="term">
                                    <option></option>
                                    <option>Odd</option>
                                    <option>Even</option>
                                </select>
                                <!--<input type="submit">-->

                                <button data-toggle="tooltip" data-placement="top" data-html="true" title="Register Students Analysis for courses of any department"  class="btn btn-dark mt-4" formaction="../HODPanel/Exam_regNumber.jsp">Registered Students</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Pending students in 1,2 and more courses of any department"  class="btn btn-dark mt-4" formaction="../HODPanel/Noofpendingstudents.jsp">Pending Students</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Pass students in 1,2 and more courses of any department"  class="btn btn-dark mt-4 ml-1" formaction="../HODPanel/Noofpassstudents.jsp">Pass Students</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Course wise number of pending students of any department"  class="btn btn-dark mt-4 " formaction="../HODPanel/OverallResultAnalysis.jsp">Pending Students Analysis</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Course wise number of pass students of any department"  class="btn btn-dark mt-4 " formaction="../HODPanel/OverallResultofPassStudents.jsp">Pass Students Analysis</button>
                                    <button data-toggle="tooltip" data-placement="top" data-html="true" title="Overall Analysis of registered courses of any department"  class="btn btn-dark mt-4 " formaction="../HODPanel/OverallAnalysisWithTable.jsp">Overall Analysis</button>
                            </form>
                            <div class="mb-2"></div>
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
            console.log("Show: "+btn_tooltip);
            let btn = (btn_tooltip == "true") ? true : false;
            console.log("tooltip: "+btn);
            if (btn)
            {
                console.log("Show Tooltip");
                console.log(localStorage.getItem("show_tooltip"));
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            } else {
                console.log("Hide Tooltip");
                $('[data-toggle="tooltip"]').tooltip('hide');

            }
        </script>
        <%                }
            } catch (Exception e) {
                response.sendRedirect("../AdministratorsPanel/AdministratorLogin.jsp");
            }
        %>
    </body>
</html>
