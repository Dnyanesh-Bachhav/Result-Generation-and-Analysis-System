<%-- 
    Document   : settings
    Created on : 15 May, 2021, 2:56:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input { 
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: #2196F3;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }
            label{
                display: inline;
                font-size: 20px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h1 class="shadow-lg border mt-5 text-center pt-2" style="width: 250px;height: 70px;margin-left: 450px;">Settings</h1>
        <div class="m-5">
            <hr>
            <label>Show Tooltip:</label>
            <label class="switch" style="margin-left: 700px;">
                <input type="checkbox" id="tooltip" >
                <span class="slider round"></span>
            </label>
            <hr>
            <label style="display: inline;">Dark Mode:</label>
            <label class="switch" style="margin-left: 700px;">
                <input type="checkbox" id="dark_mode" >
                <span class="slider round"></span>
            </label>
            <hr>
        </div>
        <script>
            let tooltip_btn = document.getElementById("tooltip");
            var btn_tooltip = localStorage.getItem("show_tooltip");

            let btn = (btn_tooltip == "true") ? true : false;
            console.log(btn);
            if (btn)
            {
                // console.log("Button Checked...!!!");
                localStorage.setItem("show_tooltip", true);
                tooltip_btn.checked = true;

            } else {
                localStorage.setItem("show_tooltip", false);
                tooltip_btn.checked = false;

                // console.log("Button Unchecked...!!!");
            }

            tooltip_btn.addEventListener("click", function () {
                // console.log(this);
                if (tooltip_btn.checked)
                {
                    // console.log("Button Checked...!!!");
                    localStorage.setItem("show_tooltip", true);
                    // console.log(tooltip);
                    tooltip_btn.checked = true;
                } else {
                    localStorage.setItem("show_tooltip", false);
                    // console.log("Button Unchecked...!!!");
                    tooltip_btn.checked = false;
                }
            });
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </body>
</html>
