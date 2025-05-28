<jsp:include page="adminheader.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: #fff;
            font-family: 'Jost', sans-serif;
            margin: 0;
            padding: 0;
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
        .container {
            width: 80%;
            max-width: 900px;
            margin: 100px auto 0; /* Add margin-top to push the form below the fixed header */
        }
        .form-container {
            background: rgba(0, 0, 0, 0.7);
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            color: #fff;
            text-align: center;
        }
        .form-container textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #573b8a;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .form-container input[type="submit"], .form-container input[type="button"] {
            background-color: #573b8a;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .form-container input[type="submit"]:hover, .form-container input[type="button"]:hover {
            background-color: #462b6c;
        }
        .form-container a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <form action="add_faq" method="post">
                <label for="question">Question:</label><br>
                <textarea id="question" name="question"></textarea><br>
                <label for="answer">Answer:</label><br>
                <textarea id="answer" name="answer"></textarea><br>
                <input type="submit" value="Submit">
            </form>
            <br>
            ${res}
            <br>
            <a href="/view_faq"><input type="button" value="View FAQ"></a>
        </div>
    </div>
</body>
</html>
