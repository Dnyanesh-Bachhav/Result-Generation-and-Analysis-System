
<!--Login Page for HOD-->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HOD LOGIN PANEL</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
        <link rel="stylesheet" href="../Style.css">

    </head>
    <body onload="executeOnLoad();" style="background: url('../img/college_img.png');background-size: cover;background-repeat: repeat;">
        <%
            try {
                if (((String) session.getAttribute("hod_user")).equals("hod")) {
                    response.sendRedirect("HODPanel.jsp");
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
                <form action="../Controller/HodLoginProcess.jsp" method="post">
                    <div class="field">
                        <span class="fa fa-user"></span>
                        <input type="text" required placeholder="Username" name="username">
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
        function executeOnLoad() {
        <%
            session.removeAttribute("message");

        %>
            localStorage.setItem("show_tooltip", true);
        }
    </script>

    </body>
</html>