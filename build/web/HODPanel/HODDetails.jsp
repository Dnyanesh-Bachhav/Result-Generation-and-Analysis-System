<%-- 
    Document   : HODDetails
    Created on : 12 Oct, 2020, 2:23:57 PM
    Author     : tppat
--%>

<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOD Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery-3.5.1.min.js"></script>


        <style>

            input{
                width: 50%;
            }
            form{
                border: 1px solid black;
                margin: 40px;
                padding: 30px;
                border-radius: 30px;
            }
            label{
                color: black;
                margin-bottom: 10px;
            }
        </style>
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


        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="form">
                    <div class="modal-header">
                        <h5 class="modal-title">HOD Details Update</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                        <div class="form-group">
                            <label>First Name:</label>
                            <input type="text" name="" id="fname" class="form-control" placeholder="First Name">
                        </div>
                        <div class="form-group">
                            <label>Last Name:</label>
                            <input type="text" name="" id="lname" class="form-control" placeholder="Last Name">
                        </div>
                        <div class="form-group">
                            <label>Education:</label>
                            <input type="email" name="" id="education" class="form-control" placeholder="Education">
                        </div>
                        <div class="form-group">
                            <label>User:</label>
                            <input type="text" name="" id="user" class="form-control" placeholder="User">
                        </div>
                        <div class="form-group">
                            <label>Department:</label>
                            <input type="text" name="" id="dept" class="form-control" placeholder="Department">
                        </div>
                        <div class="form-group">
                            <label>Shift:</label>
                            <input type="text" name="" id="shift" class="form-control" placeholder="Shift">
                        </div>
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text" name="" id="uname" class="form-control" placeholder="Username">
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" data-bs-dismiss="modal" id="btn-save" value="Save Changes">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    <center><h2>HOD Details</h2></center>
    <form class="form-horizontal"action="" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">First Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"   value="<%=Fname%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Last Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"    value="<%=Lname%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">User Education:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"  value="<%=Education%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Program:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"   value="<%=Program%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">User Type:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"   value="<%=User%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Username:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"   value="<%=Username%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">User Id:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control border-0"    value="<%=Id%>" readonly><br>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Shift:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control border-0"  value="<%=Shift%>" readonly><br>
            </div>
        </div>
        <button type="button" id="update" class="btn btn-primary mt-5 ml-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Update
        </button>
        <br>
    </form>


    <script>
        $(document).ready(function () {

            $("#update").on("click", function (e) {
                e.preventDefault();
//                    var courseId = document.getElementById("courseId").value;
                console.log("Edit Button Clicked");
                var username = "<%=Username%>";
//                    console.log(fname);
                console.log(username);


                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/HODUpdate",
                    data: {
                        id: username
                    },
                    dataType: "json",
                    success: function (data1) {

                        $("#fname").val(data1.fname);
                        $("#lname").val(data1.lname);
                        $("#education").val(data1.education);
                        $("#user").val(data1.user);
                        $("#dept").val(data1.program);
                        $("#shift").val(data1.shift);
                        $("#uname").val(data1.username);
//                            
                    },
                    error: function (err)
                    {
                        console.log("Error Occured...!!!" + err);
                    },

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
                var lname = $("#lname").val();
                var education = $("#education").val();
                var user = $("#user").val();
                var department = $("#dept").val();
                var shift = $("#shift").val();

                $.ajax({
                    method: "POST",
                    url: "${pageContext.request.contextPath}/UpdateHODData",
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
                        console.log("Response: " + data1);
                        $("#form")[0].reset();
                        location.reload(true);

                    }
                });
            });

        });

//            $(".swal-button").on("click",function () {
//            console.log("Hello there button just got clicked")
//            location.reload(true);
//            });

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
