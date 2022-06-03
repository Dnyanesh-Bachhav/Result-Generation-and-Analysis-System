<%-- 
    Document   : declareResultInstructions (Instructions Page)
    Created on : 7 Apr, 2021, 5:10:04 PM
    Author     : DELL
--%>

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="java.util.List"%><%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Declare Result</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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


        <!-- Modal -->
        <div class="modal fade" id="backUpModal" tabindex="-1" aria-labelledby="backUpModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Backup</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        File downloading...<br>
                        Click on <b>Ok</b> to continue...
                    </div>
                    <div class="modal-footer">
                        <a href="../Controller/Backup.jsp" class="btn btn-success">Ok</a>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!--Clear Data Modal-->
        <div class="modal fade" id="clearDataModal" tabindex="-1" aria-labelledby="backUpModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Clear Data</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        This may cause loosing your data<br>
                        Are you sure you want to continue...
                    </div>
                    <div class="modal-footer">
                        <a href="./clearResultTables.jsp" class="btn btn-primary">Clear Data</a>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Declare Result-->
        <div class="modal fade" id="declareResultModal" tabindex="-1" aria-labelledby="declareResultModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Declare Result</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        This process may take a while<br>
                        Click on <b>Declare Result</b> to continue...
                    </div>
                    <div class="modal-footer">
                        <a href="${pageContext.request.contextPath}/Generate_Result" class="btn btn-success">Declare Result</a>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--<h1>Hello World!</h1>-->


        <div class="bg-light border border-dark p-4 mb-5 rounded" id="suggestion">Please have a look on below instructions while result declaration.</div>

    <center><div id="container" class="bg-white shadow-lg text-center display-4 rounded" style="width: 400px;">
            Instructions
        </div></center>
    <div id="showAlert">
        Hello there...    
    </div>
    <div class="container mt-5 box1 p-2" style="width: 100%;height: 100%;">
        <ol start="1">
            <li>Please have a backup of result table in database(just for safety).</li>
            <a href="#" class="btn btn-primary text-decoration-none" data-toggle="modal" data-target="#backUpModal">Backup</a>
            <li>Clear all previous entries in result table.</li>
                <%
                    session.setAttribute("clearResultValue", 0);
                %>
            <a href="#" class="btn btn-primary text-decoration-none" data-toggle="modal" data-target="#clearDataModal">Clear Data</a>
            <li>Choose semester whose result you want to declare.For Example: EVEN-20,ODD-21,etc.</li>
            <a href="./updateLastExamination.jsp" class="btn btn-primary text-decoration-none">Choose Semester</a>
            <li>Declare result.</li>
            <a href="#" class="btn btn-primary text-decoration-none" data-toggle="modal" data-target="#declareResultModal">Declare Result</a>
            <li>Please check records inserted successfully or not.</li>
            <a href="./checkResultTable.jsp" class="btn btn-primary">Check table</a>
        </ol>
    </div>
    <script>
        let alert = document.getElementById("showAlert");
        alert.style.display = "none";
        if (<%= session.getAttribute("clearResultValue")%> > 0) {
            alert.style.display = "flex";
            alert.classList.add("alert alert-success");
        }
    </script>

    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
