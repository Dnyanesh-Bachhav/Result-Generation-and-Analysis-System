<%-- 
    Document   : document (PDF Page)
    Created on : 15 Nov, 2020, 10:26:27 AM
    Author     : DELL
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Map"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Exam_reg"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
        <script src="../js/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.12/jspdf.plugin.autotable.min.js" integrity="sha512-LbuBII6okEnUBAlReVukUVcO73H/Fna8DGcFsCI9mKvoRHVpAdbc2ahE9SEkMcjIplETjaUA4sAMPGiy08MEvg==" crossorigin="anonymous"></script>
        <script src="../js/imgData.js" type="text/javascript"></script>
        <script src="../js/imgData2.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha512-s/XK4vYVXTGeUSv4bRPOuxSDmDlTedEpMEcAQk0t/FMd9V6ft8iXdwSBxV0eD60c6w/tjotSlKu9J2AAW1ckTA==" crossorigin="anonymous"></script>
    </head>
    <body>
        <%!
            int year;
            String branch;
            String term;
            int rollno;
            int currentCredits = 0;
            int backlogCount = 0;
            int grandTotal = 0;
            int outOfMarks = 0;
            String result;
        %>
        
        <script>
            var doc = new jsPDF();
        </script>
      <div id="bottomLine"><span>Result Date:<br><span>12/12/2020</span></span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div id="bottomLine1"><span>(Prof. Girish Gajanan Wankhede)<br><span>CONTROLLER OF EXAMINATION</span></span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div id="bottomLine2"><span>(Prof. Dnyanadao Pundalik Nathe)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>PRINCIPAL</span></span></div>
        <%
            year = Integer.parseInt(request.getParameter("year"));
            branch = request.getParameter("branch");
            term = request.getParameter("term");
            Map<String, String> courseNameList = AdminCon.courseCodeList();
            Map<String, Integer> courseCreditList = AdminCon.courseCreditList();
            Map<String, Integer> courseMarksList = AdminCon.courseMarksList();
            List listOfStudents = AdminCon.getStudentsForSpecificTermYear(year, branch, term);
            Collections.sort(listOfStudents);
            //listOfStudents.sort(c);
            //out.print("Hello World...!!!");
            //out.print(listOfStudents.size());
            for (Object list : listOfStudents) {
            
        %>
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
        
        <script>
            var text = $("#title")[0];
            var title2 = $("#title2")[0];
            var specialElementHandlers = 
                {
                    "#bypassme":function(element,renderer)
                    {
                        return true;
                    }
                };
            doc.addImage(imgData2, 'jpg', 0, 0, 50, 45);
            doc.fromHTML(text,42,5,{
                "width":170,
                "elementHandlers":specialElementHandlers
            });
            doc.addImage(imgData, 'png', 160, 0, 50, 45);
            doc.fromHTML(title2,50,40,{
                    "width":170,
                    "elementHandlers":specialElementHandlers
                });
        </script>
        <%
            rollno = (Integer)list;
            List<Student_data> li = AdminCon.getStudentsByRollNo(rollno);
            for (Student_data data : li) {
        %>
        <div style="margin-left: 350px;" id="studentData">  
            
        </div>
        <script>
            document.getElementById("studentData").innerHTML = "<p style='font-size: 20px;'>Name &nbsp;&nbsp;&nbsp;: <b>"+"<%= data.getS_name()%>"+"</b></p><p style='font-size: 20px;'>Roll No &nbsp;:  <b>"+"<%= data.getRollno()%>"+"</b> &nbsp;  in &nbsp;<b>"+"<%=data.getTerm()%>"+"</b> &nbsp;Term Examination :&nbsp; <b>"+"<%= data.getTerm()%>"+"</b></p><p style='font-size: 20px;'>Programme &nbsp;: Diploma in <b>"+"<%= data.getProgramme()%>"+"</b></p>";
        </script>
        <%
            }
        %>
        <table id="table" border="1">
            <thead>
            <th class="border-left border-right">COURSE NAME AND CODE</th>
            <th class="border-left border-right">CR</th>
            <th class="border-left border-right text-center">MARKS</th>
            <th>TH<br>A</th>
            <th>PT<br>B</th>
            <th>TOT<br>A+B</th>
            <th>TW</th>
            <th>PR</th>
            <th>OR</th>
        </thead>
        <tbody style="border: 1px solid #1e1e1e" id="tbody">
        <script>
            $("#tbody").empty();
        </script>
            <%
                List<Object[]> list2 = AdminCon.getResult(rollno);
                for (Object[] o1 : list2) {
            %>
                
                <%
                    int val = (Integer) o1[9];
                    int isTheory = (Integer) o1[2];
                    int isPT = (Integer) o1[3];
                    grandTotal += val + (Integer) o1[10] + (Integer) o1[11] + (Integer) o1[12];
                    outOfMarks += courseMarksList.get(o1[1]);
                    if (val >= 40) 
                    {
                        currentCredits += courseCreditList.get(o1[1]);
                    } else if (isTheory == 0 && isPT == 0) 
                    {
                        currentCredits += courseCreditList.get(o1[1]);
                    } else 
                    {
                        if (isTheory == 1) 
                        {
                            backlogCount++;
                        }
                    }
                %>
                
        <script>
            $("#tbody").append("<tr><td><div id='courseName'>"+"<%= courseNameList.get(o1[1]) %>"+"</div><BR><div class='ml-4 id='courseCode'>"+"<%= o1[1]%>"+"</div></td><td>"+<%= courseCreditList.get(o1[1]) %>+"</td><td class='text-center'>MAX.<br> <div class='mt-2'>OBT.</div></td><td>"+<%= o1[7]%>+"<br> <div class='mt-2'>40</div></td><td>"+<%= o1[8]%> +"<br> <div class='mt-2'>40</div></td><td>"+<%= o1[9] %> +"<br> <div class='mt-2'>40</div></td><td>"+<%= o1[10]%> +"<br> <div class='mt-2'>40</div></td><td>"+<%= o1[11]%> +"<br> <div class='mt-2'>--</div></td><td>"+<%= o1[12]%> +"<br> <div class='mt-2'>--</div></td></tr>");
        </script>
            <%
                }
            %>
            <%
                if(list2.size() < 10)
                {
                for (int i = 0; i < 10 - list2.size(); i++) 
                {
            %>
            <script>
                $("#tbody").append("<tr><td><br><div class='ml-4 id='courseCode'></div></td><td></td><td class='text-center'><br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td><td> <br> <div class='mt-2'></div></td></tr>");
            </script>
            <%
                }
                }
            %>
        </tbody>
    </table>
        <%
            if (backlogCount > 0 && backlogCount < 10) {
                result = "ATRNC";
            } else if (backlogCount == 0) {
                result = "PASS";
            } else {
                result = "DTRNC";
            }
        %>
    <table id="bottomTable">
          <thead class="text-center">
              <th>PREVIOUS <br>CRDEDITS</th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <th>GAIN <br>CREDITS</th>
              <th>TOTAL <br>CREDITS</th>
              <th>REQ <br>CREDITS</th>
              <th>TOTAL BACKLOG<br> COURSES</th>
              <th>GRAND TOTAL: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OUT OF:</th>
          </thead>
          <tbody>
              <tr id="bottomTableRow">
                  
              </tr>
          </tbody>
          <script>
            document.getElementById("bottomTableRow").innerHTML = "<td>10</td><td>"+<%=currentCredits%>+"</td><td></td><td>10</td><td>"+<%=backlogCount%>+"</td><td>"+<%=grandTotal%>+"<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+<%= outOfMarks%>+"</div></td>";
          </script>
      </table>
      <br>

      <script>
        
          addData();
          async function addData(){
              //Student Data
          var studentData =  $("#studentData").html();
          console.log(studentData);
              await doc.fromHTML(studentData,18,52,{
                    "width":170,
                    "elementHandlers":specialElementHandlers
                });
          //For Tables
          await doc.autoTable({
                    html: "#table",
                    margin: {top: 90},
                    theme: "grid"
                });
               await doc.autoTable({
                    theme: "grid",
                    html: "#bottomTable"
                });
                
                
          await doc.fromHTML(bottomLine,10,267,{
                    "width":170,
                    "elementHandlers":specialElementHandlers
                });
               await doc.fromHTML(bottomLine1,50,267,{
                    "width":170,
                    "elementHandlers":specialElementHandlers
                });
                await doc.fromHTML(bottomLine2,140,267,{
                    "width":170,
                    "elementHandlers":specialElementHandlers
                });
                await doc.addPage();
          }
                
      </script>
      
    <%
        currentCredits = 0;
        backlogCount = 0;
        grandTotal = 0;
        outOfMarks = 0;
        result = "";
        }
    %>
    <script>
        doc.save();
    </script>
    </body>
</html>
