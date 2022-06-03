<%-- 
    Document   : instructions page
    Created on : 3 Oct, 2020, 12:20:45 PM
    Author     : DELL
--%>

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="java.util.List"%><%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instruction</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            *{
                text-decoration: none;
                font-family: Arial, Helvetica, sans-serif;

            }
            body{
                margin: 5%;
                /*font-family: arial;*/
            }
            .box1{
                font-size: 25px;
                border: 1px solid #1e1e1e;
                background-color: lightcyan;
                border-radius: 10px;
            }
            #suggestion{
                font-size: 28px;
            }
        </style>
    </head>
    <body>
        <div class="bg-light border border-dark p-4 mb-5 rounded" id="suggestion">Please have a look on below instructions when new Semester get Started.</div>

    <center><div id="container" class="bg-white shadow-lg text-center display-4 rounded" style="width: 400px;">
            Instructions
        </div></center>
    <div class="container mt-5 box1 p-2" style="width: 100%;height: 100%;">
        <ol start="1">
            <li>Please have a backup of student_courses table in database(just for safety).</li>
            <a href="../Controller/Backup.jsp" class="btn btn-success text-decoration-none" onclick="alert('File Downloaded...')">Backup</a>
            <li>Please update the Examination for eg. WINTER-2020,SUMMER-2021.</li>
            <a href="updateExamination.jsp" class="text-decoration-none btn btn-success">Update Examination</a>
            <li>Please check if Examination updated successfully.</li>
            <a href="checkExamination.jsp" class="btn btn-success text-decoration-none">Check Examination</a>
            <li>Please import Exam_reg table from database.</li>
            <a href="importExam_reg.jsp" class="btn btn-success text-decoration-none">Import</a>
            <li>Please check records inserted successfully or not.</li>
            <a href="checkTable.jsp" class="btn btn-success">Check table</a>
        </ol>
    </div>

    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</body>
</html>
