<%@ include file="studentheader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Quiz</title>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            font-family: 'Jost', sans-serif;
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
        }
        .container {
            width: 60%;
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            box-shadow: 5px 10px 30px #000;
            color: #fff;
            margin-top: 20px;
        }
        .question-block {
            margin-bottom: 20px;
            padding: 10px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
        }
        .question-block label {
            font-size: 1.2em;
            font-weight: bold;
        }
        .question-block input[type="radio"] {
            margin: 5px 0;
        }
        .question-block input[type="radio"] + label {
            margin-left: 5px;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background: #573b8a;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }
        .submit-btn:hover {
            background: #6d44b8;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="/saveStudentAnswer" method="post">
            <c:forEach var="q" items="${question}">
                <div class="question-block">
                    <label>Qn: ${q.question}</label><br/>
                    <input type="radio" id="q${q.slno}1" name="q${q.slno}" value="1">
                    <label for="q${q.slno}1">${q.option1}</label><br/>
                    <input type="radio" id="q${q.slno}2" name="q${q.slno}" value="2">
                    <label for="q${q.slno}2">${q.option2}</label><br/>
                    <input type="radio" id="q${q.slno}3" name="q${q.slno}" value="3">
                    <label for="q${q.slno}3">${q.option3}</label><br/>
                    <input type="radio" id="q${q.slno}4" name="q${q.slno}" value="4">
                    <label for="q${q.slno}4">${q.option4}</label><br/>
                </div>
            </c:forEach>
            <input type="submit" value="Submit Answer" class="submit-btn">
        </form>
        <script>
            // Display the mark in an alert box if it's not empty or null
            var mark = '${mark}';
            if (mark) {
                alert('Your mark is: ' + mark);
            }
        </script>
    </div>
</body>
</html>
