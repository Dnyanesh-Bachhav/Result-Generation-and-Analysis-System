<%-- 
    Document   : details
    Created on : 22 Nov, 2020, 10:36:56 AM
    Author     : DELL
--%>


<%@page import="mainController.invigilatorsCon"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Progressbar</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            *{
                text-decoration: none;
                font-family: Arial, Helvetica, sans-serif;

            }
        </style>
    </head>

    <body>

        <%!
            String courseId;
        %>
        <%
            courseId = request.getParameter("sub");
            Map<String, String> cname = invigilatorsCon.courseNameByCoursCode();
                      
            //out.print(sub);
            //int code = (Integer) session.getAttribute("code");
            //out.println(course_name);
            //List<Courses> li = invigilatorsCon.getCourseCodeByCourseName(sub, code);
//            for (Courses name : li) {
//                courseId = name.getCourse_code();
//            }
            //out.print(courseId);
            Integer countOfPTTotal = invigilatorsCon.getCountOfPTTotal(courseId);
            
            //out.print("Total students\n:"+countOfPTTotal);

            //Periodic Test
            Integer countOfPTTotalMarksFilled = invigilatorsCon.getCountOfPTTotalMarksFilled(courseId);
            float val = (float) countOfPTTotalMarksFilled / countOfPTTotal;
//            out.print(countOfPTTotalMarksFilled+"    "+countOfPTTotal);
            int val2 = Math.round(Math.round(val) * 100);
//            out.print(val);

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
        %>

        <br><br>
        <h2 class="mb-2 ml-5 p-2 bg-light mr-5 shadow-lg text-center"><%= cname.get(courseId)%></h2>
        <div class="bg-light ml-5 mr-5 p-4 mt-5 border border-primary" style="border-radius: 20px;">
            <label>Periodic-Test</label>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-dark" role="progressbar" style="width: <%=pt2%>%;" aria-valuenow="<%=pt2%>" aria-valuemin="0" aria-valuemax="100"><%=pt2%>%</div>
            </div><br>
            <label>Theory</label>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: <%=th2%>%;" aria-valuenow="<%=th2%>" aria-valuemin="0" aria-valuemax="100"><%=th2%>%</div>
            </div><br>
            <label>Practical</label>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: <%=pr2%>%;" aria-valuenow="<%=pr2%>" aria-valuemin="0" aria-valuemax="100"><%=pr2%>%</div>
            </div><br>
            <label>Oral</label>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: <%=or2%>%;" aria-valuenow="<%=or2%>" aria-valuemin="0" aria-valuemax="100"><%=or2%>%</div>
            </div><br>
            <label>Termwork</label>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" style="width: <%=tw2%>%;" aria-valuenow="<%=tw2%>" aria-valuemin="0" aria-valuemax="100"><%=tw2%>%</div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    </body>
</html>

