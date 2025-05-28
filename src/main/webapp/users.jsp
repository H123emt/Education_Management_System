<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
        .btn-danger, .btn-primary {
            margin: 0 5px;
        }
        .btn-danger {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .btn-danger:hover {
            background-color: #a71d2a;
            border-color: #921d26;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Mobile</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${user_mast}">
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.mobile}</td>
                        <td>${user.status}</td>
                        <td>
                            <form method="post" action="manageusers">
                                <input type="hidden" name="email" value="${user.email}" readonly/>
                                <button type="submit" name="btn" class="btn btn-danger" value="delete">Delete</button>
                                <button type="submit" name="btn" class="btn btn-primary" value="edit">Edit</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
