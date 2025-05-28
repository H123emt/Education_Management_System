<%@ page import="java.util.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="studentheader.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
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
            width: 80%;
            max-width: 1200px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            box-shadow: 5px 10px 30px #000;
            color: #fff;
            margin-top: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="email"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-right: 10px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background: #573b8a;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 1em;
            cursor: pointer;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
            background: #6d44b8;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #4f3187;
            color: #fff;
        }
        table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }
        table tr:nth-child(odd) {
            background-color: rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <form method="post" action="search_result">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="submit" value="Search Result">
        </form>

        <table>
            <tr>
                <th>Student Email</th>
                <th>Student Answer</th>
                <th>Student Mark</th>
            </tr>
            <c:forEach var="stu" items="${view_result}">
                <tr>
                    <td>${stu.student_email}</td>
                    <td>${stu.student_answer}</td>
                    <td>${stu.student_mark}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
