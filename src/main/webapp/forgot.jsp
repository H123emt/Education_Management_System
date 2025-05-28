<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <style>
        body {

            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Jost', sans-serif;
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: #e0e0e0;
        }
        .form-container {
            width: 90%;
            max-width: 400px;
            padding: 20px;
            background: rgba(20, 20, 20, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6);
            text-align: center;
            margin: 10px;
        }
        .form-container h3 {
            margin-top: 0;
            font-size: 1.8em;
            color: #fff;
        }
        .form-container input {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
            font-size: 1em;
            background: #333;
            color: #fff;
        }
        .form-container input::placeholder {
            color: #bbb;
        }
        .form-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #6a4e9e;
            color: #fff;
            font-size: 1em;
            cursor: pointer;
            margin-top: 10px;
        }
        .form-container button:hover {
            background-color: #573b8a;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="form-container" id="forgotPasswordForm">
        <h3>Forgot Password</h3>
        <input type="email" id="email" placeholder="Enter your email" required>
        <button id="sendOtpButton">Send OTP</button>
    </div>
    <div class="form-container hidden" id="otpForm">
        <h3>Enter OTP</h3>
        <input type="text" id="otpInput" placeholder="Enter OTP" required>
        <button id="validateOtpButton">Validate OTP</button>
    </div>

    <div class="form-container hidden" id="passwordForm">
        <h3>Reset Password</h3>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" placeholder="New Password" required>
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" placeholder="Confirm Password" required>
        <button id="updatePasswordButton">Update Password</button>
    </div>
    <script>
        $(document).ready(function() {
            $('#sendOtpButton').click(function() {
                var email = $('#email').val();
                $.ajax({
                    url: '/checkUserExists',
                    type: 'POST',
                    contentType: 'application/json',
                    data: email,
                    success: function(userExists) {
                        if (userExists) {
                            $.ajax({
                                url: '/sendOtp',
                                type: 'POST',
                                contentType: 'application/json',
                                data: email,
                                success: function(message) {
                                    alert(message);
                                    $('#forgotPasswordForm').hide();
                                    $('#otpForm').show();
                                }
                            });
                        } else {
                            alert("User does not exist.");
                        }
                    }
                });
            });

            $('#validateOtpButton').click(function() {
                var otpInput = $('#otpInput').val();
                $.ajax({
                    url: '/validateOtp',
                    type: 'POST',
                    contentType: 'application/json',
                    data: otpInput,
                    success: function(response) {
                        if (response === "OTP validated") {
                            $('#otpForm').hide();
                            $('#passwordForm').show();
                        } else {
                            alert("Invalid OTP");
                        }
                    }
                });
            });

            $('#updatePasswordButton').click(function() {
                var newPassword = $('#newPassword').val();
                var confirmPassword = $('#confirmPassword').val();

                var passwordForm = {
                    newPassword: newPassword,
                    confirmPassword: confirmPassword
                };
                
                $.ajax({
                    url: '/updatePassword',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(passwordForm),
                    success: function(response) {
                        alert(response);
                        window.location.href = "/login";
                    }
                });
            });
        });
    </script>
</body>
</html>
