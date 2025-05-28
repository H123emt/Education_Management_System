<!DOCTYPE html>
<html lang="en">
<jsp:include page="facultyheader.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <title>Upload a Video</title>
    <style>
        .bd {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .upload-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        .upload-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="file"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 20px;
            width: 100%;
            cursor: pointer;
        }

        button {
            background-color: #007bff;
            border: none;
            padding: 12px 20px;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error-message {
            margin-top: 15px;
            color: red;
        }
    </style>
</head>
<body>
<div class="bd">

    <div class="upload-container">
        <h2>Upload a Video</h2>
        <form method="post" action="/uploadvideo" enctype="multipart/form-data">
            <label for="videoFile">Select Video</label>
            <input type="file" id="videoFile" name="videoFile" accept="video/*">
            <button type="submit">Upload</button>
           
        </form>
        <br>
         <a href="managevideos"><button type="button">Manage Videos</button></a> 
        <div class="error-message">${error}</div>
    </div>

    <script>
        window.onload = function() {
            var err = "${error}";
            if (err && err.trim() !== "") {
                alert("Please select a video.");
            }
        };
    </script>
</div>
</body>
</html>
