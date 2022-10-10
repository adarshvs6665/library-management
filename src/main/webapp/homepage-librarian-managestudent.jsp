<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.library.studentOperations.AllStudents" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<%
	     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //http1.1
	     response.setHeader("pragma", "no-cache");//http 1.0
	     response.setHeader("Expires","0");//proxy
	     
	     if(session.getAttribute("librarian_login")!="success")
		    {	
		    	 
		    	response.sendRedirect("login-librarian.jsp");
	    	}
%>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Manage - Student</title>
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
        
        .cards-list {
            z-index: 0;
            width: 100%;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        
        .card {
            margin: 30px auto;
            width: 300px;
            height: 300px;
            border-radius: 40px;
            box-shadow: 5px 5px 30px 7px rgba(0, 0, 0, 0.25), -5px -5px 30px 7px rgba(0, 0, 0, 0.22);
            cursor: pointer;
            transition: 0.4s;
        }
        
        .card .card_image {
            width: inherit;
            height: inherit;
            border-radius: 40px;
        }
        
        .card .card_image img {
            width: inherit;
            height: inherit;
            border-radius: 40px;
            object-fit: cover;
        }
        
        .card .card_title {
            text-align: center;
            border-radius: 0px 0px 40px 40px;
            font-family: sans-serif;
            font-weight: bold;
            font-size: 30px;
            margin-top: -35px;
            height: 40px;
        }
        
        .card:hover {
            transform: scale(0.9, 0.9);
            box-shadow: 5px 5px 30px 15px rgba(0, 0, 0, 0.25), -5px -5px 30px 15px rgba(0, 0, 0, 0.22);
        }
        
        .title-white {
            color: white;
        }
        
        .title-black {
            color: black;
        }
        
        .title-managebook {
            font-family: Poppins-Bold;
            font-size: 35px;
            color: #fff;
            line-height: 1.2;
            text-align: center;
            width: 100%;
            display: block;
        }
        
        @media all and (max-width: 500px) {
            .card-list {
                /* On small screens, we are no longer using row direction but column */
                flex-direction: column;
            }
        }
        /*
.card {
  margin: 30px auto;
  width: 300px;
  height: 300px;
  border-radius: 40px;
  background-image: url('https://i.redd.it/b3esnz5ra34y.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  background-repeat: no-repeat;
box-shadow: 5px 5px 30px 7px rgba(0,0,0,0.25), -5px -5px 30px 7px rgba(0,0,0,0.22);
  transition: 0.4s;
}
*/
    </style>
</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

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
                            <a class="navbar-brand" href="homepage.jsp">
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
                                        <a class="page-scroll-new page-scroll" href="homepage-librarian.jsp">Librarian Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll" href="homepage-librarian-managebooks.jsp">Manage Books</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll active" href="#">Manage Student</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="page-scroll" href="homepage-librarian-fine.jsp">Fine</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll" href="<%=request.getContextPath()%>/LibrarianLogout">Logout</a>
                                    </li>

                                    <!-- <li class="nav-item">
                                        <a href="javascript:void(0)">Clients</a>
                                    </li> -->
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
    <section id="librarian-home" class="hero-section">

        <div class="container">

            <div style="min-height:614px;" class="row align-items-center position-relative">
                <div style="width:100%" class="col-lg-6">
                    <center>
                        <span class="title-managebook">Manage Student</span>
                    </center>
                    <div class="hero-content">
                        <div class="cards-list">

                            <div onclick="location.href='managestudent-issuebook.jsp';" class="card 1">
                                <div class="card_image"> <img src="images/card-bg.jpg" /> </div>
                                <div class="card_title title-white">
                                    <p style="padding-right: 0;color: #162447;font-weight: 900;font-size: 20px;">Issue Book</p>
                                </div>
                            </div>
                            <div onclick="location.href='managestudent-returnbook.jsp';" class="card 1">
                                <div class="card_image"> <img src="images/card-bg.jpg" /> </div>
                                <div class="card_title title-white">
                                    <p style="padding-right: 0;color: #162447;font-weight: 900;font-size: 20px;">Return Book</p>
                                </div>
                            </div>
                            <div onclick="location.href='managestudent-addstudent.jsp';" class="card 1">
                                <div class="card_image"> <img src="images/card-bg.jpg" /> </div>
                                <div class="card_title title-white">
                                    <p style="padding-right: 0;color: #162447;font-weight: 900;font-size: 20px;">Enroll Student</p>
                                </div>
                            </div>
                            <div onclick="location.href='AllStudents';" class="card 1">
                                <div class="card_image"> <img src="images/card-bg.jpg" /> </div>
                                <div class="card_title title-white">
                                    <p style="padding-right: 0;color: #162447;font-weight: 900;font-size: 20px;">View / Delete Student</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ======== hero-section end ======== -->



    <!-- ======== footer start ======== -->
    <footer class="footer">
        <div class="container">
            <div class="widget-wrapper">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="footer-widget">
                            <div class="logo mb-30">
                                <a class="navbar-brand" href="homepage.jsp">
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