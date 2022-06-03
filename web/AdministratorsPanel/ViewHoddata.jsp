
<!--Hod Details and Update Page-->

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.Map"%>
<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../css/datatable_css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="../js/jquery-3.5.1.min.js"></script>
        <title>View Hod Data</title>
        <style>
            body{
                margin: 5%;
            }
        </style>

    </head>
    <body>

        <%!
            String courseId;
        %>



        <div class="container">
            <h1 class="text-primary text-upparcase text-center " style="padding-top: 10px;">View All Details Of HOD</h1>
            <br>

            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="form">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">HOD DETAILS DATA UPDATE</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>First Name</label>
                                    <input type="text" name="" id="fname" class="form-control" placeholder="First Name">
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input type="text" name="" id="lname" class="form-control" placeholder="Last Name">
                                </div>
                                <div class="form-group">
                                    <label>Education</label>
                                    <input type="email" name="" id="education" class="form-control" placeholder="Education">
                                </div>
                                <div class="form-group">
                                    <label>User</label>
                                    <input type="text" name="" id="user" class="form-control" placeholder="User">
                                </div>
                                <div class="form-group">
                                    <label>Department</label>
                                    <input type="text" name="" id="dept" class="form-control" placeholder="Department">
                                </div>
                                <div class="form-group">
                                    <label>Shift</label>
                                    <input type="text" name="" id="shift" class="form-control" placeholder="Shift">
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="" id="uname" class="form-control" placeholder="Username">
                                </div>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" data-dismiss="modal" id="btn-save" value="Save">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%!
            String username;
        %>
        <%
            List<Hod_data> HodDetails = AdminCon.getAllHODsData();
            for (Hod_data hd : HodDetails) {
                username = hd.getUsername();

            }
        %>
        <input type="text" id="uname" value='<%=username%>' hidden>

        <table id="table" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Education</th>
                    <th scope="col">User</th>
                    <th scope="col">Department</th>
                    <th scope="col">Shift</th>
                    <th  scope="col">Username</th>
                    <th scope="col">Actions</th>


                </tr>
            </thead>
            <tbody id="tbody">
                <%--
                    List<Hod_data> HodDetails = AdminCon.getAllHODsData();
                    for (Hod_data hd : HodDetails) {


            %>
            <tr>
                <td><%=hd.getFname()%></td>
                <td><%=hd.getLname()%></td>
                <td><%=hd.getEducation()%></td>
                <td><%=hd.getUser()%></td>
                <td><%=hd.getProgramme()%></td>      
                <td><%=hd.getShift()%></td>
                <td><a class="btn btn-success" data-toggle="modal" data-target="#myModal">Update</a></td>
            </tr>
            <%
                }
                --%>          
            </tbody>
        </table>

        <script type="text/javascript">
            $(document).ready(function () {
                showData();

                $("#tbody").on("click", "#btn-edit", function (e) {
                    e.preventDefault();
//                    var courseId = document.getElementById("courseId").value;
//                    console.log("Edit Button Clicked");
                    let sid = $(this).attr("data-sid");
//                    console.log(fname);
//                    console.log(courseId);

                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/Hod_Controller",
                        data: {
                            id: sid
                        },
                        dataType: "json",
                        success: function (data1) {
                            $("#fname").val(data1.fname);
                            $("#lname").val(data1.lname);
                            $("#education").val(data1.education);
                            $("#user").val(data1.user);
                            $("#dept").val(data1.programme);
                            $("#shift").val(data1.shift);
                            $("#uname").val(data1.username);
                            
                        }
                    });
                });

                $("#form").on("click", "#btn-save", function (e) {
                    e.preventDefault();
//                    var uname = document.getElementById("uname").value;
                    console.log("Save Button Clicked");
                    let name = $("#fname").val();
//                    console.log(id);
//                    console.log(courseId);
                    var uname = $("#uname").val();
                    console.log(uname);
                    var lname= $("#lname").val();
                    var education = $("#education").val();
                    var user = $("#user").val();
                    var department = $("#dept").val();
                    var shift = $("#shift").val();

                    $.ajax({
                        method: "POST",
                        url: "${pageContext.request.contextPath}/Hod_Controller1",
                        data: {
                            uname: uname,
                            name1: name,
                            lname1: lname,
                            education1: education,
                            user: user,
                            department: department,
                            shift1: shift
                        },
                        //dataType: "json",
                        success: function (data1) {
                            //alert(data1);
                            console.log("Response: "+data1);
                            $("#form")[0].reset();
                            showData();
                        }
                    });
                });



                function showData() {
                    //e.preventDefault();
//                    var uname = document.getElementById("uname").value;
                    var output = "";

                    $.ajax({
                        method: "GET",
                        url: "${pageContext.request.contextPath}/HodDataRetrieve",
                        data:{
                            
                        },
                        dataType: "json",
                        success: function (data1) {
                            //alert("data came");
                            data1.forEach((item) => {
                                output += "<tr><td>" + item[0] + "</td><td>" + item[1] + "</td><td>" + item[2] + "</td><td>" + item[3] + "</td><td>" + item[4] + "</td><td>" + item[5] + "</td><td>"+item[6] +"</td><td><a href='#' class='btn btn-warning' id='btn-edit' data-sid="+item[6]+" data-toggle='modal' data-target='#myModal'>Edit</a></td></tr>";
                            });
                            document.getElementById("tbody").innerHTML = output;
                            $('#table').DataTable();
                        },
                        error: function(){
                        alert("Error Occured...");                    
    }

                    });
                }

//               $('#table').DataTable();
            });
        </script>

<!--        <script src="../js/jquery-3.5.1.min.js"></script>       
        <script src="../js/jquery.dataTables.min.js"></script>       
        <script src="../js/datatable_js/dataTables.bootstrap.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <!--<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>-->
        <script src="../js/jquery.dataTables.min.js"></script>
</body>
</html>
