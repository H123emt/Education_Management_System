<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Notices</title>
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
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            box-shadow: 5px 10px 30px #000;
            margin: 20px auto;
        }
        .notice-section {
            margin-bottom: 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        h1 {
            font-size: 2em;
            color: #fff;
            border-bottom: 2px solid #573b8a;
            padding-bottom: 10px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 10px 0;
        }
        marquee {
            font-size: 1.2em;
            color: #fff;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="notice-section">
            <h1>Notices</h1>
            <ul>
                <c:forEach var="notice" items="${notices}">
                    <li>
                        <marquee onmouseover="this.stop();" onmouseout="this.start();">
                            ${notice}
                        </marquee>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</body>
</html>
