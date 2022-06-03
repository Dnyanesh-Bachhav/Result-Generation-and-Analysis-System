<%-- 
    Document   : result.jsp
    Created on : 7 Aug, 2020, 10:41:24 PM
    Author     : tppat
--%>

<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.CourseList"%>
<%@page import="beans.Exam_reg"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Courses"%>
<%@page import="beans.Student_data"%>
<%@page import="java.util.List"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
                <%!
            public static int year;
            public static String branch;
            public static String term;
            public static String course_code;
            public static int current_credit=0;
            public static int total_marks=0;
        %>
           
            <div>
                <%@include file="../HODPanel/ViewResult.jsp"%><br><br>
	<Table cellpadding=3 cellspacing=0 align=center width='60%'>
	  		<TR>
	  	 	<TD   align=center>
	  	 	<font size=4 color=Blue>
		 	<b> 
		 	Result of SUMMER-2020 Examination
		 	</b> 
	  	 	</font>
	  	 	</TD>
	  	 	</TR>
		 	</Table>
                <Table  bgcolor = Green cellpadding=4 cellspacing=0 align=center width='60%'>
                    <%
           
            String rollno=request.getParameter("rollnumber");
            List<Student_data> li = HodCon.studentSearch(rollno);
            for(Student_data data:li)
            {
                year = data.getYear();
                branch = data.getProgramme();
                term = data.getTerm();
            
           %>
           
                    <TR>
                        <TD bgcolor=#00ffff align=left >Seat No:       <%=data.getRollno() %>                     </TD>
                        <TD bgcolor=#00ffff align=left > Name :     <%=data.getS_name() %>            </TD>
                    </TR>
                </Table>
                <Table cellpadding=4 cellspacing=0 align=center width='60%'>
                    <TR bgcolor = Yellow>
                        <TD bgcolor = #00ffff align=left> Diploma Programme in <%=data.getProgramme() %></TD>
                    </TR>
                </Table>



             <% 
                  }
              %>

              <TABLE  cellpadding=6 cellspacing=0 align=center width='60%'>
                  <TR>
                      <TH align=left><font size=2 color=#880000>Course code</TH>
                      <TH align=left><font size=2 color=#880000>Course Name</TH>
                      <TH align=left><font size=2 color=#880000>TH</TH>
                      <TH align=left><font size=2 color=#880000>PT</TH>
                      <TH align=left><font size=2 color=#880000>TOTAL</TH>
                      <TH align=left><font size=2 color=#880000>TW</TH>
                      <TH align=left><font size=2 color=#880000>PR</TH>
                      <TH align=left><font size=2 color=#880000>OR</TH>
                      
                  </TR>
               <%
                List<Exam_reg> list2 = HodCon.getExam_RegCoursesByRN(rollno);
                for (Exam_reg getCourse : list2) {
            %>
                  <TR>
                      <%
                          course_code = getCourse.getCourse_code();
                      %>
                                <% 
                   List<Courses> total = CourseList.getCourse(course_code);
                   for(Courses totalcredits : total)
                   {
                       current_credit = current_credit+totalcredits.getCou_credit();
                       total_marks = total_marks+totalcredits.getTotal_Marks();
                   }
                %>      
                      <td><%= course_code%></td>
                      <%
                          List courseName = HodCon.getCourseByCourseId(course_code);
                          //System.out.println(courseName);
                          for(Object name: courseName)
                          {
                      %>
                      <td><%=name%></td>
                      <%
                         if(getCourse.getEx_th()==0)
                         {
                         %>
                       <td>-</td>
                       <%
                       }
                        else{   
                       %>
                       <td><%=getCourse.getEx_th()%></td>
                       <%
                       }%>
                      <%
                      if(getCourse.getEx_pt()==0)
                      {
                      %>
                      <td>-</td>
                      <%
                      }else{
                      %>
                      <td><%=getCourse.getEx_pt()%></td>
                      <%}%>
                      <%
                         if(getCourse.getEx_th()==0)
                         {
                          %>
                          <td>-</td>
                          <%
                         }
                         else{
                              %>
                      <td><%=getCourse.getEx_th()+getCourse.getEx_pt() %></td> 
                      <%
                       }
                       %>
                      <td><%=getCourse.getEx_tw() %></td>                      
                      <td><%=getCourse.getEx_pr() %></td>
                      <td><%=getCourse.getEx_or() %></td>                 
                    
                      <%
                          }
                      %>
                  </TR>
                  <%
                }
            %>
              </TABLE>

           
              <TABLE cellpadding=4 cellspacing=0 align=center border=2 width='60%'>
                <TR>
                    <TD><font size=2 color=#880000>Current Credits</TD>
                    <TD><font size=2 color=#880000>Previous Credits</TD>
                    <TD><font size=2 color=#880000>Total Credits</TD>
                    <TD><font size=2 color=#880000>Requisite Credits</TD>
                    <TD><font size=2 color=#880000>Total Backlog</TD>
                    <TD><font size=2 color=#880000>Grand Total</TD>
                    <TD><font size=2 color=#880000>Out Of</TD><font size=2 color=#880000>
                    <TD><font size=2 color=#880000>Result</TD>
                </TR>

                <TR>
                    <TD align=center><font size=1 color=#0000ff><%=current_credit%></TD>
                    <TD align=center><font size=1 color=#0000ff>101</TD>
                    <TD align=center><font size=1 color=#0000ff>134</TD>
                    <TD align=center><font size=1 color=#0000ff>66</TD>
                    <TD align=center><font size=1 color=#0000ff>0</TD>
                <TD align=center><font size=1 color=#0000ff>755</TD>
                <TD align=center><font size=1 color=#0000ff><%=total_marks %></TD>
                <TD align=center><font size=1 color=#0000ff>PASS</TD>
                </TR>
              </TABLE>

                <TABLE cellpadding=4 cellspacing=0 align=center width='60%'>
                    <TR><TD><font size=1 color=#880000>TH = Theory</TD>
                        <TD><font size=1 color=#880000>MAX = Maximum</TD>
                        <TD ><font size=1 color=#880000>DTRNC = Disallowed to Register for new coures</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>PT = Periodic Test</TD>
                        <TD><font size=1 color=#880000>MIN = Minimum</TD>
                        <TD><font size=1 color=#880000>ATRNC = Allowed to Register for new coures</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>TW = Term Work</TD>
                        <TD><font size=1 color=#880000>OBT = Obtained</TD>
                        <TD><font size=1 color=#880000># = Backlog Courses</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>PR = Practical</TD>
                        <TD ><font size=1 color=#880000>EX = Exemption</TD>
                        <TD><font size=1 color=#880000>* = Fail</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>OR = Oral</TD>
                        <TD><font size=1 color=#880000>PC = Pending Courses</TD>
                        <TD><font size=1 color=#880000>@ = Pass With Grace Marks</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>CR = Credits</TD>
                        <TD><font size=1 color=#880000>COND = Condonation</TD>
                        <TD><font size=1 color=#880000>Reg.Credits = Further Requisite Credits</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>$ = Marks Condoned</TD>
                        <TD><font size=1 color=#880000>BL = Backlog Course Pending</TD>
                        <TD><font size=1 color=#880000>CC = Non Exam Credit Course completed</TD>
                    </TR>
                    <TR>
                        <TD><font size=1 color=#880000>~ = Shifted to Curriculum 2016</TD>
                        <TD><font size=1 color=#880000>-</TD>
                        <TD><font size=1 color=#880000>& = Grace Marks for Dyslexia</TD>
                    </TR>
                </TABLE>
                <TABLE cellpadding=4 cellspacing=0 align=center width='60%'>
                    <TR>
                        <TD><font size=2 color=#880000> Instruction for Result published on net of website http://www.gpnashik.ac.in, Government polytechnic is not responsible for any inadvertent error that may have crept in the result being published on net The Result published on net are for immediate information only. This cannot be treated as original statement of marks, Contact Examination Cell of Government Polytechnic, Nashik for any queries related to result.
                        </TD>
                    </TR>
                </TABLE>
                 <input type="button" onclick="printArea('printThis');" id="a"   Value="Print">
              
</div>
    </body>
</html>
