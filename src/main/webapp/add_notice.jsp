<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Notice</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Jost', sans-serif;
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: #fff;
        }
        .container {
            width: 90%;
            max-width: 600px; /* Adjusted for portrait mode */
            margin: 20px auto;
        }
        form {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        textarea {
            border: 2px solid #573b8a;
            border-radius: 5px;
            padding: 10px;
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            width: 100%;
            height: 100px;
            resize: vertical;
        }
        #bt {
            background-color: #a188ce;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
        #bt:hover {
            background-color: #8e24aa;
        }
        #st {
            background-color: #573b8a;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
        #st:hover {
            background-color: #4527a0;
        }
        #nsms {
            display: block;
            margin-top: 10px;
            color: #f44336; /* Error message color */
        }
        .xy {
            text-align: center;
            margin-top: 20px;
        }
        .result {
            text-align: center;
            margin-top: 20px;
        }
        @media (max-width: 768px) {
            textarea {
                width: 100%;
            }
            .container {
                width: 95%;
                max-width: 100%;
            }
            #bt, #st {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <form method="post" action="/addnotice" onsubmit="return validNotice()">
            <textarea name="notice" placeholder="Add your notice..." id="tx"></textarea>
            <span id="nsms"></span><br/><br/>
            <input type="submit" value="Submit" id="st">
        </form>
        <div class="xy">
            <a href="/viewnotice"><input type="button" value="View Notice" id="bt"></a>
        </div>
        <div class="result"></div>
    </div>

    <script type="text/javascript">
        function validNotice() {
            var notice = document.getElementById('tx').value;
            if (notice.trim() === "") { // Use trim() to check for empty spaces
                document.getElementById('nsms').innerHTML = "Should not leave blank";
                return false;
            } else {
                document.getElementById('nsms').innerHTML = "";
                return true;
            }
        }
    </script>
</body>
</html>
