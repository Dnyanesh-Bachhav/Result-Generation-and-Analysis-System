<%-- 
    Document   : ViewInvigilator
    Created on : 27 Aug, 2020, 2:51:06 PM
    Author     : tppat
--%>

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.Map"%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../css/datatable_css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="../js/jquery-3.5.1.min.js"></script>
        <script src="../js/jquery.table2excel.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <title>View Course</title>

    </head>
    <body>
        <div class="container">


            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="form">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">INVIGILATORS DETAILS</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Invigilator_Id</label>
                                    <input type="text" name="" id="id" class="form-control" placeholder="Invigilator_Id">
                                </div>
                                <div class="form-group">
                                    <label>Invigilator_Name</label>
                                    <input type="text" name="" id="name" class="form-control" placeholder="Invigilator_Name">
                                </div>
                                <div class="form-group">
                                    <label>Invigilator_Base</label>
                                    <input type="text" name="" id="base" class="form-control" placeholder="Invigilator_Base">
                                </div>
                                <div class="form-group">
                                    <label>Qualification</label>
                                    <input type="text" name="" id="qual" class="form-control" placeholder="Qualification">
                                </div>
                                <div class="form-group">
                                    <label>Designation</label>
                                    <input type="text" name="" id="desg" class="form-control" placeholder="Designation">
                                </div>
                                <div class="form-group">
                                    <label>Specialized_Subject1</label>
                                    <input type="text" name="" id="sub1" class="form-control" placeholder="Specialized_Subject1">
                                </div>
                                <div class="form-group">
                                    <label>Specialized_Subject2</label>
                                    <input type="text" name="" id="sub2" class="form-control" placeholder="Specialized_Subject2">
                                </div>
                                <div class="form-group">
                                    <label>Specialized_Subject3</label>
                                    <input type="text" name="" id="sub3" class="form-control" placeholder="Specialized_Subject3">
                                </div>
                                <div class="form-group">
                                    <label>Specialized_Subject4</label>
                                    <input type="text" name="" id="sub4" class="form-control" placeholder="Specialized_Subject4">
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


        </div>        <%--<%@include file="HodHeader.jsp"%>--%>
        <%!
            String Fname;
            String Lname;
            String Education;
            String Program;
            String User;
            String Username;
            int Id;
            int Shift;
            int dept_code;
        %>
        <%
            try {
                String username = ((String) session.getAttribute("hod_uname"));
                List<Hod_data> details = HodCon.getHodData(username);
                for (Hod_data Details : details) {
                    Program = Details.getProgramme();
                }

        %>
        <%     Map<String, Integer> program = HodCon.getAllbranchcode(Program);
            dept_code = (program.get(Program));
        } catch (Exception e) {
        } finally {
        %>
        <h1 class="m-3" style="padding: 50px;">View All Details Of Invigilators </h1>
        <div class="m-3 ">
            <table id="table1" class="table  table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Invigilator Name</th>
                        <th scope="col">Base</th>
                        <th scope="col">Qualification</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Specialized Subject1</th>
                        <th scope="col">Specialized Subject2</th>
                        <th scope="col">Specialized Subject3</th>
                        <th scope="col">Specialized Subject4</th>      
                        <th scope="col">Department Id</th>      
                        <th scope="col">Action</th>



                    </tr>
                </thead>
                <%--
                      List<Invigilator_details> invigilatordetails = HodCon.getInvigilatordetails(dept_code);
                      for(Invigilator_details ind:invigilatordetails){
                           
                      
                --%>
                <tbody id="tbody">
                    <!--tr>
                      <td><%--=ind.getInvigilatorId()%></td>
                      <td><%=ind.getInvigilatorName()%></td>
                      <td><%=ind.getInvigilatorBase()%></td>
                      <td><%=ind.getQualification()%></td>
                      <td><%=ind.getDesignation()%></td>      
                      <td><%=ind.getSpecializedSubject1()%></td>
                      <td><%=ind.getSpecializedSubject2()%></td>
                      <td><%=ind.getSpecializedSubject3()%></td>
                      <td><%=ind.getSpecializedSubject4()%></td>
                      <td><%=ind.getDepartment()--%></td>
                    </tr-->
                    <%--
                      }
                }
                    --%>   


                </tbody>     
            </table>

            <script type="text/javascript">

                $(document).ready(function () {
                    showData();


                    //Get data in Edit form
                    $("#tbody").on("click", "#btn-edit", function (e) {
                        e.preventDefault();
                        ;
                        let id = $(this).attr("data-sid");
                        console.log(id);


                        $.ajax({
                            type: "GET",
                            url: "${pageContext.request.contextPath}/Invigilator_Edit",
                            data: {
                                sid: id
                            },
                            dataType: "json",
                            success: function (data1) {
//                                console.log(data1);
                                $("#id").val(data1.invigilatorId);
                                $("#name").val(data1.invigilatorName);
                                $("#base").val(data1.invigilatorBase);
                                $("#qual").val(data1.qualification);
                                $("#desg").val(data1.designation);
                                $("#sub1").val(data1.specializedSubject1);
                                $("#sub2").val(data1.specializedSubject2);
                                $("#sub3").val(data1.specializedSubject3);
                                $("#sub4").val(data1.specializedSubject4);
                            }
                        });
                    });


                    //Update
                    $("#form").on("click", "#btn-save", function (e) {
                        e.preventDefault();
                        let id = $("#id").val();
//                        console.log(id);


                        var name = $("#name").val();
                        var base = $("#base").val();
                        var quali = $("#qual").val();
                        var desg = $("#desg").val();
                        var sub1 = $("#sub1").val();
                        var sub2 = $("#sub2").val();
                        var sub3 = $("#sub3").val();
                        var sub4 = $("#sub4").val();

                        $.ajax({
                            method: "GET",
                            url: "${pageContext.request.contextPath}/Invigilator_Update",
                            data: {
                                sid: id,
                                name: name,
                                base: base,
                                quali: quali,
                                desg: desg,
                                sub1: sub1,
                                sub2: sub2,
                                sub3: sub3,
                                sub4: sub4
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
                        var dept_code = "<%=dept_code%>";
                        var output = "";

                        $.ajax({
                            method: "GET",
                            url: "${pageContext.request.contextPath}/RetrieveInvigilator",
                            data: {
                                dept_code: dept_code
                            },
                            dataType: "json",
                            success: function (data1) {

                                data1.forEach((item) => {
                                    output += "<tr><td>" + item[0] + "</td><td>" + item[1] + "</td><td>" + item[2] + "</td><td>" + item[3] + "</td><td>" + item[4] + "</td><td>" + item[5] + "</td><td>" + item[6] + "</td><td>" + item[7] + "</td><td>" + item[8] + "</td><td>" + item[9] + "</td><td><a href='#' class='btn btn-success' id='btn-edit' data-sid=" + item[0] + " data-toggle='modal' data-target='#myModal'>Edit</a></td></tr>";
                                });
                                document.getElementById("tbody").innerHTML = output;
                                $('#table1').DataTable();
                            }

                        });
                    }
                });

                //   $(document).ready(function() {
                //    $('#table1').DataTable();
                //});
            </script>

        </div>
        <% }%><script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <!--<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>-->
        <script src="../js/jquery.dataTables.min.js"></script>
    </body>

</html>
