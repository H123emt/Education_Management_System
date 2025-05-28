<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging Out...</title>
    <script>
        // Clear the session storage
        sessionStorage.removeItem('splashScreenShown');

        // Redirect to the login page
        window.location.href = '/'; // Update this URL to your login page
    </script>
</head>
<body>
    <h1>Logging out...</h1>
</body>
</html>
