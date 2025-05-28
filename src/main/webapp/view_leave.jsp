<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="facultyheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Leaves</title>
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
        .table-custom {
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }
        .table-custom th, .table-custom td {
            background: rgba(0, 0, 0, 0.8);
            color: #fff;
            border: 1px solid #573b8a;
        }
        .table-custom th {
            background: #573b8a;
            color: #fff;
        }
        .table-custom td {
            background: rgba(0, 0, 0, 0.5);
        }
        .table-custom thead th {
            border-bottom: 2px solid #573b8a;
        }
        .table-custom tbody tr:nth-child(even) {
            background: rgba(0, 0, 0, 0.6);
        }
        .table-custom tbody tr:hover {
            background: rgba(0, 0, 0, 0.8);
            cursor: pointer;
        }
        .btn-approve, .btn-deny {
            margin: 0 5px;
        }
        .btn-approve {
            background-color: #28a745;
            border-color: #218838;
        }
        .btn-approve:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-deny {
            background-color: #dc3545;
            border-color: #c82333;
        }
        .btn-deny:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .btn-hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">From</th>
                    <th scope="col">To</th>
                    <th scope="col">Reason</th>
                    <th scope="col">Apply Date</th>
                    <th scope="col">Status</th>
    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="leave" items="${view_leave}">
                    <tr id="row-${leave.email}">
                        <td>${leave.name}</td>
                        <td>${leave.email}</td>
                        <td>${leave.from_date}</td>
                        <td>${leave.to_date}</td>
                        <td>${leave.reason}</td>
                        <td>${leave.created_at}</td>
                        <td id="status-${leave.email}">${leave.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
</body>
</html>
