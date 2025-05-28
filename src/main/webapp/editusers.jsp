<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
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
            max-width: 800px; /* Adjusted for better portrait view */
            margin: 20px auto;
        }
        form {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            margin-bottom: 20px;
        }
        .box {
            border: 2px solid #573b8a;
            border-radius: 5px;
            padding: 10px;
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            width: calc(100% - 24px); /* Adjusted width to fit padding */
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #573b8a;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4527a0;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:forEach var="user" items="${user_master}">
            <form method="post" action="updateusers">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" class="box" value="${user.name}" required/>
                </div>
                <input type="hidden" name="email" value="${user.email}"/>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" id="mobile" name="mobile" class="box" value="${user.mobile}" required/>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" class="box" value="${user.status}" required/>
                </div>
                <input type="submit" name="btn" value="Update"/>
            </form>
        </c:forEach>
    </div>
</body>
</html>
