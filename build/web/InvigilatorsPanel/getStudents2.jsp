<%-- 
    Document   : Get Students of specific course 
    Created on : 28 Aug, 2020, 2:12:36 PM
    Author     : DELL
--%>

<%@page import="beans.StudentCourses"%>
<%@page import="java.util.Collections"%>
<%@page import="beans.Exam_reg"%>
<%@page import="mainController.AdminCon"%>
<%@page import="mainController.invigilatorsCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Courses"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.Map"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Students</title>
        <!--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">-->
        <link rel="stylesheet" href="../css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../css/datatable_css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="../js/jquery-3.5.1.min.js"></script>
        <script src="../js/jquery.table2excel.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            *{
                text-decoration: none;
                font-family: Arial, Helvetica, sans-serif;

            }
            body{
                margin-left: 5%;
                margin-right: 5%;
            }
            table tbody tr:hover{
                background-color: rgb(240, 240, 240);
                transform: 0.4 ease;
            }
            i{
                /*float: right;*/ 
                position: absolute;
                background-color: white;
                transition: background-color 0.9s ease;
                border-radius: 50px;
                padding: 10px;
                margin-left: 165px;

            }
            i:hover{
                background-color: grey;
                border-radius: 50px;
                transition: 0.2s;
            }
            .dropdown{
                position: relative;
                margin-top: 50px;
                margin-right: 200px;
                left: 0px;
                float: right;
            }
            ol{
                position: absolute;
                margin-bottom: 10px;
            }
            .dropdown-menu .d1 :hover {
                background-color: #CE93D8;
                transition: 0.2s ease;
            }
            #btn1:hover{
                background-color: rgb(96, 196, 145);
            }
            #btn2:hover{
                background-color: rgb(96, 196, 145);
            }
            #btn3:hover{
                background-color: rgb(96, 196, 145);
            }
            #btn4:hover{
                background-color: rgb(96, 196, 145);
            }
            #btn5:hover{
                background-color: rgb(96, 196, 145);
            }
            #btn6:hover{
                background-color: rgb(96, 196, 145);
            }
            .thead-excel th{
                color: brown;
                padding: 10px;
            }
            .error{
                color:red;
            }
        </style>

    </head>
    <body>
        <div class="dropdown float-right dropleft">
            <i class="fa fa-list fa-lg " type="button" data-toggle="dropdown"  title="Verify"></i><br><br>
            <ol class="dropdown-menu">
                <a class="dropdown-item" id="btn1"  >Check for Whole Row</a>
                <a href="#" class="dropdown-item" id="btn3">Check for Theory</a>
                <a href="#" class="dropdown-item" id="btn2">Check for PT</a>
                <a href="#" class="dropdown-item" id="btn4">Check for TW</a>
                <a href="#" class="dropdown-item" id="btn5">Check for PR </a>
                <a href="#" class="dropdown-item" id="btn6">Check for OR</a>
            </ol>
        </div>
        <div class=" text-upparcase text-center shadow border border-2 rounded" style="width:700px;margin-left: 200px;font-size: 40px;;color:black;position: absolute;top: 40px;">STUDENT ACADEMICS</div>
        <div class="container" style="margin-top: 80px;">


            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="form" name="myForm">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">STUDENT ACADEMICS</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Roll:</label>
                                    <input type="text" name="" id="roll" class="form-control" placeholder="Roll no." readonly="">

                                </div>
                                <div class="form-group">
                                    <label>TH:</label>
                                    <input type="text" name="th" id="th" class="form-control" placeholder="Theory">
                                    
                                </div>
                                <div class="form-group">
                                    <label>PT:</label>
                                    <input type="email" name="" id="pt" class="form-control" placeholder="Periodic Test">
                                </div>
                                <div class="form-group">
                                    <label>TW:</label>
                                    <input type="text" name="" id="tw" class="form-control" placeholder="Termwork">
                                </div>
                                <div class="form-group">
                                    <label>PR:</label>
                                    <input type="text" name="" id="pr" class="form-control" placeholder="Practical">
                                </div>
                                <div class="form-group">
                                    <label>OR:</label>
                                    <input type="text" name="" id="or" class="form-control" placeholder="Oral">
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
            String courseId;
            String courseName = "";
            String name = "";
            String department = "";
        %>
        <%
            courseId = (String) session.getAttribute("sub");
            int code = (Integer) session.getAttribute("code");
            department = session.getAttribute("departmentName").toString();
            List li = AdminCon.getCourseByCourseId(courseId);
            String uname = session.getAttribute("uname").toString();
            List<Invigilator_details> list = invigilatorsCon.getInvigilatorDetails(uname);

            for (Object i : li) {
                courseName = i.toString();
            }
            for (Invigilator_details data : list) {
                name = data.getInvigilatorName();
            }
            //out.println(course_name);
