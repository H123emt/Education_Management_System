<%@ page import="java.util.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="studentheader.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
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
        .header-placeholder {
            height: 60px; /* Adjust based on the actual height of the header */
        }
        .dashboard-section {
            margin-bottom: 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .dashboard-section h2 {
            margin-top: 0;
            font-size: 1.5em;
        }
        .dashboard-section p {
            font-size: 1.2em;
        }
        .dashboard-section a {
            color: #573b8a;
            text-decoration: none;
            font-weight: bold;
        }
        .dashboard-section a:hover {
            text-decoration: underline;
        }
        .notice-section {
            margin-bottom: 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .notice-section iframe {
            width: 100%;
            height: 500px; /* Adjust as needed */
            border: none;
        }
        .splash-screen {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: #24243e;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            top: 0;
            left: 0;
        }
        .splash-screen h1 {
            font-size: 48px;
            color: #fff;
            animation: fadeInOut 3s ease-in-out;
        }
        @keyframes fadeInOut {
            0% { opacity: 0; }
            50% { opacity: 1; }
            100% { opacity: 0; }
        }
    </style>
</head>
<body>

<div class="splash-screen" id="splashScreen">
    <h1>Welcome, ${name}</h1>
</div>

<div class="container" id="mainContent" style="display:none;">
    <div class="dashboard-section">
        <h2>Welcome, ${name}</h2>
        <p>Here are your recent activities and updates:</p>
        <ul>
            <li><a href="/exam">Take a new exam</a></li>
            <li><a href="/viewresult">View your exam results</a></li>
            <li><a href="/video">Access tutorial videos</a></li>
            <li><a href="/doubt">Ask a question</a></li>
        </ul>
    </div>

    <div class="dashboard-section">
        <h2>Upcoming Deadlines</h2>
        <c:forEach var="deadline" items="${upcomingDeadlines}">
            <p>${deadline.date} - ${deadline.description}</p>
        </c:forEach>
    </div>

    <div class="notice-section">
        <h2>Important Notices</h2>
        <iframe src="/notice"></iframe>
    </div>

    <div class="dashboard-section">
        <h2>Your Profile</h2>
        <p>Email: ${email}</p>
        <p><a href="/profile">Edit your profile</a></p>
    </div>
</div>

<script>
    // Check if the splash screen has already been shown
    if (!sessionStorage.getItem('splashScreenShown')) {
        // Display the splash screen
        document.getElementById('splashScreen').style.display = 'flex';
        document.getElementById('mainContent').style.display = 'none';

        // Set a timeout to hide the splash screen and show the main content
        setTimeout(() => {
            document.getElementById('splashScreen').style.display = 'none';
            document.getElementById('mainContent').style.display = 'block';
            // Mark the splash screen as shown
            sessionStorage.setItem('splashScreenShown', 'true');
        }, 3000); // Splash screen duration in milliseconds
    } else {
        // Hide the splash screen and show the main content immediately
        document.getElementById('splashScreen').style.display = 'none';
        document.getElementById('mainContent').style.display = 'block';
    }
</script>

</body>
</html>
