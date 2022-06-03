<%-- 
    Document   : OverallResultofPassStudents
    Created on : 1 May, 2021, 12:03:35 PM
    Author     : tppat
--%>

<%@page import="mainController.HodCon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Courses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OverAll Result</title>
               <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>
        <%
            int year = Integer.parseInt(request.getParameter("year"));
            String branch = request.getParameter("branch");
            String term = request.getParameter("term");
            int i = 0;
            
            List<Courses> getCoursesList = AdminCon.getCourses(year, branch, term);
            String[] array1 = new String[getCoursesList.size()];
            //int[] arrayOfCourseRegisterStudent = new int[getCoursesList.size()];

            for(Courses li: getCoursesList)
            {
                array1[i] = li.getCourse_code();
                //List<Exam_reg> getExam_reg = invigilatorsCon.getExam_regByCourseId(array1[i]);
                //out.print(getExam_reg.size()+"  ");
                //arrayOfCourseRegisterStudent[i] = getExam_reg.size();
                i++;
            }
            ArrayList<Integer> arrayOfCourseRegisterStudent = HodCon.getPassStudentsByCourseCode(array1);
        %>
        
        <canvas id="myChart"  width="350" height="120"></canvas>
        <script>
            var array2 = [];
            var arrayYAxis = [];
            <%
                for (i = 0; i < array1.length; i++) 
                {
            %>
            array2.push("<%=array1[i]%>");
            arrayYAxis.push(<%=arrayOfCourseRegisterStudent.get(i)%>);
            <%
                }
            %>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: array2,
                    datasets: [{
                            label: 'No. of Pass Students for Perticular Subject',
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
