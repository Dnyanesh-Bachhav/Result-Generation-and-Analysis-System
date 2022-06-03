<%-- 
    Document   : Practice Page
    Created on : 3 Oct, 2020, 12:20:45 PM
    Author     : DELL
--%>

<%@page import="beans.Exam_reg"%>
<%@page import="beans.Courses"%>
<%@page import="beans.student"%>
<%@page import="mainController.invigilatorsCon"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>
        <%
            int year = 2;
            String branch = "IF";
            String term = "EVEN";
            int i = 0;
            
            List<Courses> getCoursesList = AdminCon.getCourses(year, branch, term);
            String[] array1 = new String[getCoursesList.size()];
            int[] arrayOfCourseRegisterStudent = new int[getCoursesList.size()];

            for(Courses li: getCoursesList)
            {
                array1[i] = li.getCourse_code();
                //out.print(array1[i]);
                List<Exam_reg> getExam_reg = invigilatorsCon.getExam_regByCourseId(array1[i]);
                //out.print(getExam_reg.size()+"  ");
                arrayOfCourseRegisterStudent[i] = getExam_reg.size();
                i++;
            }

        %>
        
        
        <canvas id="myChart"  width="400" height="150"></canvas>
        <script>
            var array2 = [];
            var arrayYAxis = [];
            <%
                for (i = 0; i < array1.length; i++) 
                {
            %>
            array2.push("<%=array1[i]%>");
            arrayYAxis.push(<%=arrayOfCourseRegisterStudent[i]%>);
            <%
                }
            %>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: array2,
                    datasets: [{
                            label: 'Exam Registration for different Subjects',
                            data: arrayYAxis,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
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
