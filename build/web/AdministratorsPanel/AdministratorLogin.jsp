
<!--Admin Login Page-->

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
        <link rel="stylesheet" href="../Style.css">
        <link rel="icon" href="../img/logo1.png" type="image/icon">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </head>
    <body onload="executeOnLoad();">
        <%

            try {
                if (((String) session.getAttribute("admin_user")).equals("admin")) {
                    response.sendRedirect("AdministratorPanel.jsp");
                }
            } catch (Exception e) {
            }

        %>
        <%  session.setAttribute("user", null);
        %>



        <div class="bg-img">
            <div class="content">
                <header>Login</header>
                <img src="../img/logo1.png" width="170" height="160" style=" display: block;margin-left: auto; margin-right: auto;">
                <br>
                <form action="../Controller/adminLogin.jsp" method="post"class="myForm">
                    <div class="field">
                        <span class="fa fa-user"></span>
                        <input type="text" required placeholder="Username" name="name">
                    </div>
                    <div class="field space">
                        <span class="fa fa-lock"></span>
                        <input type="password" class="pass-key" required placeholder="Password" name="password">
                        <span class="show"><i class="fas fa-eye"></i></span>
                    </div>
                    <div class="pass">

                    </div>
                    <span style="color: red;">${message}</span>

                    <div class="field">
                        <input type="submit" value="LOGIN">
                    </div>
                </form>

            </div>
        </div>

    <script>
        const pass_field = document.querySelector('.pass-key');
        const showBtn = document.querySelector('.show');
        showBtn.addEventListener('click', function () {
            if (pass_field.type === "password") {
                pass_field.type = "text";
                showBtn.innerHTML = "<i class='fas fa-eye-slash'></i>";
                showBtn.style.color = "#3498db";
            } else {
                pass_field.type = "password";
                showBtn.innerHTML = "<i class='fas fa-eye'></i>";
                showBtn.style.color = "#222";
            }
        });
        
        function validate(){
            var uname = document.myForm.name.value;
            var password = document.myForm.password.value;
             console.log(password);
            if(uname===""){
                alert("Please enter username");
                document.myForm.name.focus();
                return false;
            }
        }
        
        function executeOnLoad() {
        <%
            session.removeAttribute("message");

        %>
            localStorage.setItem("show_tooltip", true);
        }
    </script>


</body>
</html>
