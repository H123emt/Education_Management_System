<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="studentheader.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Uploaded Videos</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .video-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(340px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .video-card {
            background-color: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.2s;
        }

        .video-card:hover {
            transform: scale(1.02);
        }

        video {
            width: 320px;
            height: 240px;
            object-fit: cover; /* Makes the video fill the space without distortion */
            border-radius: 8px;
        }

        p {
            margin-top: 10px;
            color: #555;
            font-size: 15px;
        }
    </style>
</head>
<body>

    <h2>Uploaded Videos</h2>
    <div class="video-gallery">
        <c:forEach var="video" items="${video_data}">
            <div class="video-card">
                <video width="320" height="240" controls muted>
                    <source src="/videos/${video.video_name}" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
                <p>Uploaded by: ${video.teacher_id}</p>
            </div>
        </c:forEach>
    </div>

</body>
</html>
