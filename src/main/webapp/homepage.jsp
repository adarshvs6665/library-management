<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<%
	     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //http1.1
	     response.setHeader("pragma", "no-cache");//http 1.0
	     response.setHeader("Expires","0");//proxy
	     
	     if(session.getAttribute("admin_login")=="success") {	
	    	response.sendRedirect("homepage-admin.jsp");
    	 } else if(session.getAttribute("librarian_login")=="success") {	
 	    	response.sendRedirect("homepage-librarian.jsp");
     	 } else if(session.getAttribute("student_login")=="success") {	
 	    	response.sendRedirect("homepage-student.jsp");
     	 }
%>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Library Management</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />
    <!-- Place favicon.ico in the root directory -->

    <!-- ======== CSS here ======== -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/lineicons.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="assets/css/main.css" />

    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        .navbar-brand img {
            max-width: 40px;
        }
        
        .title {
            font-family: Poppins-Bold;
            font-size: 35px;
            color: #fff;
            line-height: 1.2;
            text-align: center;
            width: 100%;
            display: block;
        }
        .profile-avatar {
        	width: 130px;
        }
    </style>
</head>

<body>

    <!-- ======== preloader start ======== -->
    <div class="preloader">
        <div class="loader">
            <div class="spinner">
                <div class="spinner-container">
                    <div class="spinner-rotator">
                        <div class="spinner-left">
                            <div class="spinner-circle"></div>
                        </div>
                        <div class="spinner-right">
                            <div class="spinner-circle"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- preloader end -->

    <!-- ======== header start ======== -->
    <header class="header">
        <div class="navbar-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="#">
                                <img src="images/logo.png" alt="Logo" />

                            </a>
                            <a href="homepage.jsp" class="nav-item-2"><span class="title">Lib.io</span></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="toggler-icon"></span>
                <span class="toggler-icon"></span>
                <span class="toggler-icon"></span>
              </button>

                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a class="page-scroll-new page-scroll active" href="#home">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll" href="login-librarian.jsp">Librarian</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll" href="login-student.jsp">Student</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="page-scroll" href="login-admin.jsp">Admin</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll-new page-scroll" href="#about-us">About Us</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll-new page-scroll" href="#contact-us">Contact Us</a>
                                    </li>
                                    
                                </ul>
                            </div>
                            <!-- navbar collapse -->
                        </nav>
                        <!-- navbar -->
                    </div>
                </div>
                <!-- row -->
            </div>
            <!-- container -->
        </div>
        <!-- navbar area -->
    </header>
    <!-- ======== header end ======== -->

    <!-- ======== hero-section start ======== -->
    <section id="home" class="hero-section">
        <div class="container">
            <div class="row align-items-center position-relative">
                <div class="col-lg-6">
                    <div class="hero-content">
                        <h1 style="margin-bottom:8px;" class="wow fadeInUp" data-wow-delay=".4s">
                            Welcome to 
                        </h1>
                        <h1 class="wow fadeInUp" data-wow-delay=".4s">
                        <span style='background-image: url("images/logo.png");background-size: 70px;background-repeat: no-repeat;min-width: 90px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lib.io</span>
                        </h1>
                        <p class="wow fadeInUp" data-wow-delay=".6s">
                            Bad libraries build collections, good libraries build services, great libraries build communities.
                        </p>
                        <a href="#contact-us" class="main-btn border-btn btn-hover wow fadeInUp" data-wow-delay=".6s">Contact Us</a>
                        <a href="#about-us" class="scroll-bottom">
                            <i class="lni lni-arrow-down"></i></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="hero-img wow fadeInUp" data-wow-delay=".5s">
                        <img src="assets/img/hero/lib-image.svg" style="height:570px;" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ======== hero-section end ======== -->

    <!-- ======== feature-section start ======== -->
    <section id="about-us" class="feature-section pt-120">
        <div class="container">
            <div class="row justify-content-center">
            <div class="col-lg-3 col-md-8 col-sm-10">
                    <div class="single-feature">
                        <div class="icon">
                            <img class="profile-avatar" src="images/profile-amalendu.png">
                        </div>
                        <div class="content">
                            <h3>Amalendu A</h3>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-8 col-sm-10">
                    <div class="single-feature">
                        <div class="icon">
                            <img class="profile-avatar" src="images/profile-divyasree.jpg">
                        </div>
                        <div class="content">
                            <h3>Divyasree K</h3>
                            
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-8 col-sm-10">
                    <div class="single-feature">
                        <div class="icon">
                            <img class="profile-avatar" src="images/profile-sona.jpg" style="width:175px;">
                        </div>
                        <div class="content">
                            <h3>Sona S S</h3>
                           
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-8 col-sm-10">
                    <div class="single-feature">
                        <div class="icon">
                            <img class="profile-avatar" src="images/profile-sooraj.jpg">
                        </div>
                        <div class="content">
                            <h3>Sooraj J S</h3>
                            <!--  <p>
                                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
                            </p>
                             -->
                        </div>
                    </div>
                </div>
                <!--  
                <div class="col-lg-4 col-md-8 col-sm-10">
                    <div class="single-feature">
                        <div class="icon">
                            <i class="lni lni-coffee-cup"></i>
                        </div>
                        <div class="content">
                            <h3>Easy to Use</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
                            </p>
                        </div>
                    </div>
                </div>
                -->
            </div>
        </div>
    </section>
    <section id="contact-us"><br><br></section>
    <footer id="" class="footer">
        <div class="container">
            <div class="widget-wrapper">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="footer-widget">
                            <div class="logo mb-30">
                                <a class="navbar-brand" href="#">
                                    <img src="images/logo.png" alt="Logo" />

                                </a>
                                <a><span class="title">Lib.io</span></a>
                            </div>
                            <p class="desc mb-30 text-white">
                                Where knowledge meets technology!<br><br><br>
                            </p>
                            <ul class="socials">
                                <li>
                                    <a href="jvascript:void(0)">
                                        <i class="lni lni-facebook-filled"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="jvascript:void(0)">
                                        <i class="lni lni-twitter-filled"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="jvascript:void(0)">
                                        <i class="lni lni-instagram-filled"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="jvascript:void(0)">
                                        <i class="lni lni-linkedin-original"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-2 col-md-6">
                        <div class="footer-widget">
                            <h3>About Us</h3>
                            <ul class="links">
                                <li><a href="javascript:void(0)">Team</a></li>
                                <li><a href="javascript:void(0)">Mentor</a></li>
                                <li><a href="javascript:void(0)">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h3>Features</h3>
                            <ul class="links">
                                <li><a href="javascript:void(0)">How it works</a></li>
                                <li><a href="javascript:void(0)">Privacy policy</a></li>
                                <li><a href="javascript:void(0)">Terms of service</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h3>Contact Us</h3>
                            <ul class="links">
                                <li><a href="jvascript:void(0)">Facebook</a></li>
                                <li><a href="jvascript:void(0)">Instagram</a></li>
                                <li><a href="jvascript:void(0)">Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ======== footer end ======== -->

    <!-- ======== scroll-top ======== -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ======== JS here ======== -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>