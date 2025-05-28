<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Custom Navbar</title>
    <style>
      .custom-header {
        width: 100%;
        padding: 15px 0;
        border-bottom: 1px solid #ddd;
        background-color: #4f3187;
        display: flex;
        justify-content: center;
      }
      .custom-container {
        width: 90%;
        max-width: 1200px;
        display: flex;
        align-items: center;
        justify-content: space-between;
      }
      .custom-nav {
        display: flex;
        list-style: none;
        padding: 0;
        margin: 0;
      }
      .custom-nav li {
        margin: 0 10px;
      }
      .custom-nav a {
        text-decoration: none;
        color: #eee;
        padding: 5px 10px;
        border-radius: 5px;
      }
      .custom-nav a:hover {
        background-color: #382260;
      }
      .custom-search {
        display: flex;
      }
      .custom-search input {
        padding: 5px 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }
      .custom-dropdown {
        position: relative;
        display: inline-block;
      }
      .custom-dropdown img {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        cursor: pointer;
      }
      .custom-dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        background-color: #f9f9f9;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        border-radius: 5px;
        z-index: 1;
      }
      .custom-dropdown-content a {
        color: black;
        padding: 10px 20px;
        text-decoration: none;
        display: block;
      }
      .custom-dropdown-content a:hover {
        background-color: #f1f1f1;
      }
      .custom-dropdown-content hr {
        margin: 5px 0;
        border: 0;
        border-top: 1px solid #eee;
      }
      .custom-dropdown:hover .custom-dropdown-content {
        display: block;
      }
    </style>
  </head>
  <body>
    <header class="custom-header">
      <div class="custom-container">
        <ul class="custom-nav">
          <li><a href="\studenthome">Home</a></li>
          <li><a href="\exam">Exam</a></li>
          <li><a href="\viewresult">Result</a></li>
          <!-- <li><a href="\video">Video</a></li>
            <%-- <li><a href="\maintenance">Doubt</a></li> --%> -->
        </ul>

        <div class="custom-dropdown">
          <img src="https://github.com/mdo.png" alt="mdo" />
          <div class="custom-dropdown-content">
            <a href="\profile">Profile</a>
            <hr />
            <a href="/logout">Sign out</a>
          </div>
        </div>
      </div>
    </header>
  </body>
</html>
