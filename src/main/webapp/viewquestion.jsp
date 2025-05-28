<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="facultyheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Questions</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: #fff;
            font-family: 'Jost', sans-serif;
            padding: 20px;
            margin: 0;
            padding-top: 70px; /* Add padding to account for fixed header height */
        }
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
            background: linear-gradient(145deg, #5c3e8c, #3e1d6b);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }
        .header .custom-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header .nav {
            display: flex;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .header .nav li {
            margin: 0 10px;
        }
        .header .nav a {
            text-decoration: none;
            color: #eee;
            padding: 10px 20px;
            border-radius: 25px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
            font-weight: bold;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }
        .header .nav a:hover {
            background-color: #382260;
            transform: scale(1.05);
        }
        .header .search {
            display: flex;
        }
        .header .search input {
            padding: 10px 15px;
            border: none;
            border-radius: 25px;
            outline: none;
            box-shadow: inset 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header .dropdown {
            position: relative;
            display: inline-block;
        }
        .header .dropdown img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .header .dropdown img:hover {
            transform: scale(1.1);
        }
        .header .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            top: 100%;
            background: linear-gradient(145deg, #ffffff, #e0e0e0);
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
            z-index: 1;
            min-width: 180px;
        }
        .header .dropdown-content a {
            color: #333;
            padding: 10px 20px;
            text-decoration: none;
            display: block;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }
        .header .dropdown-content a:hover {
            background-color: #ddd;
            color: #333;
        }
        .header .dropdown-content hr {
            margin: 0;
            border: 0;
            border-top: 1px solid #ddd;
        }
        .header .dropdown:hover .dropdown-content {
            display: block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 8px;
            overflow: hidden;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #573b8a;
        }
        th {
            background: #573b8a;
            color: #fff;
        }
        tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.1);
        }
        tr:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        form input[type="submit"] {
            background-color: #573b8a;
            border: none;
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 5px;
        }
        form input[type="submit"]:hover {
            background-color: #462b6c;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="custom-container">
            <ul class="nav">
                <li><a href="\facultyhome">Home</a></li>
                <li><a href="\student">Student's</a></li>
                <li><a href="\add_question">Add Questions</a></li>
                <li><a href="\leave">Leave</a></li>
                <!-- <li><a href="\video">Video</a></li> -->
            </ul>

            <div class="search">
                <input type="search" placeholder="Search..." aria-label="Search">
            </div>

            <div class="dropdown">
                <img src="https://github.com/mdo.png" alt="Profile Picture">
                <div class="dropdown-content">
                    <a href="#">New project...</a>
                    <a href="#">Settings</a>
                    <a href="\profile">Profile</a>
                    <hr>
                    <a href="#">Sign out</a>
                </div>
            </div>
        </div>
    </header>

    <table>
        <thead>
            <tr>
                <th>Slno</th>
                <th>Question</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Answer</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="viewq" items="${view_question}">
                <tr>
                    <td>${viewq.slno}</td>
                    <td>${viewq.question}</td>
                    <td>${viewq.option1}</td>
                    <td>${viewq.option2}</td>
                    <td>${viewq.option3}</td>
                    <td>${viewq.option4}</td>
                    <td>${viewq.answer}</td>
                    <td>
                        <form method="post" action="manage_question">
                            <input type="hidden" name="slno" value="${viewq.slno}"/>
                            <input type="submit" name="btn" value="Delete"/>
                            <input type="submit" name="btn" value="Edit"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
