<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="adminheader.jsp"></jsp:include>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Services</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- owl carousel style -->
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.carousel.min.css" />
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap" rel="stylesheet">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
     <style>
        
     </style>
    </head>
   <body>
    
<br/>

      <div class="container ">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Mobile</th>
                    <th scope="col">Message</th>
                    <th scope="col">Action</th>


                   
    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="view_contact" items="${view_contact}">
                        <td>${view_contact.Id}</td>
                        <td>${view_contact.Name}</td>
                        <td>${view_contact.Email}</td>
                        <td>${view_contact.Mobile}</td>
                        <td>${view_contact.Message}</td>
                        <td>
                            <form method="post" action="manage_contact">
                                <input type="hidden" name="id" value="${view_contact.Id}"/>
                                <input type="submit" class="btn btn-outline-danger " name="btn" value="Delete" style="height: 35px;width: 100px;"/>
                                <input type="submit"  class="btn-outline-primary" name="btn" value="Edit" style="height: 35px;width: 100px;"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    

  
     <!-- copyright section end -->
     <!-- Javascript files-->
     <script src="js/jquery.min.js"></script>
     <script src="js/popper.min.js"></script>
     <script src="js/bootstrap.bundle.min.js"></script>
     <script src="js/jquery-3.0.0.min.js"></script>
     <script src="js/plugin.js"></script>
     <!-- sidebar -->
     <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
     <script src="js/custom.js"></script>
     <!-- javascript --> 
     <script src="js/owl.carousel.js"></script>
     <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>

</body>
</html>