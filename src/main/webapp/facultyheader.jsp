<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>faculty</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }
        .header {
            padding: 15px 0;
            border-bottom: 2px solid #3e1d6b;
            background: linear-gradient(145deg, #5c3e8c, #3e1d6b);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1000;
        }
        .custom-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }
        .nav {
            display: flex;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .nav li {
            margin: 0 10px;
        }
        .nav a {
            text-decoration: none;
            color: #eee;
            padding: 10px 20px;
            border-radius: 25px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
            font-weight: bold;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }
        .nav a:hover {
            background-color: #382260;
            transform: scale(1.05);
        }
        .search {
            display: flex;
        }
        .search input {
            padding: 10px 15px;
            border: none;
            border-radius: 25px;
            outline: none;
            box-shadow: inset 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .dropdown img:hover {
            transform: scale(1.1);
        }
        .dropdown-content {
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
        .dropdown-content a {
            color: #333;
            padding: 10px 20px;
            text-decoration: none;
            display: block;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
            color: #333;
        }
        .dropdown-content hr {
            margin: 0;
            border: 0;
            border-top: 1px solid #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
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
            <li><a href="\view_leave">View Leave</a></li>
             <!-- <li><a href="\uploadvideo">Video</a></li>  -->
        </ul>

        <div class="search">
            <input type="search" placeholder="Search..." aria-label="Search">
        </div>

        <div class="dropdown">
            <img src="https://templates.joomla-monster.com/joomla30/jm-news-portal/components/com_djclassifieds/assets/images/default_profile.png" alt="Profile Picture">
            <div class="dropdown-content">
                <a href="\faculty_profile">Profile</a>
                <hr>
                <a href="/logout">Sign out</a>
            </div>
        </div>
    </div>
</header>

</body>
</html>
