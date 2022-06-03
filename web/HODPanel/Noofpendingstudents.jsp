<%-- 
    Document   : Noofpendingstudents
    Created on : 29 Apr, 2021, 1:43:10 PM
    Author     : tppat
--%>

<%@page import="mainController.HodCon"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Students</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>
        <%
            int year = Integer.parseInt(request.getParameter("year"));
            String branch = request.getParameter("branch");
            String term = request.getParameter("term");
            int i = 0;
            ArrayList<Integer> arraylist = new ArrayList();
            arraylist.add(1);
            arraylist.add(2);
            arraylist.add(3);
            arraylist.add(4);
            arraylist.add(5);
            arraylist.add(6);
            arraylist.add(7);
            arraylist.add(8);
            arraylist.add(9);
            arraylist.add(10);
            ArrayList<Integer> al = HodCon.getPendingStudentsCount(year, branch, term);

        %>
        <canvas id="myChart"  width="350" height="120"></canvas>
        <script>
            var array2 = [];
            var arrayYAxis = [];
            <%                for (i = 0; i < arraylist.size(); i++) {
            %>
            array2.push("<%=arraylist.get(i)%>");
            arrayYAxis.push(<%=al.get(i)%>);
            <%
                }
            %>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    
                    labels: array2,
                    datasets: [{
                            label: 'Pending Students Count Coursewise',
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
