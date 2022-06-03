<%-- 
    Document   : analytics
    Created on : 21 Nov, 2020, 5:21:29 PM
    Author     : DELL
--%>

<%@page import="java.util.Map"%>
<%@page import="mainController.invigilatorsCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Invigilator_details"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Analytics</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <style>
        *{
            text-decoration: none;
            font-family: Arial, Helvetica, sans-serif;

        }
        h1{
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <body style="background-color: #87CEEB; ">
        <h1 class="m-5">Analytics</h1>
        <div id="table" class="m-5">
            <table class="table table-dark">
                <thead>
                <th>No.</th>
                <th>Subjects</th>
                <th>Action</th>
                </thead>
                <tbody>

                    <%
                        String uname = (String)session.getAttribute("uname");
//                        String uname = "Administrator";
//                        session.setAttribute("code", 51);
                        List<Invigilator_details> li = invigilatorsCon.getInvigilatorDetails(uname);
                        for (Invigilator_details o : li) {

                    %>
                    <tr>
                        <td>1.</td>
                        <%                String sub1 = o.getSpecializedSubject1();
                            Map<String, String> cname = invigilatorsCon.courseNameByCoursCode();
                            int j = sub1.compareToIgnoreCase("None");
                            if (j != 0) {

                        %>
                        <td><a href="" class="btn btn-warning"><%= cname.get(sub1) + " " + sub1%></a></td>
                            <%--<td><a href='getStudents.jsp?sub=<%= sub1%>&code=<%= o.getDepartment()%>' class="btn btn-primary">getStudents</a></td>--%>
                        <td><form action="details.jsp">
                                <input type="text" value='<%= sub1%>' name="sub" hidden>
                                <input type="submit" value="Analytics" class="btn btn-primary">
                            </form></td>
                            <%
                            } else {
                            %>
                            <%
                            }%>

                    </tr>
                    <tr>
                        <td>2.</td>
                        <%
                            String sub2 = o.getSpecializedSubject2();
                            int k = sub2.compareToIgnoreCase("None");
                            if (k != 0) {

                        %>
                        <td><a href="" class="btn btn-warning"><%= cname.get(sub2) + " " + sub2%></a></td>
                        <td><form action="details.jsp">
                                <input type="text" value='<%= sub2%>' name="sub" hidden>
                                <input type="submit" value="Analytics" class="btn btn-primary">
                            </form></td>
                            <%
                            } else {
                            %>
                            <%
                                }
                            %>
                    </tr>

                    <tr>
                        <td>3.</td>
                        <%
                            String sub3 = o.getSpecializedSubject3();
                            int m = sub2.compareToIgnoreCase("None");
                            if (m != 0) {

                        %>
                        <td><a href="" class="btn btn-warning"><%= cname.get(sub3) + " " + sub3%></a></td>
                        <td><form action="details.jsp">
                                <input type="text" value='<%= sub3%>' name="sub" hidden>
                                <input type="submit" value="Analytics" class="btn btn-primary">
                            </form></td>
                            <%
                            } else {
                            %>
                            <%
                                }
                            %>
                    </tr>
                    <tr>

                        <%
                            String sub4 = o.getSpecializedSubject4();
                            int i = sub4.compareToIgnoreCase("None");
                            if (i != 0) {
                        %>
                                                <td>4.</td>
                        <td><a href="" class="btn btn-warning"><%= cname.get(sub4) + " " + sub4%></a></td>
                        <td><form action="details.jsp">
                                <input type="text" value='<%= sub4%>' name="sub" hidden>
                                <input type="submit" value="Analytics" class="btn btn-primary">
                            </form></td>
                            <%
                            } else {
                            %>

                        <%
                            }
                        %>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
                
        </div>
    <center><p class="ml-5 mt-5 " style="color:red; box-sizing: border-box; border: 1px solid black; border-radius: 10px;">Note: After Clicking on this buttons you will get your work progress report in the form of progress bar.
             </p></center>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>






