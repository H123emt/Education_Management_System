<jsp:include page="adminheader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: #fff;
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
        .header-content {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .dashboard-container {
            margin-top: 80px; 
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
            max-width: 1200px;
            margin: 80px auto 20px;
        }
        .dashboard-card {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
        }
        .dashboard-card-header {
            background: linear-gradient(145deg, #5c3e8c, #3e1d6b);
            color: #fff;
            font-weight: bold;
            padding: 10px;
            border-bottom: 2px solid #3e1d6b;
        }
        .dashboard-card-body {
            padding: 20px;
        }
        .chart-container {
            position: relative;
            height: 400px;
            width: 100%;
        }
        .notice-board {
            margin-top: 20px;
        }
        .notice-board h4 {
            margin-bottom: 10px;
        }
        .notice-board ul {
            list-style-type: none;
            padding: 0;
        }
        .notice-board li {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .more-options {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .more-options .option-card {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 8px;
            padding: 15px;
            flex: 1;
            max-width: calc(33% - 15px);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .more-options .option-card:hover {
            background: rgba(0, 0, 0, 0.9);
        }
        .option-card a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .option-card a:hover {
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
            height: 500px; 
            border: none;
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
        </div>

<div class="dashboard-container">
    <div class="dashboard-card">
        <div class="dashboard-card-header">Total Students</div>
        <div class="dashboard-card-body">
            <div class="chart-container">
                <canvas id="studentChart"></canvas>
            </div>
        </div>
    </div>

    <div class="dashboard-card notice-board">
        <div class="dashboard-card-header">Notice Board</div>
        <div class="dashboard-card-body">
            <h4>Recent Notices</h4>
             <div class="notice-section">
            <h2>Important Notices</h2>
            <iframe src="/notice"></iframe>
        </div>
        </div>
    </div>

    <div class="dashboard-card more-options">
        <div class="option-card">
            <a href="#">View Attendance</a>
        </div>
        <div class="option-card">
            <a href="#">Manage Courses</a>
        </div>
        <div class="option-card">
            <a href="#">Update Profile</a>
        </div>
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

    // Chart.js example code
    var ctx = document.getElementById('studentChart').getContext('2d');
    var studentChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Student A', 'Student B', 'Student C', 'Student D', 'Student E'],
            datasets: [{
                label: 'Number of Students',
                data: [12, 19, 3, 5, 2],
                backgroundColor: 'rgba(93, 73, 173, 0.6)',
                borderColor: 'rgba(93, 73, 173, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>
</html>
