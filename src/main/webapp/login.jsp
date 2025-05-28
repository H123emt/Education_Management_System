<!DOCTYPE html>
<html>
<head>
    <title>Login/Register</title>
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
            background-image: url(https://i0.wp.com/www.convergeict.com/wp-content/uploads/2022/12/Web-Banner-Christmas-BG-GIF-V2-1.gif?ssl=1);

        }
        .main {
            width: 350px;
            height: 500px;
            overflow: hidden;
            background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/cover;
            border-radius: 10px;
            box-shadow: 5px 20px 50px #000;
        }
        #chk {
            display: none;
        }
        .signup, .login {
            position: relative;
            width: 100%;
            height: 100%;
        }
        label {
            color: #fff;
            font-size: 2.3em;
            display: flex;
            justify-content: center;
            margin: 50px;
            font-weight: bold;
            cursor: pointer;
            transition: .5s ease-in-out;
        }
        input {
            width: 60%;
            height: 10px;
            background: #e0dede;
            display: flex;
            justify-content: center;
            margin: 20px auto;
            padding: 12px;
            border: none;
            outline: none;
            border-radius: 5px;
        }
        button {
            width: 60%;
            height: 40px;
            margin: 10px auto;
            display: block;
            color: #fff;
            background: #573b8a;
            font-size: 1em;
            font-weight: bold;
            margin-top: -15px;
            outline: none;
            border: none;
            border-radius: 5px;
            transition: .2s ease-in;
            cursor: pointer;
        }
        button:hover {
            background: #6d44b8;
        }
        .signup {
            height: 460px;
            background: #eee;
            border-radius: 60% / 10%;
            transform: translateY(-180px);
            transition: .8s ease-in-out;
        }
        .signup label {
            color: #573b8a;
            transform: scale(.6);
        }
        #chk:checked ~ .signup {
            transform: translateY(-500px);
        }
        #chk:checked ~ .signup label {
            transform: scale(1);
        }
        #chk:checked ~ .login label {
            transform: scale(.6);
        }
        .radio-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            text-size-adjust: 6px;
        }
        .radio-group label {
            margin: 0 10px;
            color: #FFFFFF;
            font-size: 1em;
            font-weight: normal;
        }
        .message {
            color: #FFFFFF;
            font-size: 1em;
            margin: 10px auto;
            text-align: center;
        }
        .login-link {
            color: #FFFFFF;
            font-size: 0.9em;
            display: block;
            text-align: center;
            margin-top: 15px;
            color: white;
        }
        .register-link {
            color: #573b8a;
            font-size: 0.9em;
            display: block;
            text-align: center;
            margin-top: 15px;
            color: white;
        }
    </style>
</head>
<body>
    <div class="main">
        <input type="checkbox" id="chk" aria-hidden="true">

        <div class="login">
            <form action="/chk_login" method="post">
                <label for="chk" aria-hidden="true">Login</label>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Login</button>
                <a class="register-link" href="/register">Don't have an account? Register</a>
                <br>
                <a class="login-link" href="/forgot" >forgot password</a>
                <div class="message">${res}</div>
            </form>
        </div>

        <div class="signup">
            <form action="/save_user" method="post">
                <label for="chk" aria-hidden="true">Sign up</label>
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="text" name="mobile" placeholder="Mobile" required>
                <div class="radio-group">
                    <label>
                        Student <input value="student" type="radio" name="role" required>
                    </label>
                    <label>
                        Faculty <input value="faculty" type="radio" name="role" required>
                    </label>
                </div>
                <button type="submit">register</button>
                <a class="login-link" href="/login" >Already have an account? Login</a>
                
                <div class="message">${res}</div>
            </form>
        </div>
    </div>
    <script>
        // JavaScript to check if 'chk' should be checked initially
        window.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const login = urlParams.get('login');
            if (login === 'true') {
                document.getElementById('chk').checked = true;
            }

            // JavaScript to show alert with ${res} value
            const res = "${res}";
            if (res) {
                alert(res);
            }
        });
    </script>
</body>
</html>
