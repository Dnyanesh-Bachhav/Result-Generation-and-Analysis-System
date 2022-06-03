<%-- 
    Document   : Instructions
    Created on : 11 Oct, 2020, 2:17:24 PM
    Author     : tppat
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Instructions Page</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>        <style>
            body{
                margin: 5%;
                background-color: lightgray;
            }
            .box1{
                font-size: 25px;
                border: 1px solid #1e1e1e;
                background-color: white;
                border-radius: 10px;
                padding: 50px;
            }
            #suggestion{
                font-size: 28px;
            }
        </style>
    </head>         
    <body>
    <center><div class="bg-light border border-dark p-4 mb-5 rounded" id="suggestion" style="border: 2px solid;">Please have a look on below instructions when new Semester get Started.</div></center>
        <br>
    <center><h1 id="container" class="bg-white shadow-lg text-center display-4 rounded" style="width: 400px;">
            Instructions
        </h1></center><br><br>
        <center><span class="glyphicon glyphicon-arrow-down "></span></center><br>
    <div class="container mt-5 box1 " style="width: 100%;height: 100%;">
        <ol start="1">
            <li>Please have a backup of student_courses table in database(just for safety).</li>
            <button class="btn btn-success"><a href="" class="text-decoration-none"></a>Backup</button>
            <li>Please Delete previous records in student_courses.</li>
            <button class="btn btn-danger" id="del-btn"><a href="" class="text-decoration-none"></a>Delete</button>
            <li>Please check if the records get deleted successfully.</li>
            <button class="btn btn-success"><a href="" class="text-decoration-none"></a>Show</button>
            <li>Please import Exam_reg table from database.</li>
            <a href="../HODPanel/getcourses.jsp" class="text-decoration-none" ><button class="btn btn-success">Import</button></a>
            
        </ol>
    </div>

    <script>
        $("#btn-del").on("click", function () {
            alert("Click");
        });
    </script>


</body>
</html>
