<%-- 
    Document   : ErrorResultInput
    Created on : 6 Sep, 2020, 3:41:01 PM
    Author     : tppat
--%>


<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
           
            <div>
                <%@include file="../HODPanel/ViewResult.jsp"%><br><br>
                
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
