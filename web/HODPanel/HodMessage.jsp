<%-- 
    Document   : Message Page
    Created on : 16 Oct, 2020, 1:35:19 PM
    Author     : tppat
--%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.Map"%>
<%@page import="mainController.HodCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Hod_data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="../js/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <%!
            String Fname;
            String lastName;
            String Program;
            int dept_code;
            String from,to,message,date;
        %>

        
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" >
        <h3 class="modal-title" id="exampleModalLabel">Message</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
                        Message Sending...<br>
                        Click on <b>ok</b> to continue...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button type="button" id="send_btn" data-dismiss="modal" class="btn btn-success">Ok</button>
      </div>
    </div>
  </div>
</div>
        
        
        <%
            String username = ((String) session.getAttribute("hod_uname"));
            try {
                if (!username.equals(null)) {
                    List<Hod_data> details = HodCon.getHodData(username);
                    for (Hod_data Details : details) {
                        Fname = Details.getFname();
                        lastName = Details.getLname();
                        Program = Details.getProgramme();
                    }

        %>
        <%            Map<String, Integer> program = HodCon.getAllbranchcode(Program);
            dept_code = (program.get(Program));

        %>

    <center><h2>Send Message to Particular Invigilator</h2></center>
    <center><h4 style="color: grey; margin-left: 80px">Basic info,Such as your name that you use on your account.</h4></center>
    <div class="container border border-dark rounded-lg">
        <h2>Message Panel</h2>
        <form class="form-horizontal"  >
            <!--action="../Controller/message.jsp" method="post"-->
            <!--            <div class="form-group">
                            <label class="control-label col-sm-2" for="name">Id:</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control border-0"  id="id" placeholder="Enter Message Id" name="id">
                            </div>
                        </div>-->
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name:</label>
                <div class="col-sm-10">
                    <label style="margin-top: 8px" name="from" id="from" value="<%=Fname%>"><%=Fname%> <%=lastName%></label>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="name"  style="margin-bottom:5px; ">Invigilator Id:</label>
                <div class="col-sm-10">

                    <select name="to" id="to" required=""> 
                        <option value="None" default>None</option>
                        <option value="all">All</option>
                        <%
                            List<Invigilator_details> invigilatordetails = HodCon.getInvigilatordetails(dept_code);
                            for (Invigilator_details ind : invigilatordetails) {
                        %>
                        <option value="<%=ind.getInvigilatorId()%>"><%=ind.getInvigilatorId()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Message:</label>
                <div class="col-sm-10">
                    <textarea type="text" class="form-control border-0"  id="msg" placeholder="Write Your Message" required="" name="msg"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Date:</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control border-0"  id="date" placeholder="" required="" name="date">
                </div>
            </div>

            <div class="form-group">        
                <div class="col-sm-offset-2 col-sm-10 ">
                    <button id="send" class="btn btn-success"  data-toggle="modal" data-target="#exampleModal" >Send</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        $(document).ready(function () {
            $("#send").on("click", function (e) {
                e.preventDefault();
            });
            $("#send_btn").on("click", function (e) {
                e.preventDefault();
                let from,to,message,date,state;
                console.log("Send Button Clicked...!!!");
                 from = $("#from").text();
                 to = $("#to").val();
                 message = $("#msg").val();
                 date = $("#date").val();
;
                console.log(from+" "+to+" "+message+" "+date+" ");
                
                    $.ajax({
                        method: "POST",
                        url: "../Controller/message.jsp" ,
                        data: {
                            from: from,
                            to: to,
                            msg: message,
                            date: date
                        },
                        //dataType: "json",
                        success: function (data1) {
                            //alert(data1);
                      state = "<%=session.getAttribute("state")%>";
                            console.log(state);
                            

                        }
                    });

            });
        });

    </script>
    <%                }
                } catch (Exception e) {
                    response.sendRedirect("../HODPanel/HODLogin.jsp");
                }
    %>

</body>
</html>
