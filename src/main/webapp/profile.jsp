<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="adminheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile Photo</title>
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
            max-width: 800px;
            margin: 20px auto;
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }
        .profile-image {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 8px;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-image img {
            border-radius: 8px;
        }
        .btn-update {
            background-color: #28a745;
            border-color: #218838;
        }
        .btn-update:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .form-group label {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile-image">
            <c:choose>
                <c:when test="${not empty userprofile and not empty userprofile[0].photo}">
                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(userprofile[0].photo)}" width="100" height="100" />
                </c:when>
                <c:otherwise>
                    <img src="data:image/jpeg;base64,${'defaultImageBase64'}" width="100" height="100" />
                </c:otherwise>
            </c:choose>
        </div>

        <form method="post" action="upload" enctype="multipart/form-data">
            <div class="form-group">
                <label for="photoUpload">Upload New Photo:</label>
                <input type="file" id="photoUpload" name="f" class="form-control-file" />
                <input type="text" id="photoUpload" name="age" class="form-control-file" />
            </div>
            <button type="submit" name="btn" class="btn btn-update">Update</button>
        </form>
    </div>
</body>
</html>