//            List<Courses> li = invigilatorsCon.getCourseCodeByCourseName(course_name, code);
//            for (Courses name : li) {
//                courseId = name.getCourse_code();
//            }
%>

        <input type="text" id="courseId" value='<%= courseId%>' hidden>
        <table id="table1" class="table table-striped table-bordered">

            <thead>
                <tr hidden>
                    <td colspan="8" style="display: flex;align-items: center;justify-content: center;text-align: center;">
                        <h1 style="color: green;font-size: 50px;" class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Government Polytechnic, Nashik</h1>
                    </td>
                </tr>
                <!--            <tr hidden>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                
                            </tr>-->
                <tr hidden> 
                    <td colspan="8"><blockquote class="blockquote text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;An autonomous institute of Government of Maharashtra.</blockquote>
                    </td>
                </tr>
                <tr hidden> 
                    <td colspan="8">
                        <blockquote class="blockquote text-center float-left"><b>Course Code:</b><%= courseId%><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Course Name:</b><%= courseName%></blockquote>

                    </td>
                </tr>
                <tr hidden>
                    <td colspan="8">
                        <blockquote class="blockquote"><b>Teacher's Name:</b><%= name%><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:</b><%= department %></blockquote>

        </td>

    </td>
</tr>
<tr hidden>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>

</tr>
<tr class="thead-excel" hidden>
                    <!--<th>ID</th>-->
                    <th><div style="color: brown;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Roll No.</div></th>
                    <th style="background-color: #bfff00;"><div style="color: brown;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PT</div></th>
                    <th style="background-color: #bfff00;"><div style="color: brown;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TH</div></th>
                    <th style="background-color: #bfff00;"><div style="color: brown;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TW</div></th>
                    <th style="background-color: #bfff00;"><div style="color: brown;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR</div></th>
                    <th style="background-color: #bfff00;"><div style="color: brown;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</div></th>
                    <th class="avoid">Actions</th>
                </tr>
<tr class="avoid">
    <!--<th>ID</th>-->
    <th>Roll No.</th>
    <th>PT</th>
    <th>TH</th>
    <th>TW</th>
    <th>PR</th>
    <th>OR</th>
    <th class="avoid">Actions</th>
</tr>
</thead>
<tbody id="tbody">
    <%--<%
        List<Object[]> list = AdminCon.getListOfStudentCourses(courseId);
        for (Object[] obj : list) {

                %>
                <tr>
                    <td><%=obj[0]%></td>
                    <td><%=obj[2]%></td>
                    <td><%=obj[3]%></td>
                    <td><%=obj[4]%></td>
                    <td><%=obj[5]%></td>
                    <td><%=obj[6]%></td>
                    <td>
                        <a href='#' class="btn btn-warning" id="btn-edit" data-sid=<%=obj[0]%> data-toggle="modal" data-target="#myModal">Edit</a>

                    </td>
                </tr>
                <%
                    }
                %>--%>
</tbody>
</table>
<br>
<br>
<button class="btn btn-primary exportBtnClass">Export to XLS file</button>


