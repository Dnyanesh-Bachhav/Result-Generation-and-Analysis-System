<%-- 
    Document   : Change Password For admin
    Created on : 2 Aug, 2020, 10:06:29 AM
    Author     : DELL
--%>

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Change</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <!--<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->
         <script src="../js/jquery-3.5.1.min.js"></script>
                 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <%!
            String username;
        %>

        <%
            username = ((String) session.getAttribute("admin_uname"));
        %>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <center><h1 style="padding-top: 70px;">Change Password</h1></center>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <form method="post" id="passwordForm" action="">
                        <input type="text" class="input-lg form-control" readonly="" name="username" id="old_password" placeholder="Old Password" autocomplete="off" value="<%=username%>"><br>
                        <input type="password" class="input-lg form-control" name="password1" id="password1" placeholder="New Password" autocomplete="off" required="">
                        <div class="row">
                            <div class="col-sm-6">
                                <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 8 Characters Long<br>
                                <span id="ucase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Uppercase Letter
                            </div>
                            <div class="col-sm-6">
                                <span id="lcase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Lowercase Letter<br>
                                <span id="num" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Number
                            </div>
                        </div>
                        <input type="password" class="input-lg form-control" name="password2" id="password2" placeholder="Repeat Password" autocomplete="off" required="">
                        <div class="row">
                            <div class="col-sm-12">
                                <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match
                            </div>
                        </div>
                        <input type="submit" id="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change Password">
                    </form>
                </div><!--/col-sm-6-->
            </div><!--/row-->
        </div>
        <script>
            $("input[type=password]").keyup(function () {
                var ucase = new RegExp("[A-Z]+");
                var lcase = new RegExp("[a-z]+");
                var num = new RegExp("[0-9]+");

                if ($("#password1").val().length >= 8) {
                    $("#8char").removeClass("glyphicon-remove");
                    $("#8char").addClass("glyphicon-ok");
                    $("#8char").css("color", "#00A41E");
                } else {
                    $("#8char").removeClass("glyphicon-ok");
                    $("#8char").addClass("glyphicon-remove");
                    $("#8char").css("color", "#FF0004");
                }

                if (ucase.test($("#password1").val())) {
                    $("#ucase").removeClass("glyphicon-remove");
                    $("#ucase").addClass("glyphicon-ok");
                    $("#ucase").css("color", "#00A41E");
                } else {
                    $("#ucase").removeClass("glyphicon-ok");
                    $("#ucase").addClass("glyphicon-remove");
                    $("#ucase").css("color", "#FF0004");
                }

                if (lcase.test($("#password1").val())) {
                    $("#lcase").removeClass("glyphicon-remove");
                    $("#lcase").addClass("glyphicon-ok");
                    $("#lcase").css("color", "#00A41E");
                } else {
                    $("#lcase").removeClass("glyphicon-ok");
                    $("#lcase").addClass("glyphicon-remove");
                    $("#lcase").css("color", "#FF0004");
                }

                if (num.test($("#password1").val())) {
                    $("#num").removeClass("glyphicon-remove");
                    $("#num").addClass("glyphicon-ok");
                    $("#num").css("color", "#00A41E");
                } else {
                    $("#num").removeClass("glyphicon-ok");
                    $("#num").addClass("glyphicon-remove");
                    $("#num").css("color", "#FF0004");
                }

                if ($("#password1").val() == $("#password2").val()) {
                    $("#pwmatch").removeClass("glyphicon-remove");
                    $("#pwmatch").addClass("glyphicon-ok");
                    $("#pwmatch").css("color", "#00A41E");
                } else {
                    $("#pwmatch").removeClass("glyphicon-ok");
                    $("#pwmatch").addClass("glyphicon-remove");
                    $("#pwmatch").css("color", "#FF0004");
                }
            });

            
                
                $(document).ready(function(){
                    var checkpass;
                     var newpass;
                     
            $("#submit").on("click",function(e) {
                e.preventDefault();
                    checkpass = document.getElementById("password1").value;
                    newpass = document.getElementById("password2").value;
                    if (checkpass === newpass) {
                        $.ajax({
                        url: "../Controller/changePasswordAdmin.jsp",
                        method: "POST",
                        data: {
                            password1: checkpass,
                            password2: newpass,
                            username : '<%= username %>'
                        },
                        success: function(data){
                                swal({
                                title: "Password Updated SuccessFully!",
                                text: "Go head",
                                icon: "success",
                                button: "Ok"
                            });
                            $("#passwordForm")[0].reset();
                        },
                        error: function(){
                            console.log("Error Occured...");
                        }
                    });
                    } else {
                        swal({
                                title: "Password Not Match..",
                                text: "Enter Again..",
                                icon: "error",
                                button: "Ok"
                            });
                    }
                
            
                 
                    
                    });
                }); 
                
        </script>
    </body>
</html>
