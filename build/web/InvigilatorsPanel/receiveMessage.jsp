<%-- 
    Document   : receiveMessage code of ajax
    Created on : 20 Oct, 2020, 10:08:37 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            body{
                margin: 5%;
            }
        </style>
    </head>
    <body>
        <div id="message"></div>
        <script>
            <%
                String uname = (String) session.getAttribute("uname");
            %>

            $(document).ready(function () {
                var output = "";
                var name = "<%=uname%>";
                console.log(name);
                
                $("div").on("click","#closeMessage", function(e){
                    e.preventDefault();
                    var id = $(this).attr("data-sid");
                    console.log(id);
                    
                    $.ajax({
                        method: "POST",
                        url: "${pageContext.request.contextPath}/updateStatus",
                        data: {
                            name: name,
                            id: id
                        },
                        success: function(data)
                        {
                            console.log(data);
                        }
                    });
                })
                

                $.ajax({
                    method: "GET",
                    url: "${pageContext.request.contextPath}/getMessage",
                    data: {
                        name: name
                    },
                    dataType: "json",
                    error: function (request, error) {
                        console.log(arguments);
                        alert(" Can't do because: " + error);
                    },
                    success: function (data1) {
                        console.log(data1);
                      data1.forEach((item) => {
                          output += "<div class='alert alert-warning alert-dismissible fade show' role='alert'>"+item[1]+"<blockquote class='blockquote-footer float-right'>"+item[3]+"</blockquote><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true' data-sid="+item[0]+" id='closeMessage'>&times;</span></button></div>";
                      });
                        document.getElementById("message").innerHTML = output;
                    }

                });
                
                
            });
        </script>


        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
