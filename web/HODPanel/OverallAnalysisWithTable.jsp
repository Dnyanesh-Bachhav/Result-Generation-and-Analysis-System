<%-- 
    Document   : OverallAnalysisWithTable
    Created on : 8 May, 2021, 10:11:17 AM
    Author     : tppat
--%>

<%@page import="java.util.Map"%>
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
        <title>Overall Analysis</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        <style>
            *{
                padding: 10px 10px 10px 10px;
            }
        </style>
    </head>
    <body>
        <%!
            int len;
        %>
        <%
            int year = Integer.parseInt(request.getParameter("year"));
            String branch = request.getParameter("branch");
            String term = request.getParameter("term");
            int i = 0;
            List<Courses> getCoursesList = AdminCon.getCourses(year, branch, term);
            String[] array1 = new String[getCoursesList.size()];
            //int[] arrayOfCourseRegisterStudent = new int[getCoursesList.size()];

            for (Courses li : getCoursesList) {
                array1[i] = li.getCourse_code();
                //List<Exam_reg> getExam_reg = invigilatorsCon.getExam_regByCourseId(array1[i]);
                //out.print(getExam_reg.size()+"  ");
                //arrayOfCourseRegisterStudent[i] = getExam_reg.size();
                i++;
            }
             len = array1.length;

            ArrayList<Integer> arrayOfCourseRegisterStudent = HodCon.getExam_regNumberByCourseId(array1);
            ArrayList<Integer> arrayOfPendingStudents = HodCon.getPendingStudentsByCourseCode(array1);
            ArrayList<Integer> arrayOfPassStudents = HodCon.getPassStudentsByCourseCode(array1);
            Map<String, String> courseNameList = AdminCon.courseCodeList();
//            out.println(arrayOfCourseRegisterStudent);
%>
    <center><h1>Overall  Analysis</h1></center>
<br>
<br>
        <table class="table table-striped table-dark">
            <thead>
                <tr>
                    <th scope="col">Sr No</th>
                    <th scope="col">Course Name</th>
                    <th scope="col">Course Code</th>
                    <th scope="col">Registered Students</th>
                    <th scope="col">Pending Students</th>
                    <th scope="col">Pass Students</th>
                </tr>
            </thead>
               <%        
                 int j = 1;
                for (i = 0; i < len; i++) {
            %>

                <tr>
                 
                    <td><%= j++%></td>
                    <td><%=courseNameList.get(array1[i])%></td>
                    <td><%=array1[i]%></td>
                    <td><%=arrayOfCourseRegisterStudent.get(i) %></td>
                    <td><%=arrayOfPendingStudents.get(i) %></td>
                    <td><%=arrayOfPassStudents.get(i) %></td>
                </tr>
        <%
            }
        %>
        </table>

    </body>
</html>
