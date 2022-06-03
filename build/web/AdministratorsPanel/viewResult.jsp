<%-- 
    Document   : view Result 
    Created on : 21 Oct, 2020, 4:44:06 PM
    Author     : DELL
--%>

<%@page import="beans.Result2"%>
<%@page import="beans.Result1"%>
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
        <title>View Result</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
        <script src="../js/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.12/jspdf.plugin.autotable.min.js" integrity="sha512-LbuBII6okEnUBAlReVukUVcO73H/Fna8DGcFsCI9mKvoRHVpAdbc2ahE9SEkMcjIplETjaUA4sAMPGiy08MEvg==" crossorigin="anonymous"></script>
        <script src="../js/imgData.js" type="text/javascript"></script>
        <script src="../js/imgData2.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha512-s/XK4vYVXTGeUSv4bRPOuxSDmDlTedEpMEcAQk0t/FMd9V6ft8iXdwSBxV0eD60c6w/tjotSlKu9J2AAW1ckTA==" crossorigin="anonymous"></script>
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
            int[][] arrayOfIsPresent;
            int val;
            List<Object[]> list;
        %>

        <script>
            var doc = new jsPDF();
        </script>
        <div hidden>
            <div id="bottomLine"><span>Result Date:<br><span>12/12/2020</span></span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div id="bottomLine1"><span>(Prof. Girish Gajanan Wankhede)<br><span>CONTROLLER OF EXAMINATION</span></span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div id="bottomLine2"><span>(Prof. Dnyanadao Pundalik Nathe)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>PRINCIPAL</span></span></div>
        </div>

        <div hidden>
            <div id="title">
                <center>
                    <div></div><br>
                    <h1 style="font-size:30px;margin-left: 22px;">Government Polytechnic, Nashik</h1>
                    <blockquote style="margin-left: 50px;">An autonomous institute of government of Maharashtra.</blockquote>
                </center>
            </div>
            <div id="title2">
                <h1 style="font-size: 30px;background-color: red;margin-left: 100px;">Statement of Marks</h1>
            </div>
        </div>

        <script>
            var text = $("#title")[0];
            var title2 = $("#title2")[0];
            var specialElementHandlers =
                    {
                        "#bypassme": function (element, renderer)
                        {
                            return true;
                        }
                    };
            doc.addImage(imgData2, 'png', 0, 0, 50, 45);
            doc.fromHTML(text, 42, 5, {
                "width": 170,
                "elementHandlers": specialElementHandlers
            });
            doc.addImage(imgData, 'png', 160, 0, 50, 45);
            doc.fromHTML(title2, 50, 40, {
                "width": 170,
                "elementHandlers": specialElementHandlers
            });
        </script>
        <div>
            <Table cellpadding=3 cellspacing=0 align=center width='60%'>
                <TR>
                    <TD   align=center>
                        <font size=4 color=Blue>
                        <b>
                            <%
                                String currentExaminationYear = AdminCon.getCurrentExaminationYear();
                            %>
                            Result of <%= currentExaminationYear%> Examination
                        </b> 
                        </font>
                    </TD>
                </TR>
            </Table>
            <!--For PDF-->
            <div id="studentData" hidden></div>
            <Table  bgcolor = Green cellpadding=4 cellspacing=0 align=center width='60%'>
                <%

                    int rollno = Integer.parseInt(request.getParameter("rollnumber"));
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

            <!--For PDF-->
            <script>
                    document.getElementById("studentData").innerHTML = "<p style='font-size: 20px;'>Name &nbsp;&nbsp;&nbsp;: <b>" + "<%= data.getS_name()%>" + "</b></p><p style='font-size: 20px;'>Roll No &nbsp;:  <b>" + "<%= data.getRollno()%>" + "</b> &nbsp;  in &nbsp;<b>" + "<%=data.getTerm()%>" + "</b> &nbsp;Term Examination :&nbsp; <b>" + "<%= currentExaminationYear%>" + "</b></p><p style='font-size: 20px;'>Programme &nbsp;: Diploma in <b>" + "<%= data.getProgramme()%>" + "</b></p>";
            </script>
            <%
                }
            %>
            <center>
                <TABLE  cellpadding=5 cellspacing=0 align=center width='60%' class="table" id="table1">
                    <thead>
                    <TH align=left><font size=2 color=#880000>Course code</TH>
                    <TH align=left><font size=2 color=#880000>Course Name</TH>
                    <TH align=center><font size=2 color=#880000>TH</TH>
                    <TH align=center><font size=2 color=#880000>PT</TH>
                    <TH align=center><font size=2 color=#880000>TOTAL</TH>
                    <TH align=center><font size=2 color=#880000>TW</TH>
                    <TH align=center><font size=2 color=#880000>PR</TH>
                    <TH align=center><font size=2 color=#880000>OR</TH>
                    </thead>
                    <tbody id="tbody">

                        <%
                            Map<String, String> courseNameList = AdminCon.courseCodeList();
                            Map<String, Integer> courseCreditList = AdminCon.courseCreditList();
                            Map<String, Integer> courseMarksList = AdminCon.courseMarksList();
                            List<Object[]> list = AdminCon.getResult(rollno);
                            arrayOfIsPresent = new int[list.size()][5];
                            int arrayOfIsPresentCount = 0;
                            for (Object[] o1 : list) {
                        %>
                        <TR>
                            <td align="left"><font size="2" color=#0000ff><%= o1[1]%></td>

                            <td align="left"><font size="2" color=#0000ff><%= courseNameList.get(o1[1])%></td>

                            <td align="center"><font size="2" color=#0000ff><%= o1[7]%></td>
                            <td align="center"><font size="2" color=#0000ff><%= o1[8]%></td>
                            <td align="center" style="color:#0000ff; font-size: 14px;" id="val" ><%= o1[9]%></td>
                            <%
                                int val = (Integer) o1[9];
                                int isTheory = (Integer) o1[2];
                                int isPT = (Integer) o1[3];
                                arrayOfIsPresent[arrayOfIsPresentCount][0] = isTheory;
                                arrayOfIsPresent[arrayOfIsPresentCount][1] = isPT;
                                arrayOfIsPresent[arrayOfIsPresentCount][2] = (Integer) o1[4];
                                arrayOfIsPresent[arrayOfIsPresentCount][3] = (Integer) o1[5];
                                arrayOfIsPresent[arrayOfIsPresentCount][4] = (Integer) o1[6];

                                arrayOfIsPresentCount++;
                                grandTotal += val + (Integer) o1[10] + (Integer) o1[11] + (Integer) o1[12];
                                outOfMarks += courseMarksList.get(o1[1]);
                                if (val >= 40) {
                                    currentCredits += courseCreditList.get(o1[1]);

                                } else if (isTheory == 0 && isPT == 0) {
                                    currentCredits += courseCreditList.get(o1[1]);
                                } else {
                                    if (isTheory == 1) {
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
                    <div hidden>
                        <%
                            if (list.size() < 10) {
                                for (int i = 0; i < 10 - list.size(); i++) {
                        %>
                        <script>
                            $("#tbody").append("<tr><td><br><div class='ml-4 id='courseCode'></div></td><td></td><td class='text-center'><br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td></tr>");
                        </script>

                        <%
                                }
                            }
                        %>
                    </div>
                    </tbody>
                </TABLE>
            </center>
            <%
                if (backlogCount > 0 && backlogCount < 10) {
                    result = "ATRNC";
                } else if (backlogCount == 0) {
                    result = "PASS";
                } else {
                    result = "DTRNC";
                }
            %>
            <TABLE cellpadding=4 cellspacing=0 align=center border=2 width='60%' id='table2'>
                <thead>
                <TD><font size=2 color=#880000>Current Credits</TD>
                <TD><font size=2 color=#880000>Previous Credits</TD>
                <TD><font size=2 color=#880000>Total Credits</TD>
                <TD><font size=2 color=#880000>Requisite Credits</TD>
                <TD><font size=2 color=#880000>Total Backlog</TD>
                <TD><font size=2 color=#880000>Grand Total</TD>
                <TD><font size=2 color=#880000>Out Of</TD><font size=2 color=#880000>
                <TD><font size=2 color=#880000>Result</TD>
                </thead>
                <tbody>
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
                    </tbody>
                </TABLE>
                <TABLE cellpadding=4 cellspacing=0 align=center width='60%'>
                    <TR>
                        <TD><font size=2 color=#880000> Instruction for Result published on net of website http://www.gpnashik.ac.in, Government polytechnic is not responsible for any inadvertent error that may have crept in the result being published on net The Result published on net are for immediate information only. This cannot be treated as original statement of marks, Contact Examination Cell of Government Polytechnic, Nashik for any queries related to result.
                        </TD>
                    </TR>
                </TABLE>

                <%
                    currentCredits = 0;
                    backlogCount = 0;
                    grandTotal = 0;
                    outOfMarks = 0;
                    result = "";
                %>
        </div>

        <script>

            addData();
            async function addData() {
                //Student Data
                var studentData = $("#studentData").html();
                console.log(studentData);
                await doc.fromHTML(studentData, 18, 52, {
                    "width": 170,
                    "elementHandlers": specialElementHandlers
                });
                //For Tables
                await doc.autoTable({
                    html: "#table1",
                    margin: {top: 90},
                    theme: "grid"
                });
                await doc.autoTable({
                    theme: "grid",
                    html: "#table2"
                });


                await doc.fromHTML(bottomLine, 10, 267, {
                    "width": 170,
                    "elementHandlers": specialElementHandlers
                });
                await doc.fromHTML(bottomLine1, 50, 267, {
                    "width": 170,
                    "elementHandlers": specialElementHandlers
                });
                await doc.fromHTML(bottomLine2, 140, 267, {
                    "width": 170,
                    "elementHandlers": specialElementHandlers
                });
            }
            // Code for convert java array to javascript array;
            var arrOfIsPresent1 = [];
            <%
        for (int[] li1 : arrayOfIsPresent) {
            %>

                    arrOfIsPresent1.push([<%=li1[0]%>,<%=li1[1]%>,<%=li1[2]%>,<%=li1[3]%>,<%=li1[4]%>]);
            <%
        }
            %>

            //            console.log(arrOfIsPresent1);
            var arr = document.querySelectorAll("#val");
//            arr.forEach((item) => {
//                if (item.innerText < 40 && item.innerText >= 0)
//                {
//                    $(item).prepend("*");
//                    $(item).css("color", "red");
//                }
//            });

//             Code to append * and color red if there is theory for perticular course
            for (let item = 0; item < arr.length; item++)
            {
                if (arrOfIsPresent1[item][0] == 1) {
                    if (parseInt($(arr[item]).text()) < 40 && parseInt($(arr[item]).text()) >= 0)
                    {
                        console.log($(arr[item]).text());
                        $(arr[item]).prepend("*");
                        $(arr[item]).css("color", "red");
                    }
                }

            }

        </script>
        <input type="button" onclick="doc.save('result')" id="a"   Value="Print">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
