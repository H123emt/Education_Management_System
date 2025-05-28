<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Notice</title>
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
            width: 80%;
            max-width: 1200px;
            margin: 20px auto;
        }
        .form-custom {
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }
        .form-custom input[type="text"],
        .form-custom textarea {
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            border: 1px solid #573b8a;
            border-radius: 4px;
            padding: 10px;
            width: 100%;
        }
        .form-custom textarea {
            resize: vertical;
            height: 100px;
        }
        .form-custom input[type="submit"] {
            background: #573b8a;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px;
            cursor: pointer;
            margin-top: 10px;
        }
        .form-custom input[type="submit"]:hover {
            background: #462a68;
        }
        .form-custom label {
            margin-bottom: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Notice</h2>
        <c:forEach var="editn" items="${view_notice}">
            <form method="post" action="updatenotice" class="form-custom">
                <label>ID:</label>
                <input type="text" name="id" value="${editn.id}" readonly/>
                <label>Content:</label>
                <textarea name="content">${editn.content}</textarea>
                <input type="submit" name="btn" value="Update"/>
            </form>
        </c:forEach>
    </div>
</body>
</html>
