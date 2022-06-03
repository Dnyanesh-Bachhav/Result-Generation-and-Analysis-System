<%-- 
    Document   : ProfilePage
    Created on : 29 Dec, 2020, 8:43:55 PM
    Author     : DELL
--%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.List"%>
<%@page import="mainController.invigilatorsCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!--<script src="../js/jquery-3.5.1.min.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            *{
                padding-top: 10px;
                margin-bottom: 10px;
                text-decoration: none;
                font-family: Arial, Helvetica, sans-serif;

            }
            #Profile{
                margin-right: 5%;
                margin-left: 5%;
                margin-top: 5%;
                padding-left: 20px;
                padding-top: 20px;
                width: auto;
                border: 1px solid gray;
                border-radius: 20px;
            }
            #Contact{
                margin-right: 5%;
                margin-left: 5%;
                margin-top: 5%;
                padding-left: 20px;
                padding-top: 20px;
                width: auto;
                border-radius: 20px;
            }
            #btn2{
                margin-right: 5%;
                margin-left: 5%;
                margin-top: 5%;
                padding-left: 20px;
                padding-top: 20px;
                width: auto;
            }
            .setMargin{
                margin-left: 80px;
            }
            #name{
                font-size: 15px;
            }
            #withImage{
                width: auto;
                line-height: 100px;
            }
            #btn1{

            }
            #description{
                margin-left: 200px;
                align-self: stretch;
            }
            #image{
                font-weight: bolder;
                color:lightslategrey;
                height: 20px;
            }
        </style>
    </head>
    <body>

        <%!
            String name;
            String fname;
            String birthyear;
            String experience;
            String qualification;
            String address;
            int dept;
            String password;
            String email;
            long contact;
        %>
        <%
            name = ((String) session.getAttribute("uname"));
            List<Invigilator_details> id = invigilatorsCon.getInvigilatorDetails(name);
            for (Invigilator_details id1 : id) {
                fname = id1.getInvigilatorName();
                birthyear = id1.getAllowanceKey();
                experience = id1.getExperience();
                qualification = id1.getQualification();
                address = id1.getAddress();
                dept = id1.getDepartment();
                password = id1.getInvigilatorPassword();
                email = id1.getEmailId();
                contact = id1.getContactNumber();

            }
        %>

        <div class="container">

            <%--<%@include file="../InvigilatorsPanel/Listhover.jsp"%>--%>

            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="form">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">INVIGILATOR'S DETAILS</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Experience:</label>
                                    <input type="text" name="" id="exp" class="form-control" placeholder="Experience">
                                </div>
                                <div class="form-group">
                                    <label>Qualification</label>
                                    <input type="text" name="" id="qual" class="form-control" placeholder="Qualification">
                                </div>
                                <div class="form-group">
                                    <label>Address:</label>
                                    <input type="text" name="" id="addr" class="form-control" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <label>Password:</label>
                                    <input type="text" name="" id="pass" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label>Department:</label>
                                    <input type="text" name="" id="dept" class="form-control" placeholder="Department">
                                </div>
                                <div class="form-group">
                                    <label>Email:</label>
                                    <input type="email" name="" id="email" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label>Phone No.</label>
                                    <input type="number" name="" id="phoneno" class="form-control" placeholder="Phone No">
                                </div>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="submit"  class="btn btn-success" data-dismiss="modal" id="btn-save" value="Save">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </div>

        <div class="text-center">
            <h3 style="font-size: 50px;">Personal Info</h3>

            <p class="text-muted" style="font-size:25px;">Basic info, like your name and contact, that you use everywhere</p>
        </div>
        <form>
            <div id="Profile" class="table table-hover">
                <h2>Profile &nbsp;&nbsp;<img src="../img/User.png" class="bg-dark rounded-circle" alt="" style="width: 75px;height: 75px;">
                    <button type="button" id="update" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float:right; margin-right: 50px; ">
                        Update
                    </button>
                </h2>
                <p class="text-muted">Some info about you .</p>
                <!--         
                        <div id="withImage" class="">
                            <div id="name" class="d-inline text-muted font-weight-bold col-md-2">PHOTO</div>
                            <div id="description" class="d-inline setMargin text-muted col-md-8">A photo helps personalize your account</div>
                            <div id="image" class=" float-right mr-5 col-md-2"><img src="User.png" class="bg-dark rounded-circle" alt="" style="width: 75px;height: 75px;"></div>
                        </div> -->
                <hr> 

                <div id="btn1" class="">
                    <div id="name" class="col-md-2 d-inline font-weight-bold"><b>Name</b></div>
                    <input type="hidden" name="fname" value="<%=fname%>">
                    <div id="description" class="d-inline setMargin col-md-8" name="fname" value="<%= fname%>"><%= fname%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div>
                </div>
                <hr>

                <div id="btn1" class="">
                    <div id="name" class="col-md-2 d-inline font-weight-bold"><b>Birthyear</b></div>
                    <input type="hidden" name="birthyear" value="<%=birthyear%>">
                    <div id="description" class="d-inline setMargin col-md-8" style="margin: 175px"><%= birthyear%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div>
                </div>
                <hr>

                <div id="btn1" class="">
                    <div id="name" class="col-md-2 d-inline font-weight-bold "><b>Experience</b></div>
                    <input type="hidden" name="experience" value="<%=experience%>">
                    <div id="description" class="d-inline setMargin col-md-8" style="margin: 165px"><%= experience%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div>
                </div>
                <hr>

                <div id="btn1" class="">
                    <div id="name" class="d-inline font-weight-bold col-md-2"><b>Qualification</b></div>
                    <input type="hidden" name="qualification" value="<%=qualification%>">
                    <div id="description" class="d-inline setMargin col-md-8" style="margin: 150px"><%= qualification%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div><br><br>
                </div>
                <hr>
                <div id="btn1" class="">
                    <div id="name" class="d-inline font-weight-bold col-md-2"><b>Address</b></div>
                    <input type="hidden" name="address" value="<%=address%>">
                    <div id="description" class="d-inline setMargin col-md-8" style="margin: 185px"><%=address%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div><br><br>
                </div>
                <hr>
                <div id="btn1" class="">
                    <div id="name" class="d-inline  font-weight-bold col-md-2"><b>Department</b></div>
                    <input type="hidden" name="dept" value="<%=dept%>">
                    <div id="description" class="d-inline setMargin col-md-8" style="margin: 155px"><%=dept%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div><br><br>
                </div>
                <hr>
                <div id="btn1" class="">
                    <div id="name" class="d-inline font-weight-bold col-md-2"><b>Password</b></div>
                    <input type="hidden" name="pass" value="<%=password%>">
                    <div id="description" class="d-inline setMargin col-md-8" style="margin: 175px"><%=password%></div>
                    <div id="image" class=" float-right mr-5 col-md-2"></div><br><br>
                </div>
                <hr>

            </div>
        </form>
        <div id="Contact" class="border border-dark rounded-lg-2">
            <h3>Contact Info</h3>
            <div id="withImage" class="">
                <div id="name" class="d-inline font-weight-bold col-md-2"><b>Email</b></div>
                <input type="hidden" name="email" value="<%=email%>">
                <div id="description" class="d-inline setMargin col-md-8" style="margin: 190px"><%=email%></div>
                <div id="image" class="float-right mr-5 col-md-2"></div>
            </div>
            <hr>

            <div id="btn1" class="">
                <div id="name" class="col-md-2 d-inline font-weight-bold"><b>Phone</b></div>
                <input type="hidden" name="contact" value="<%=contact%>">
                <div id="description" class="d-inline setMargin col-md-8" style="margin: 185px"><%=contact%></div>
                <div id="image" class=" float-right mr-5 col-md-2"></div>
            </div>
            <hr>
        </div>

        <script>
            $(document).ready(function () {
                var uname = "<%=name%>";
                showdata();

                //Get data in Edit form
                $("#update").on("click", function (e) {
                    e.preventDefault();

                    console.log("Update Button Clicked");
                    console.log(uname);
                    showdata();
                });
                function showdata() {

                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/getInvigilatorData",
                        data: {
                            username: uname
                        },
                        dataType: "json",
                        success: function (data1) {
                            $("#exp").val(data1.exp);
                            $("#qual").val(data1.quali);
                            $("#addr").val(data1.addr);
                            $("#pass").val(data1.pass);
                            $("#dept").val(data1.department);
                            $("#email").val(data1.email);
                            $("#phoneno").val(data1.phone_number);
                            console.log(data1);
                        }

                    });
                }

                //Update
                $("#form").on("click", "#btn-save", function (e) {
                    e.preventDefault();
                    var uname = "<%=name%>";
                    console.log("Save Button Clicked");

                    var exp = $("#exp").val();
                    var qual = $("#qual").val();
                    var addr = $("#addr").val();
                    var pass = $("#pass").val();
                    var dept = $("#dept").val();
                    var email = $("#email").val();
                    var phoneno = $("#phoneno").val();

                    $.ajax({
                        method: "POST",
                        url: "${pageContext.request.contextPath}/updateInvigilatorData",
                        data: {
                            username: uname,
                            exp1: exp,
                            qual1: qual,
                            addr1: addr,
                            pass1: pass,
                            dept1: dept,
                            email1: email,
                            phoneno1: phoneno
                        },
                        //dataType: "json",
                        success: function (data1) {
                            //alert(data1);
                            $("#form")[0].reset();

                            swal.fire({
                                title: 'Updated Sucessfully',
                                confirmButtonText: `OK`
                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                   // Swal.fire('Saved!', '', 'success')
                                   location.reload(true);  
                                }
                            });
                            showdata();
                        }
                    });
                });

            });
//            $(".swal-button").on("click",function () {
//            console.log("Hello there button just got clicked")
//            location.reload(true);
//            });

        </script>

        <!--        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>