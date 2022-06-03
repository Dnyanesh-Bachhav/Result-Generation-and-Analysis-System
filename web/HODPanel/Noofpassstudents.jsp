<%-- 
    Document   : Noofpassstudents
    Created on : 30 Apr, 2021, 10:54:41 AM
    Author     : tppat
--%>

<%@page import="mainController.HodCon"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pass Students</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>  
        <%
            int year = Integer.parseInt(request.getParameter("year"));
            String branch = request.getParameter("branch");
            String term = request.getParameter("term");
            int i = 0;
            ArrayList<String> arraylist = new ArrayList();
            arraylist.add("ATRNC");
            arraylist.add("DTRNC");
            arraylist.add("PASS");
            ArrayList<Integer> al = HodCon.getRemarkCount(year, branch, term);
        %>
        <canvas id="myChart"  width="350" height="120"></canvas>
        <script>
            var array2 = [];
            var arrayYAxis = [];
            <%
                for (i = 0; i < arraylist.size(); i++) {
            %>
            array2.push("<%=arraylist.get(i)%>");
            arrayYAxis.push(<%=al.get(i)%>);
            <%
                }
            %>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'pie',
                data: {

                    labels: array2,
                    datasets: [{
                            label: 'Count of ATRNC, DTRNC and PASS Students',
                            data: arrayYAxis,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 99, 132, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 99, 132, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>
    </body>
</html>
