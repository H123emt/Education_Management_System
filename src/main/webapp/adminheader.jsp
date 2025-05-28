<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Navbar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
            <li><a href="\adminhome">Home</a></li>
            <li><a href="\users">Users</a></li>
            <li><a href="\manage_leave">Leave</a></li>
            <li><a href="\add_faq">FAQ</a></li>
            <li><a href="\add_notice">Notice</a></li>
            <li><a href="\view_contact">Contact</a></li>
        </ul>

        <div class="search">
            <input type="search" placeholder="Search..." aria-label="Search">
        </div>

        <div class="dropdown">
            <img src="admin" alt="Profile Picture">
            <div class="dropdown-content">
                <a href="\profile">Profile</a>
                <hr>
                <a href="/logout">Sign out</a>
            </div>
        </div>
    </div>
</header>

</body>
</html>
