<%-- 
    Document   : updateLastExamination
    Created on : 18 Apr, 2021, 11:48:22 AM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Examination</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            body{
                margin-left: 5%;
                margin-right: 5%;
            }
        </style>
        <script src="../js/jquery-3.5.1.min.js"></script>

    </head>
    <%!
        String currentExaminationYear = "";
        String currentSemester = "";
        String lastExaminationYear = "";

    %>
    <br><h1>Update Examination:</h1><br>
    <%
        List<Admin_info> list = AdminCon.getAdmin_info();
        for (Admin_info li : list) {
            currentSemester = li.getCurrentTerm();
            currentExaminationYear = li.getCurrentExaminationYear();
            lastExaminationYear = li.getLastExaminationYear();
        }
    %>


    <body>

        <div class="container">


            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="form">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Update Academics</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Last Examination Year:</label>
                                    <input type="text" name="" id="lastExaminationYear1" class="form-control" placeholder="Last Examination Year" required>
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
        <div style="border: 1px solid black;" class="p-5">
            <form action="">
                <div class="form-group" hidden>
                    <label>Current Semester:</label>
                    <input type="text" name="password" id="currentSemester" placeholder="Last Semester" class="form-control" style="width: 400px;" value="<%= currentSemester%>">
                </div>
                <div class="form-group" hidden>
                    <label>Current Examination Year:</label>
                    <input type="text" name="confirmPassword" placeholder="for eg.SUMMER-2020/WINTER-2021" id="currentExaminationYear"  class="form-control" style="width: 400px;" value="<%= currentExaminationYear%>">
                </div>
                <div class="form-group">
                    <label>Last Examination Year:</label>
                    <input type="text" name="" id="lastExaminationYear" class="form-control" placeholder="Last Examination Year" value="<%= lastExaminationYear%>" required>
                </div>
            </form>
            <a href="" data-toggle="modal" data-target="#myModal" class="btn btn-success" id="btn-update">Update</a>
            <script>
                $(document).ready(function () {
                    $("#btn-update").on('click', function () {
                        document.getElementById("lastExaminationYear1").value = '<%= lastExaminationYear%>';
//                        document.getElementById("currentSemester").value = '<%= currentSemester%>';
//                        document.getElementById("currentExaminationYear").value = '<%= currentExaminationYear%>';

                    });

                    $("#btn-save").on('click', function () {
                        var val1 = document.getElementById("lastExaminationYear1").value;
                        var val2 = document.getElementById("currentSemester").value;
                        var val4 = document.getElementById("currentExaminationYear").value;
                        $.ajax({
                            type: "GET",
                            url: "${pageContext.request.contextPath}/update_lastExamination",
                            data: {
                                currentSemester: val2,
                                currentExaminationYear: val4,
                                lastExaminationYear: val1
                            },
                            dataType: "json",
                            success: function (data1) {
                                alert(data1.message);
                                location.reload();
                            },
                            error: function () {
                                console.log("Error");
                            }
                        });

                    });

                });


            </script>

            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>
