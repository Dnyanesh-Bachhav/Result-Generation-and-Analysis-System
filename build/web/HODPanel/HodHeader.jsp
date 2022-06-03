<%-- 
    Document   : Hod Nav-Bar
    Created on : 1 Aug, 2020, 7:09:40 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/NavigationBar_Style.css">
        <style>
            .btn-home{
                background: rgb(255, 255, 255);
            }
            .btn-logout{
                background: rgb(255, 255, 255);
            }
        </style>
    </head>
    <body>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to exit this session?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <a href="../HODPanel/Logout.jsp" type="button" class="btn btn-success">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <nav style="background: #2b8c87;">
            <img src="../img/logo1.png" style="width: 70px;margin-top: 3px;" class="float-left">
            <h1 class="float-left ml-2 mt-3 font-weight-bold text-white" style="font-size: 29px;" >Government Polytechnic, Nashik</h1>
            <ul>
                <li><a class=" text-decoration-none btn btn-home"   href="./HODLogin.jsp">Home</a></li>
                <li><a href="logout.jsp" class="text-decoration-none btn btn-logout" data-toggle="modal" data-target="#exampleModal">Logout</a></li>
            </ul>
        </nav>

</ul>

