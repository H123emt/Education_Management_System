<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Under Maintenance</title>
    
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            padding-top: 60px; /* Adjust based on the header height */
        }
        .maintenance-container {
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 100%;
        }
        .maintenance-message {
            font-size: 2rem;
            font-weight: bold;
            margin: 0;
            animation: zoomInOut 2s infinite;
        }
        @keyframes zoomInOut {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.2);
                opacity: 0.8;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        .maintenance-subtext {
            font-size: 1.2rem;
            margin-top: 10px;
        }
       
    </style>
</head>
<body>
    
    <div class="maintenance-container">
        <p class="maintenance-message">Page Under Maintenance</p>
        <p class="maintenance-subtext">We're working hard to improve our website. Please check back later.</p>
    </div>
</body>
</html>
