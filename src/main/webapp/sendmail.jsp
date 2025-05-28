<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel canvas: Password Reset</title>
 <!-- stylish sheet for dark and light mode -->
<link href="CSS/main.css" rel="stylesheet" type="text/css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
           background: var(--bg-primary);
            color: var(--primary-col);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
        }

        /* Add animated background */
        #background {
            position: absolute;
            width: 100vw;
            height: 100vh;
            top: 0;
            left: 0;
            overflow: hidden;
        }

        /* Animation styles for lock and key */
        @keyframes move {
            0% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(50px);
            }

            100% {
                transform: translateY(0);
            }
        }

        .icon {
            font-size: 200px;
            opacity: 0.4;
            position: absolute;
            animation: move 5s infinite;
        }

        .lock {
            left: 10%;
            top: 10%;
            animation-duration: 5s;
        }

        .key {
            left: 70%;
            top: 50%;
            animation-duration: 7s;
        }

        form {
            width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1;
        }

        /* Add a header */
        h2 {
            color: #333;
            text-align: center;

        }

        p {
            color: #0314cd;
            text-align: center;
            margin-top: -10px;
            margin-bottom: 20px;
        }

        p.try {
            margin-top: 5px;
            text-align: left;
        }

        p.try-2 {
            margin-top: -35px;
            text-align: right;
        }

        p.try a,
        p.try-2 a {
            text-decoration: none;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 94%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
        }

        input[type="button"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            margin-bottom: 10px;
        }

        input[type="button"]:hover,
        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Error message styles */
        span.error-message {
            color: red;
            display: block;
            margin-bottom: 10px;
            animation: shake 0.5s ease;
        }

        @keyframes shake {

            0%,
            100% {
                transform: translateX(0);
            }

            25% {
                transform: translateX(-5px);
            }

            50% {
                transform: translateX(5px);
            }
        }

        /* Smooth transition effects for hidden divs */
        #h-2,
        #hh-2,
        #hh-3 {
            display: none;
            opacity: 0;
            transform: scale(0.9);
            transition: all 0.5s ease-in-out;
        }

        #h-2.show,
        #hh-2.show,
        #hh-3.show {
            display: block;
            opacity: 1;
            transform: scale(1);
        }

        /* Add icon style */
        label:before {
            content: "\1F512";
            /* Unicode lock icon */
            margin-right: 5px;
        }
    </style>
</head>

<body class="dark-mode">
    <div id="background">
        <div class="icon lock">&#x1F512;</div>
        <div class="icon key">&#x1F511;</div>
    </div>



    <form action="resetPassword" method="post" onsubmit="return chk2();">
        <h2>Reset Your Password</h2>
        <p>using OTP system</p>

        <!-- Input field to enter email/username -->
        <label for="email-2">Enter Email/UserName:</label>
        <input type="text" name="email-2" id="email-2">
        <input type="text" name="oemail_to" id="to">

        <input type="button" name="btn" id="search_name_btn-2" value="Search">
        <span id="sms1-2" class="error-message"></span>

        <!-- Request OTP button (initially hidden) -->
        <div id="h-2">
            <input type="button" id="Request_otp" value="Request OTP">
            <span id="timer-1"></span>
        </div>

        <!-- Enter OTP field and verify button (initially hidden) -->
        <div id="hh-2">
            <label for="otp">Enter OTP:</label>
            <input type="text" name="otp" id="otp">
            <input type="button" id="verify_otp" value="Verify">
            <span id="sms2-2" class="error-message"></span>
        </div>

        <!-- Reset password fields (initially hidden) -->
        <div id="hh-3">
            <label for="newPass">Enter new Password:</label>
            <input type="password" name="password" id="newPass">
            <br />

            <label for="retypePass">Retype Password:</label>
            <input type="password" name="retypePass" id="retypePass" onkeyup="validPass()">
            <br />

            <input type="submit" value="Reset">
            <span id="sms3-2" class="error-message"></span>
        </div>

        <div>
            <p class="try"><a href="/forgot">Try Another Way</a></p>
            <p class="try-2"><a href="/login">Login</a></p>
        </div>
    </form>

    <script>
        $(document).ready(function () {



            // Handle the Search button click
            $("#search_name_btn-2").click(function () {
                var email = $("#email-2").val();

                $.ajax({
                    url: "getDetails",
                    type: "POST",
                    data: { email: email },
                    success: function (res) {
                        if (res.length > 0) {
                            $("#to").val(res[0].email);
                            $("#h-2").addClass("show");
                            $("#email-2").prop("readonly", true);
                            $("#search_name_btn-2").hide();
                            $("#sms1-2").text("");
                        } else {
                            $("#sms1-2").text("Invalid UserName/Email");
                        }
                    },
                    error: function () {
                        $("#sms1-2").text("An error occurred while checking user existence.");
                    }
                });
            });

            // Handle the Request OTP button click

            $("#Request_otp").click(function () {
                $("#hh-2").removeClass("show");
                $("#timer-1").text(`Please wait... OTP sending in few seconds...`);
                $("#Request_otp").css("display", "none");

                // Call the AJAX function to send the OTP
                $.ajax({
                    url: "send-mail",
                    type: "POST",
                    data: { to: $("#to").val() },
                    success: function (response) {
                        if (response === "send successfully") {
                            // Display the OTP input field and verify button
                            $("#hh-2").addClass("show");
                            // Clear the countdown message
                            $("#timer-1").text("");
                            $("#Request_otp").css("display", "block");
                            $("#Request_otp").attr("value", "Resend OTP");
                        } else {
                            $("#timer-1").text(response);
                        }
                    },
                    error: function () {
                        $("#timer-1").text("An error occurred while sending OTP.");
                    }
                });
            })



            // Handle the Verify OTP button click
            $("#verify_otp").click(function () {
                $.ajax({
                    url: "verify-otp",
                    type: "POST",
                    data: { email: $("#to").val(), otp: $("#otp").val() },
                    success: function (response) {
                        if (response === "valid") {
                            //if (response.valid) {
                            $("#hh-3").addClass("show");
                            $("#hh-2").removeClass("show");
                            $("#Request_otp").css("display", "none");

                        } else {
                            $("#sms2-2").text("Invalid OTP. Please try again.");
                        }
                    },
                    error: function () {
                        $("#sms2-2").text("An error occurred while verifying OTP.");
                    }
                });
            });

            // Password matching on retype password keyup event
            $("#retypePass").on("keyup", function () {
                validPass();
            });
        });

        // Password validation function
        function validPass() {
            var newPass = $("#newPass").val();
            var retypePass = $("#retypePass").val();
            var sms = $("#sms3-2");

            if (newPass === "") {
                sms.text("Please enter a new password.");
                sms.addClass("error-message");
                return false;
            }

            if (retypePass === "") {
                sms.text("Please retype your password.");
                sms.addClass("error-message");
                return false;
            }

            if (newPass !== retypePass) {
                sms.text("Passwords do not match.");
                sms.addClass("error-message");
                return false;
            } else {
                sms.text("");
                sms.removeClass("error-message");
                return true;
            }
        }

        // Form submission validation function
        function chk2() {
            var passValid = validPass();
            return passValid;
        }
    </script>

</body>

</html>