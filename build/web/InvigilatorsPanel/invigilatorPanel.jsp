<%-- 
    Document   : invigilatorPanel
    Created on : 27 Aug, 2020, 6:35:21 PM
    Author     : DELL
--%>


<%@page import="java.util.Map"%>
<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.List"%>
<%@page import="mainController.invigilatorsCon"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invigilator Panel</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=PT+Serif&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            *{
                text-decoration: none;
                font-family: Arial, Helvetica, sans-serif;

            }
            body{
                font-family: Nunito;
            }
            .navbar-search
            {
                width:25rem
            }
            .navbar-search input
            {
                font-size:.85rem
            }
            .icon-circle
            {
                height:2.5rem;width:2.5rem;border-radius:100%;display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center
            }
            .img-profile
            {
                height:2rem;width:2rem;border:1px solid #fafafa
            }
            .badge-counter
            {
                position:absolute;-webkit-transform:scale(.7);transform:scale(.7);-webkit-transform-origin:top right;transform-origin:top right;right:.25rem;margin-top:-.25rem
            }
            .bg-navbar{background:-webkit-linear-gradient(-135deg,#c850c0,#4158d0);
            }
            .topbar
            {
                height:4.375rem;z-index:2;-webkit-box-shadow:0 .15rem 1.75rem 0 rgba(58,59,69,.15)!important;box-shadow:0 .15rem 1.75rem 0 rgba(58,59,69,.15)!important
            }
            #sidebarToggleTop{height:2.5rem;width:2.5rem;-webkit-box-shadow:0 0!important;box-shadow:0 0!important}
            .topbar #sidebarToggleTop:hover{background-color:#fafafa}
            .topbar #sidebarToggleTop:active{background-color:#dddfeb}
            #table{
                margin: 4%;
            }
            i{
                color: black;
            }

        </style>
    </head>
    <body>
        <%!
            String name;
            int code;
            String departmentName;
            String dept;
        %>
        <%
            name = ((String) session.getAttribute("uname"));
            try {
                if (!name.equals(null)) {
                    //response.sendRedirect("hodLoginForm.jsp");
//                  List<Hod_data> details = HodCon.getHodData(name);
//                  for(Hod_data Details:details){
//                      Details.getFname();
//
//                  }

        %>
        <%            List<Invigilator_details> li = invigilatorsCon.getInvigilatorDetails(name);
            for (Invigilator_details o1 : li) {
                code = o1.getDepartment();
                switch (code) {
                    case 11:
                        departmentName = "Civil Engineering";
                        break;
                    case 12:
                        departmentName = "Civil Engineering";
                        break;
                    case 21:
                        departmentName = "Mechanical Engineering";
                        break;
                    case 22:
                        departmentName = "Mechanical Engineering";
                        break;
                    case 51:
                        departmentName = "Information Technology";
                        break;
                    case 61:
                        departmentName = "Computer Technology";
                        break;
                    case 71:
                        departmentName = "Electronics & Telecommunication Engineering";
                        break;
                    case 72:
                        departmentName = "Electronics & Telecommunication Engineering ";
                        break;
                    case 41:
                        departmentName = "Electrical Engineering";
                        break;
                    case 81:
                        departmentName = "Automobile Engineering";
                        break;
                    case 31:
                        departmentName = "Plastic Engineering";
                        break;
                    case 91:
                        departmentName = "Dress Designing and Garment Manufacturing";
                        break;
                    case 01:
                        departmentName = "Interior Design and Decoration";
                        break;
                    default:
                        System.out.println("Please enter valid input...!!!");
                }
                session.setAttribute("code", code);
                session.setAttribute("invigilatorName", o1.getInvigilatorName());
                session.setAttribute("departmentName", departmentName);
        %>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to exit this session?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <a href="../InvigilatorsPanel/Logout.jsp" type="button" class="btn btn-success">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- TopBar -->
        <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top text-white">
            <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
                <!--<i class="fa fa-bars"></i>-->
            </button>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-search fa-fw"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                         aria-labelledby="searchDropdown">
                        <form class="navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-1 small" placeholder="What do you want to look for?"
                                       aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
                
                <!--Work in Progress future use- to convey notices and file management -->
                
<!--                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>
                        <span class="badge badge-danger badge-counter">3+</span>
                    </a>
                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="alertsDropdown">
                        <h6 class="dropdown-header">
                            Alerts Center
                        </h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-primary">
                                    <i class="fas fa-file-alt text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 12, 2019</div>
                                <span class="font-weight-bold">A new monthly report is ready to download!</span>
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-success">
                                    <i class="fas fa-donate text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 7, 2019</div>
                                $290.29 has been deposited into your account!
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-warning">
                                    <i class="fas fa-exclamation-triangle text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 2, 2019</div>
                                Spending Alert: We've noticed unusually high spending for your account.
                            </div>
                        </a>
                        <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                    </div>
                </li>-->
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-envelope fa-fw"></i>
                        <span class="badge badge-warning badge-counter" id="messageNumber"></span>
                    </a>
                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="messagesDropdown" style="width: 800px;">
                        <h6 class="dropdown-header">
                            Message Center
                        </h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="dropdown-list-image mr-3">
                                <div class="status-indicator bg-success"></div>
                            </div>
                            <div class="font-weight-bold">
                                <div class="text-truncate" id="message"></div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-tasks fa-fw"></i>
                        <span class="badge badge-success badge-counter">3</span>
                    </a>
                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="messagesDropdown">
                        <h6 class="dropdown-header">
                            Task
                        </h6>
                        <a class="dropdown-item align-items-center" href="#">
                            <div class="mb-3">
                                <div class="small text-gray-500">Periodic Test
                                    <div class="small float-right"><b id="periodicTest"></b></div>
                                </div>
                                <div class="progress" style="height: 12px;">
                                    <div class="progress-bar bg-success" role="progressbar"
                                         aria-valuemin="0" aria-valuemax="100" id="progressBar1"></div>
                                </div>
                            </div>
                        </a>
                        <a class="dropdown-item align-items-center" href="#">
                            <div class="mb-3">
                                <div class="small text-gray-500">Theory
                                    <div class="small float-right"><b id="theory"></b></div>
                                </div>
                                <div class="progress" style="height: 12px;">
                                    <div class="progress-bar bg-warning" role="progressbar"
                                         aria-valuemin="0" aria-valuemax="100" id="progressBar2"></div>
                                </div>
                            </div>
                        </a>
                        <a class="dropdown-item align-items-center" href="#">
                            <div class="mb-3">
                                <div class="small text-gray-500">TW,PR and OR
                                    <div class="small float-right"><b id="prOrTw"></b></div>
                                </div>
                                <div class="progress" style="height: 12px;">
                                    <div class="progress-bar bg-danger" role="progressbar"
                                         aria-valuemin="0" aria-valuemax="100" id="progressBar3"></div>
                                </div>
                            </div>
                        </a>
                        <a class="dropdown-item text-center small text-gray-500" href="analytics.jsp">View All Taks</a>
                    </div>
                </li>
                <div class="topbar-divider d-none d-sm-block"></div>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <img class="img-profile rounded-circle" src="../Boy.png" style="max-width: 60px">
                        <div style="display: inline-block">
                            <div class="ml-2 d-none d-lg-inline text-white small float-left"><%=o1.getInvigilatorName()%></div><br>
                            <div class="ml-2 d-none d-lg-inline text-white small float-left"><%=departmentName%></div>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="profile.jsp">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                            Profile
                        </a>
                        <a class="dropdown-item" href="settings.jsp">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            Settings
                        </a>
                        <a class="dropdown-item" href="analytics.jsp">
                            <i class="fas fa-bar-chart fa-sm fa-fw mr-2 text-gray-400"></i>
                            Analytics
                        </a>
                        <a class="dropdown-item"   data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-sign-out fa-sm fa-fw mr-2 text-gray-400"></i>
                            Logout
                        </a>

                    </div>
                </li>
            </ul>
        </nav>
        <!-- Topbar -->
        <%--
        <h1>Welcome <%=o1.getInvigilatorName()%></h1>
        <h1><%=departmentName%></h1>--%>
        <%
            }
        %>
        <div id="table">
            <table class="table table-dark">
                <thead>
                <th>No.</th>
                <th>Subjects</th>
                <th>Department</th>
                <th>Action</th>
                </thead>
                <tbody>
                    <%
                        for (Invigilator_details o : li) {

                    %>
                    <tr>
                        <td>1.</td>
                        <%                            String sub1 = o.getSpecializedSubject1();
                            Map<String, String> cname = invigilatorsCon.courseNameByCoursCode();

                            dept = sub1.substring(0, 2);
                            int j = sub1.compareToIgnoreCase("None");
                            if (j != 0) {


                        %>
                        <td><a href="" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=sub1%>"  class="btn btn-warning"><%= cname.get(sub1)%></a></td>
                        <td ><%=dept%></td>
                        <%--<td><a href='getStudents.jsp?sub=<%= sub1%>&code=<%= o.getDepartment()%>' class="btn btn-primary">getStudents</a></td>--%>

                        <td><form action="../getStudentsServlet">
                                <input type="text" value='<%= sub1 %>' name="sub" hidden>
                                <input type="submit" value="RegisteredStudents" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=cname.get(sub1)+""+sub1%>" class="btn btn-primary" >
                            </form></td>

                        <%
                        } else {
                        %>
                        <%
                            }%>
                    </tr>


                    <tr>
                        <td>2.</td>
                        <%
                            String sub2 = o.getSpecializedSubject2();
                            dept = sub2.substring(0, 2);
                            int k = sub2.compareToIgnoreCase("None");
                            if (k != 0) {

                        %>
                        <td><a href="" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=sub2%>" class="btn btn-warning"><%= cname.get(sub2)%></a></td>
                        <td><%=dept%></td>
                        <td><form action="../getStudentsServlet">
                                <input type="text" value='<%= sub2 %>' name="sub" hidden>
                                <input type="submit" value="RegisteredStudents" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=cname.get(sub2)+""+sub2%>" class="btn btn-primary">
                            </form></td>

                        <%
                        } else {
                        %>
                        <%
                            }
                        %>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <%
                            String sub3 = o.getSpecializedSubject3();
                            dept = sub3.substring(0, 2);
                            int m = sub2.compareToIgnoreCase("None");
                            if (m != 0) {

                        %>
                        <td><a href="" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=sub3%>" class="btn btn-warning"><%= cname.get(sub3)%></a></td>
                        <td><%=dept%></td>
                        <td><form action="../getStudentsServlet">
                                <input type="text" value='<%= sub3 %>' name="sub" hidden>
                                <input type="submit" value="RegisteredStudents" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=cname.get(sub3)+""+sub3%>" class="btn btn-primary">

                            </form></td>
                            <%
                            } else {
                            %>
                            <%
                                }
                            %>
                    </tr>
                    <tr>

                        <%
                            String sub4 = o.getSpecializedSubject4();
//                            String sub41 = sub4.toString();
                            dept = sub4.substring(0, 2);
                            int i = sub4.compareToIgnoreCase("None");
                            if (i != 0) {
                        %>
                        <td>4.</td>
                        <td><a href="" data-toggle="tooltip" data-placement="top" data-html="true" title="<%=sub4%>" class="btn btn-warning"><%=cname.get(sub4)%></a></td>
                        <td><%=dept%></td>
                        <td><form action="../getStudentsServlet">
                                <input type="text" value='<%= sub4 %>' name="sub" hidden>
                                <input type="submit" value="RegisteredStudents" data-toggle="tooltip" data-placement="top" data-html="true" title="<%= cname.get(sub4)+""+sub4%>" class="btn btn-primary">
                            </form></td>
                            <%
                            } else {
                            %>

                        <%
                            }
                        %>
                    </tr>
                    <%
                        }
                    %>
                    </tr>               
                </tbody>
            </table>

            <br>
            <br>
            <div class="border border-primary rounded bg-light">
                <pre style="font-family:Arial, Helvetica, sans-serif; font-weight: bold; font-size: 20px;">
        <b class="text-primary" >Note:</b>
        Please click on the getStudents to get students register for your subject.
                </pre>
            </div>
        </div>

        <!--<a href="receiveMessage.jsp" class="btn btn-primary">Receive Message</a>-->
        <script>

            $(document).ready(function () {
                var output = "";
                var count = 0;
                var name = "<%=name%>";
//                console.log(name);

                $("div").on("click", "#closeMessage", function (e) {
                    e.preventDefault();
                    var id = $(this).attr("data-sid");
//                    console.log(id);

                    $.ajax({
                        method: "POST",
                        url: "${pageContext.request.contextPath}/updateStatus",
                        data: {
                            name: name,
                            id: id
                        },
                        success: function (data)
                        {
//                            console.log(data);
                            location.reload();
                        }
                    });
                });


                $.ajax({
                    method: "GET",
                    url: "${pageContext.request.contextPath}/getMessage",
                    data: {
                        name: name
                    },
                    dataType: "json",
                    error: function (request, error) {
//                        console.log(arguments);
                        alert("Can't do because: " + error);
                    },
                    success: function (data1) {
//                        console.log(data1);
                        data1.forEach((item) => {
                            output += "<div class='text-wrap alert alert-warning alert-dismissible fade show' role='alert'>" + item[1] + "<blockquote class='blockquote-footer float-right'>" + item[3] + "</blockquote><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true' data-sid=" + item[0] + " id='closeMessage'>&times;</span></button></div>";
                            count++;
                        });
                        document.getElementById("message").innerHTML = output;
                        document.getElementById("messageNumber").innerHTML = count;
                    }
                });

                $.ajax({
                    method: "GET",
                    url: "${pageContext.request.contextPath}/progressBar",
                    data: {
                        uname: '<%=name%>',
                        code: '<%= code%>'
                    },
                    dataType: "json",
                    error: function (request, error) {
                        alert("Bar Page  Can't do because: " + error);
                    },
                    success: function (data1) {
//                        console.log("Bar Page: " + data1);
                        document.getElementById("periodicTest").innerText = data1.ptAverage + "%";
                        document.getElementById("theory").innerText = data1.thAverage + "%";
                        document.getElementById("prOrTw").innerText = data1.prOrTwAverage + "%";
                        document.getElementById("progressBar1").style.width = data1.ptAverage + "%";
                        document.getElementById("progressBar2").style.width = data1.thAverage + "%";
                        document.getElementById("progressBar3").style.width = data1.prOrTwAverage + "%";

                        let averagedeta = parseInt(data1.ptAverage) + parseInt(data1.thAverage) + parseInt(data1.prOrTwAverage)
                    }
                });
            });

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

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
       
        <%                }
            } catch (Exception e) {
                response.sendRedirect("../InvigilatorsPanel/InvigilatorLogin.jsp");
            }
        %>

    </body>
</html>
