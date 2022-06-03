<%-- 
    Document   : try2
    Created on : 12 Oct, 2020, 2:11:43 PM
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
            <li>Make a proper excel file(Proper by mean you should not use extra spaces in the header and footer section of excel file).</li><br>
            <li>You should not give extra blank column between columns.</li><br>
            <li>You should not include heading to the excel file.</li><br>
            <li>Proper excel file look like this.</li><br>
            <img src="../img/excel.PNG"><br><br>
            <li>If you don't understand anything you must prefer this below video.</li>
        </ol>
    </div>

    <script>
        $("#btn-del").on("click", function () {
            alert("Click");
        });
    </script>


</body>
</html>
