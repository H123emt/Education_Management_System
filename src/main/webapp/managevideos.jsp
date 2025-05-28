<jsp:include page="facultyheader.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage My Videos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f9fc;
          
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        video {
            width: 220px;
            height: 150px;
        }
        .btn-delete {
            background: #e74c3c;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .msg {
            text-align: center;
            color: green;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<h2>My Uploaded Videos</h2>

<c:if test="${not empty msg}">
    <p class="msg">${msg}</p>
</c:if>

<table>
    <thead>
        <tr>
            <th>Video</th>
            <th>Name</th>
                      
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="video" items="${videos}">
            <tr>
                <td>
                    <video controls muted>
                        <source src="/videos/${video.video_name}" type="video/mp4">
                    </video>
                </td>
                <td>${video.video_name}</td>
             
                <td>
                    <a href="/deletevideo?sl_no=${video.sl_no}" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
