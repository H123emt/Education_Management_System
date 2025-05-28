<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
     
    </head>
   <body>
      <!--header section start -->
      <div class="header_section">
         <div class="header_bg">
            <div class="container">
               <nav class="navbar navbar-expand-lg navbar-light bg-light">
                  <a class="logo" href="index.html"><img src="images/logo.png"></a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav mr-auto">
                                 <li class="nav-item active">
                           <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="/about">About</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="/service">Services</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="/blog">Blog</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="/contact">Contact Us</a>
                        </li>
                     </ul>
                     <div class="call_section">
                        <ul>
                           <li><a href="#"><img src="images/fb-icon.png"></a></li>
                           <li><a href="#"><img src="images/twitter-icon.png"></a></li>
                           <li><a href="#"><img src="images/linkedin-icon.png"></a></li>
                           <li><a href="#"><img src="images/instagram-icon.png"></a></li>
                           <div class="donate_bt"><a href="#"><img src="images/search-icon.png"></a></div>
                        </ul>
                     </div>
                  </div>
               </nav>
            </div>
         </div>
      </div>
<br/>
<br/>
<br/>
<br/>
<div class="container my-4 mt-4">
    <c:forEach var="view_contact" items="${view_contact}">
        <form method="post" action="updatecontact" class="border p-4 mb-4 shadow-sm rounded bg-light">
            <input type="hidden" name="id" value="${view_contact.Id}"/>

            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${view_contact.Email}" required/>
            </div>

            <div class="mb-3">
                <label for="mobile" class="form-label">Mobile:</label>
                <input type="text" id="mobile" name="mobile" class="form-control" value="${view_contact.Mobile}" required/>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${view_contact.Name}" required/>
            </div>

            <div class="mb-3">
                <label for="message" class="form-label">Message:</label>
                <input type="text" id="message" name="message" class="form-control" value="${view_contact.Message}" required/>
            </div>

            <button type="submit" name="btn" class="btn btn-primary">Update</button>
        </form>
    </c:forEach>
</div>
<div class="footer_section layout_padding">
    <div class="container">
       <div class="subscribe_bt"><a href="#">Subscribe</a></div>
       <input type="text" class="email_text" placeholder="Enter Your Email" name="Enter Your Email">
       <div class="footer_section_2">
          <div class="row">
             <div class="col-lg-3 col-md-6 margin_top">
                <div class="call_text"><a href="#"><img src="images/call-icon1.png"><span class="padding_left_15">Call Now +01 9876543210</span></a></div>
                <div class="call_text"><a href="#"><img src="images/mail-icon1.png"><span class="padding_left_15">demo@gmail.com</span></a></div>
             </div>
             <div class="col-lg-3 col-md-6">
                <div class="information_main">
                   <h4 class="information_text">Information</h4>
                   <p class="many_text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration</p>
                </div>
             </div>
             <div class="col-lg-3 col-md-6">
                <div class="information_main">
                   <h4 class="information_text">Helpful Links</h4>
                   <div class="footer_menu">
                      <ul>
                         <li><a href="index.html">Home</a></li>
                         <li><a href="about.html">About</a></li>
                         <li><a href="services.html">Services</a></li>
                         <li><a href="blog.html">Blog</a></li>
                         <li><a href="news.html">News</a></li>
                      </ul>
                   </div>
                </div>
             </div>
             <div class="col-lg-3 col-md-6">
                <div class="information_main">
                   <div class="footer_logo"><a href="index.html"><img src="images/footer-logo.png"></a></div>
                </div>
             </div>
          </div>
       </div>
    </div>
 </div>
 <!-- footer section end -->
 <!-- copyright section start -->
 <div class="copyright_section">
    <div class="container">
       <p class="copyright_text">© 2020 All Rights Reserved. <a href="https://html.design">Free html  Templates</a></p>
    </div>
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
