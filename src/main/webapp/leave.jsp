<jsp:include page="facultyheader.jsp"></jsp:include>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Leave</title>
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
            margin: 40px auto;
        }
        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #573b8a;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
        }
        .form-group input:focus, .form-group textarea:focus {
            border-color: #462a68;
            outline: none;
        }
        .btn-primary {
            background: #573b8a;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            text-align: center;
            display: block;
            width: 100%;
            margin-top: 10px;
        }
        .btn-primary:hover {
            background: #462a68;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Apply for Leave</h2>
        <form action="/submitLeave" method="post">
            <div class="form-group">
                <label for="name">Username</label>
                <input type="text" id="name" name="name" value="${user.name}" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${user.email}" readonly>
            </div>
            <div class="form-group">
                <label for="fromDate">From</label>
                <input type="date" id="fromDate" name="fromDate" required>
            </div>
            <div class="form-group">
                <label for="toDate">To</label>
                <input type="date" id="toDate" name="toDate" required>
            </div>
            <div class="form-group">
                <label for="reason">Reason</label>
                <textarea id="reason" name="reason" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn-primary">Submit</button>
        </form>
    </div>

    <script>
        // Show alert if there is a message
        document.addEventListener("DOMContentLoaded", function() {
            var message = "${message}";
            if (message && message.trim() !== "") {
                alert(message);
            }
        });
    </script>
</body>
</html>

</body>
</html>
