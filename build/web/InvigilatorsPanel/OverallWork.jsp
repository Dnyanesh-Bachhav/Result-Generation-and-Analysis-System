<%-- 
    Document   : OverallWork
    Created on : 1 Jun, 2021, 3:04:51 PM
    Author     : tppat
--%>

<%@page import="mainController.invigilatorsCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Work</title>
                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>
            <%!
            String courseId;
        %>
        <%
            courseId = request.getParameter("sub");
            //out.print(sub);
            //int code = (Integer) session.getAttribute("code");
            //out.println(course_name);
            //List<Courses> li = invigilatorsCon.getCourseCodeByCourseName(sub, code);
//            for (Courses name : li) {
//                courseId = name.getCourse_code();
//            }
            //out.print(courseId);
            //out.print("Total students\n:"+countOfPTTotal);

            //Periodic Test

           int[] pt = invigilatorsCon.getCountOfPT(courseId);
            float pt1 = (float) pt[1] / pt[0];
            int pt2 = Math.round(pt1 * 100);

            
            //Theory
           
            int[] th = invigilatorsCon.getCountOfTH(courseId);
            float th1 = (float) th[1] / th[0];
            int th2 = Math.round(th1 * 100);

            //Practical
            int[] pr = invigilatorsCon.getCountOfPractical(courseId);
            float pr1 = (float) pr[1] / pr[0];
            int pr2 = Math.round(pr1 * 100);

            //Oral
            int[] or = invigilatorsCon.getCountOfOral(courseId);
            float or1 = (float) or[1] / or[0];
            int or2 = Math.round(or1 * 100);

            //Termwork
            int[] tw = invigilatorsCon.getCountOfTermwork(courseId);
            float tw1 = (float) tw[1] / tw[0];
            int tw2 = Math.round(tw1 * 100);
            
            double total = (pt2+th2+pr2+or2+tw2)/5;
            int total1 = (int) Math.round(total);
            out.print(total1);
        %>

           

        <canvas id="myChart"  width="350" height="120"></canvas>
        <script>
            var array2 = [10,20,30,40,50,60,70,80,90,100];
            var arrayYAxis = [];
            
            arrayYAxis.push(<%=total1%>);
            
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    
                    labels: arrayYAxis,
                    datasets: [{
                            label: 'Pending Students Count Coursewise',
                            data: array2,
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
