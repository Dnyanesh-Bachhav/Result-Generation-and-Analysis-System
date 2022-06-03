<%-- 
    Document   : Practice Page
    Created on : 21 Oct, 2020, 4:44:06 PM
    Author     : DELL
--%>

<%@page import="beans.StudentCourses"%>
<%@page import="java.util.Map"%>
<%@page import="beans.Exam_reg"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Student_data"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Try 2</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <br>
        <%@include file="searchResult.jsp" %>
        <%!
            int year;
            String branch;
            String term;
            int currentCredits = 0;
            int backlogCount = 0;
            int grandTotal = 0;
            int outOfMarks = 0;
            String result;
        %>


        <div>
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

                    int rollno = 185104;
                    List<Student_data> li = AdminCon.getStudentsByRollNo(rollno);
                    for (Student_data data : li) {
                        year = data.getYear();
                        branch = data.getProgramme();
                        term = data.getTerm();

                %>
                <TR>
                    <TD bgcolor=#00ffff align=left >Seat No:       <%=data.getRollno()%>                     </TD>
                    <TD bgcolor=#00ffff align=left > Name :     <%=data.getS_name()%>            </TD>
                </TR>
            </Table>
            <Table cellpadding=4 cellspacing=0 align=center width='60%'>
                <TR bgcolor = Yellow>
                    <TD bgcolor = #00ffff align=left> Diploma Programme in <%=data.getProgramme()%></TD>
                </TR>
            </Table>
            <%
                }
            %>
            <center>
                <TABLE  cellpadding=5 cellspacing=0 align=center width='60%' class="table">
                    <tbody>
                        <TR>
                            <TH align=left><font size=2 color=#880000>Course code</TH>
                            <TH align=left><font size=2 color=#880000>Course Name</TH>
                            <TH align=center><font size=2 color=#880000>TH</TH>
                            <TH align=center><font size=2 color=#880000>PT</TH>
                            <TH align=center><font size=2 color=#880000>TOTAL</TH>
                            <TH align=center><font size=2 color=#880000>TW</TH>
                            <TH align=center><font size=2 color=#880000>PR</TH>
                            <TH align=center><font size=2 color=#880000>OR</TH>
                        </TR>
                        <%
                            Map<String, String> courseNameList = AdminCon.courseCodeList();
                            Map<String, Integer> courseCreditList = AdminCon.courseCreditList();
                            Map<String, Integer> courseMarksList = AdminCon.courseMarksList();
                            List<Object[]> list = AdminCon.getResult(rollno);
                            for (Object[] o1 : list) {
                        %>
                        <TR>
                            <td align="left"><font size="2" color=#0000ff><%= o1[1]%></td>

                            <td align="left"><font size="2" color=#0000ff><%= courseNameList.get(o1[1])%></td>
                            
                            <td align="center"><font size="2" color=#0000ff><%= o1[7]%></td>
                            <td align="center"><font size="2" color=#0000ff><%= o1[8]%></td>
                            <td align="center"><font size="2" color=#0000ff><%= o1[9]%></td>
                                <%
                                    int val = (Integer) o1[9];
                                    int isTheory = (Integer) o1[2];
                                    int isPT = (Integer) o1[3];
                                    grandTotal += val + (Integer) o1[10] + (Integer) o1[11] + (Integer) o1[12];
                                    outOfMarks += courseMarksList.get(o1[1]);
                                    if (val >= 40) {
                                        currentCredits += courseCreditList.get(o1[1]);

                                    }
                                    else if(isTheory == 0 && isPT == 0)
                                    {
                                        currentCredits += courseCreditList.get(o1[1]);
                                    }
                                    else 
                                    {
                                        if (isTheory == 1) 
                                        {
                                            backlogCount++;
                                        }
                                    }
                                %>

                            <td align="center"><font size="2" color=#0000ff><%= o1[10]%></td>

                            <td align="center"><font size="2" color=#0000ff><%= o1[11]%></td>
                            <td align="center"><font size="2" color=#0000ff><%= o1[12]%></td>




                        </TR>
                        <%
                            }
                        %>
                    </tbody>
                </TABLE>
            </center>
                    <%
                        if(backlogCount > 0 && backlogCount <10)
                        {
                            result = "ATRNC";
                        }
                        else if(backlogCount == 0)
                        {
                            result = "PASS";
                        }
                        else
                        {
                            result = "DTRNC";
                        }
                    %>
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
                    <TD align=center><font size=1 color=#0000ff><%=currentCredits%></TD>
                    <TD align=center><font size=1 color=#0000ff>101</TD>
                    <TD align=center><font size=1 color=#0000ff>134</TD>
                    <TD align=center><font size=1 color=#0000ff>66</TD>
                    <TD align=center><font size=1 color=#0000ff><%=backlogCount%></TD>
                    <TD align=center><font size=1 color=#0000ff><%=grandTotal%></TD>
                    <TD align=center><font size=1 color=#0000ff><%=outOfMarks%></TD>
                    <TD align=center><font size=1 color=#0000ff><%=result%></TD>
                </TR>
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
                    
                    <script>
                        $(document).ready(function(){
                            
                        })
                    </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
                </body>
                </html>
