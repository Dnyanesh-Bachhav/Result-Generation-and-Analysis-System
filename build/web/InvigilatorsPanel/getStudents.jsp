<%-- 
    Document   : Get Students of perticular course
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        
        
        <style>
            body{
                margin-left: 5%;
                margin-right: 5%;
            }
            table tbody tr td{
                border: 1px solid lightgrey;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="text-primary text-upparcase text-center">Student CRUD OPERATION</h1>


            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">AJAX CRUD OPERATION</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Roll:</label>
                                <input type="text" name="" id="roll" class="form-control" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label>TH:</label>
                                <input type="text" name="" id="th" class="form-control" placeholder="Last Name">
                            </div>
                            <div class="form-group">
                                <label>PT:</label>
                                <input type="email" name="" id="pt" class="form-control" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label>TW:</label>
                                <input type="text" name="" id="tw" class="form-control" placeholder="Mobile Number">
                            </div>
                            <div class="form-group">
                                <label>PR:</label>
                                <input type="text" name="" id="pr" class="form-control" placeholder="Mobile Number">
                            </div>
                            <div class="form-group">
                                <label>OR:</label>
                                <input type="text" name="" id="or" class="form-control" placeholder="Mobile Number">
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal" onclick="">Save</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>


        </div>
        <%!
            String courseId;
        %>
        <%
            String course_name = (String) session.getAttribute("sub");
            int code = (Integer) session.getAttribute("code");
            //out.println(course_name);
            List<Courses> li = invigilatorsCon.getCourseCodeByCourseName(course_name, code);
            for (Courses name : li) {
                courseId = name.getCourse_code();
            }
        %>
        
        <input type="text" id="courseId" value='<%= courseId%>' hidden>
        <table id="table1">
            <thead>
                <tr>
                    <!--<th>ID</th>-->
                    <th>Roll No.</th>
                    <th>Branch</th>
                    <th>PT</th>
                    <th>TH</th>
                    <th>TW</th>
                    <th>PR</th>
                    <th>OR</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="tbody">
                <%
                    List<Exam_reg> getList = invigilatorsCon.getExam_regByCourseId(courseId);
                    int i = 0;
                    //Collections.sort(getList);
                    for (Exam_reg list : getList) {

                %>
                <tr>
                    <%--<td><%= ++i%></td>--%>
                    <td><%= list.getRegno()%></td>
                    <td><%= list.getProg()%></td>
                    <%

                        int roll = list.getRegno();

    //               List<StudentCourses> getList2 = invigilatorsCon.getStudentCoursesByRollCode(roll, courseId);
                      Map<String, Integer> list2 = invigilatorsCon.getStudentCoursesByRollCode(roll, courseId);
//                    for(StudentCourses list2: getList2)
//                    {
//                        int tw = list2.getPeriodicTest();
//                        String tw1 = String.valueOf(tw);
//                        if(tw1.equals(null))
//                        tw1 = "0";
//                        out.print(tw1);
%>

                    <%--<td><%= list2.getPeriodicTest()%></td>
                    <td><%= list2.getTheory()%></td>
                    <td><%= list2.getTermwork()%></td>
                    <td><%= list2.getPractical()%></td>
                    <td><%= list2.getOral()%></td>--%>
                    <td><%= list2.get("Val1")%></td>
                    <td><%= list2.get("Val2")%></td>
                    <td><%= list2.get("Val3")%></td>
                    <td><%= list2.get("Val4")%></td>
                    <td><%= list2.get("Val5")%></td>
                    <td>
                        
                        <script>
//                            var roll = document.getElementById("roll").value;
//                            $("#btn-edit").val(roll);
                        </script>
                        <a href='#' class="btn btn-warning" id="btn-edit" data-sid=<%= list.getRegno()%> data-toggle="modal" data-target="#myModal">Edit</a>
                       
                        <%-- ?u=<%=list.getRegno() %>&v=<%= list.getCourse_code()%> --%>
                    </td>
                    <%
                        //}
                    %>

                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <form>
            <input type="submit" value="Save" class="float-right">

        </form>
        
        
        <br>
        <br>
        <script>
                    $(document).ready( function () {
    $('#table1').DataTable();

            $("#tbody").on("click","#btn-edit",function(){
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
                    //contentType: "application/json; charset=utf-8",
                    success: function (data1) {
                        //var obj = jQuery.parseJSON(data1);
                        

                      //alert(data1);
//                        var jsontest = eval(data1);
//                        $("#pt").val(jsontest("pt"));
                        //console.log("Welcome Back");
                        //var obj = JSON.parse(data1);
                        //var obj = $.parseJSON(data1);

                        //console.log(obj[0].pt);
                        //console.log(data1.periodicTest);
                        $("#roll").val(data1.studentId);
                        $("#pt").val(data1.periodicTest);
                        $("#th").val(data1.theory);
                        $("#tw").val(data1.termwork);
                        $("#pr").val(data1.practical);
                        $("#or").val(data1.oral);
                        
//console.log(obj[0].pt);
//                        $("#pt").val(obj[0].pt);
//                        $("#th").val(obj[0].th);
//                        $("#tw").val(obj[0].tw);
//                        $("#pr").val(obj[0].pr);
//                        $("#or").val(obj[0].or);
data1 = undefined;
                    }
                });
        });
})
        </script>
        
       
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    </body>
</html>