<br>
<br>
<script>
    $(document).ready(function () {
        showData();


        //Get data in Edit form
        $("#tbody").on("click", "#btn-edit", function (e) {
            e.preventDefault();
            var courseId = document.getElementById("courseId").value;
            console.log("Edit Button Clicked");
            let id = $(this).attr("data-sid");
            console.log(id);
            console.log(courseId);

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/Edit_Controller1",
                data: {
                    sid: id,
                    courseId: courseId
                },
                dataType: "json",
                success: function (data1) {
                    $("#roll").val(data1.studentId);
                    $("#pt").val(data1.periodicTest);
                    $("#th").val(data1.theory);
                    $("#tw").val(data1.termwork);
                    $("#pr").val(data1.practical);
                    $("#or").val(data1.oral);
                }
            });
        });


        //Update
        $("#form").on("click", "#btn-save", function (e) {
            e.preventDefault();
            var courseId = document.getElementById("courseId").value;
            console.log("Save Button Clicked");
            let id = $("#roll").val();
            console.log(id);
            console.log(courseId);

            var th = $("#th").val();
            var pt = $("#pt").val();
            var tw = $("#tw").val();
            var pr = $("#pr").val();
            var or = $("#or").val();

            $.ajax({
                method: "POST",
                url: "${pageContext.request.contextPath}/Edit_Controller",
                data: {
                    sid: id,
                    courseId: courseId,
                    th: th,
                    pt: pt,
                    tw: tw,
                    pr: pr,
                    or: or
                },
                //dataType: "json",
                success: function (data1) {
                    //alert(data1);
                    $("#form")[0].reset();
                    showData();
                }
            });
        });



        function showData() {
            //e.preventDefault();
            var courseId = document.getElementById("courseId").value;
            var output = "";

            $.ajax({
                method: "GET",
                url: "${pageContext.request.contextPath}/Retrieve",
                data: {
                    courseId: courseId
                },
                dataType: "json",
                success: function (data1) {

                    data1.forEach((item) => {
                        output += "<tr><td>" + item[0] + "</td><td>" + item[2] + "</td><td>" + item[3] + "</td><td>" + item[4] + "</td><td>" + item[5] + "</td><td>" + item[6] + "</td><td><a href='#' class='btn btn-warning avoid' id='btn-edit' data-sid=" + item[0] + " data-toggle='modal' data-target='#myModal'>Edit</a></td></tr>";
                    });
                    document.getElementById("tbody").innerHTML = output;
                    $('#table1').DataTable();
                }

            });
        }
        //$('#table1').DataTable();

        $(function () {
            $(".exportBtnClass").click(function (e) {
                var table = $("#table1");
                if (table && table.length)
                {
                    var preserveColors = table.hasClass("colorClass") ? true : false;

                    $(table).table2excel({
                        // This class's content is excluded from getting exported
                        exclude: ".avoid",
                        name: "Output excel file ",
                        filename: "Download",

                        fileext: ".xlsx", //File extension type
                        exclude_img: false,
                        exclude_links: true,
                        exclude_inputs: true,
                        preserveColors: preserveColors,

                    });
                }
            });
        });

        // To check table
        function checkIfZero() {
            $("table tbody tr").filter(function () {
                var cellArray = $(this)[0].cells;
                var cellArray2 = [];
                let count = 0;
                //console.log($(this)[0].cells[0].innerText);
                for (var i = 0; i < cellArray.length; i++)
                {
                    cellArray2.push(cellArray[i].innerText);
                    if (cellArray2[i] == 0)
                    {
                        count++;
                    }
                }
                //console.log(cellArray2);

                if (cellArray2.includes("0"))
                {
//        	$(this).css("background-color","rgb(96, 196, 145)");
                    cellArray[1].style.backgroundColor = "rgb(96, 196, 145)";
                    cellArray[2].style.backgroundColor = "rgb(96, 196, 145)";
                    cellArray[3].style.backgroundColor = "rgb(96, 196, 145)";
                    cellArray[4].style.backgroundColor = "rgb(96, 196, 145)";
                    cellArray[5].style.backgroundColor = "rgb(96, 196, 145)";
                }
                // if(count == 4)
                // {
                // 	$(this).css("background-color","rgb(96, 196, 145)");
                // }

                //console.log(cellArray[0].innerText);
            });
        }
        function checkIfPTZero() {
            $("table tbody tr").filter(function () {
                var cellArray = $(this)[0].cells;
                var cellArray2 = [];
                if (cellArray[1].innerText == 0)
                {
                    cellArray[1].style.backgroundColor = "red";
                }
            });
        }
        function checkIfTHZero() {
            $("table tbody tr").filter(function () {
                var cellArray = $(this)[0].cells;
                var cellArray2 = [];
                if (cellArray[2].innerText == 0)
                {
                    cellArray[2].style.backgroundColor = "green";
                }
            });
        }
        function checkIfTWZero() {
            $("table tbody tr").filter(function () {
                var cellArray = $(this)[0].cells;
                var cellArray2 = [];
                if (cellArray[3].innerText == 0)
                {
                    cellArray[3].style.backgroundColor = "blue";
                }
            });
        }
        function checkIfPRZero() {
            $("table tbody tr").filter(function () {
                var cellArray = $(this)[0].cells;
                var cellArray2 = [];
                if (cellArray[4].innerText == 0)
                {
                    cellArray[4].style.backgroundColor = "yellow";
                }
            });
        }
        function checkIfORZero() {
            $("table tbody tr").filter(function () {
                var cellArray = $(this)[0].cells;
                var cellArray2 = [];
                if (cellArray[5].innerText == 0)
                {
                    cellArray[5].style.backgroundColor = "orange";
                }
            });
        }
        $("#btn1").on("click", checkIfZero);
        $("#btn2").on("click", checkIfPTZero);
        $("#btn3").on("click", checkIfTHZero);
        $("#btn4").on("click", checkIfTWZero);
        $("#btn5").on("click", checkIfPRZero);
        $("#btn6").on("click", checkIfORZero);

        
    });


</script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!--<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>-->
<script src="../js/jquery.dataTables.min.js"></script>
</body>
</html>
