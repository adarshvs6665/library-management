<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.library.bookOperations.AddNewBook"%>
<%@page import="com.library.test.HelloServlet"%>
<%
	     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //http1.1
	     response.setHeader("pragma", "no-cache");//http 1.0
	     response.setHeader("Expires","0");//proxy
	     
	     if(session.getAttribute("librarian_login")!="success")
		    {	
		    	 
		    	response.sendRedirect("login-librarian.jsp");
	    	}
%>
<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Add New Book</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />
    <!-- Place favicon.ico in the root directory -->


    <!-- ======== CSS here ======== -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/lineicons.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="assets/css/main.css" />

    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <link href=“https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css”/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />


    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .hero-section {
            padding-top: 100px;
        }
        
        .styling {
            background: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            /* height: 150px;
  overflow: auto; */
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
        
        .navbar {
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 20px;
            padding-bottom: 20px;
            width: 1296px;
        }
        
        .navbar-brand img {
            max-width: 40px;
        }
        
        .login100-form {
            margin-left: auto;
            margin-right: auto;
        }
        
        @media (min-width:1400px) {
            .container,
            .container-lg,
            .container-md,
            .container-sm,
            .container-xl,
            .container-xxl {
                max-width: 1320px
            }
        }
        
        label {
            margin-left: 20px;
        }
        
        #datepicker {
            width: 180px;
            margin: 0 20px 20px 20px;
        }
        
        #datepicker>span:hover {
            cursor: pointer;
        }
    </style>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker('update', new Date());
        });
    </script>
</head>

<body>
	<script>
	addNewBooksPageLoaded();
	function addNewBooksPageLoaded() {
		<%
			int flag;
			if(session.getAttribute("bookAddedStatus") == "failed") {
				session.setAttribute("bookAddedStatus","");
				flag = 0;
			} else {
				flag = 1;
			}
			int bookAddedSuccessFlag;
			if(session.getAttribute("bookAddedStatus") == "success") {
				session.setAttribute("bookAddedStatus","");
				bookAddedSuccessFlag = 1;
			} else {
				bookAddedSuccessFlag = 0;
			}
			
		%>
		if(<%=flag%> == 0) {
			alert("Cannot Add Book");
		}
		if(<%=bookAddedSuccessFlag%> == 1) {
			alert("Added Successfully");
		}
		
	}
	</script>
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
                            <a href="homepage.jsp"><span class="title">Lib.io</span></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                </button>

                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a class="page-scroll-new page-scroll" href="homepage-librarian.jsp">Librarian
                                            Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll active" href="homepage-librarian-managebooks.jsp">Manage Books</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll" href="homepage-librarian-managestudent.jsp">Manage
                                            Student</a>
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
    <section id="home" class="hero-section">
        <div class="container">
            <div class="row align-items-center position-relative">
                <div class="">
                    <div class="hero-content">

                        <div class="limiter">
                            <div class="container-login100">
                                <div class="wrap-login100">
                                    <!-- <div class="login100-pic js-tilt" data-tilt>
                                        <img src="images/img-01.png" alt="IMG">
                                    </div> -->

                                    <form method="post" action="AddNewBook" class="login100-form validate-form">
                                        <span class="login100-form-title">
                                  Add New Book
                                </span>

                                        <div class="wrap-input100">
                                            <input class="input100" type="text" name="book_id" placeholder="Enter Book ID" required>
                                            <span class="focus-input100"></span>
                                            <span class="symbol-input100">
                                                <!-- <span class="fa fa-solid fa-user"></span> -->
                                            <i class="fa fa-sharp fa-solid fa-hashtag"></i>
                                            </span>
                                        </div>

                                        <div class="wrap-input100">
                                            <input class="input100" type="text" name="book_name" placeholder="Enter Book Name" required>
                                            <span class="focus-input100"></span>
                                            <span class="symbol-input100">
                                                <!-- <i class="fa fa-sharp fa-light fa-book-font"></i> -->
                                                <i class="fa fa-sharp fa-solid fa-book"></i>
                                            </span>
                                        </div>

                                        <div class="wrap-input100">
                                            <input class="input100" type="text" name="book_author" placeholder="Enter Author Name" required>
                                            <span class="focus-input100"></span>
                                            <span class="symbol-input100">
                                            <i class="fa fa-solid fa-user"></i>
                                            </span>
                                        </div>

                                        <div class="wrap-input100">
                                            <input class="input100" type="text" name="book_publisher" placeholder="Enter Publisher Name" required>
                                            <span class="focus-input100"></span>
                                            <span class="symbol-input100">
                                                <i class="fa-solid fa-building"></i>
                                            </span>
                                        </div>

                                        <div class="wrap-input100">
                                            <input class="input100" type="text" name="quantity" placeholder="Enter Quantity" required>
                                            <span class="focus-input100"></span>
                                            <span class="symbol-input100">
                                                <i class="fa fa-light fa-list-ol"></i>
                                            </span>
                                        </div>




                                        <div class="container-login100-form-btn">
                                            <input type="submit" value="Add Book" class="login100-form-btn">
                                    
                                  </button>
                                        </div>



                                        <div style="padding-top:50px" class="text-center p-t-136">

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>




                        <!--===============================================================================================-->
                        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                        <!--===============================================================================================-->
                        <script src="vendor/bootstrap/js/popper.js"></script>
                        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
                        <!--===============================================================================================-->
                        <script src="vendor/select2/select2.min.js"></script>
                        <!--===============================================================================================-->
                        <script src="vendor/tilt/tilt.jquery.min.js"></script>
                        <script>
                            $('.js-tilt').tilt({
                                scale: 1.1
                            })
                        </script>
                        <!--===============================================================================================-->
                        <script src="js/main.js"></script>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ======== footer start ======== -->
    <footer style="margin-top:-150px; padding-top: 260px" class="footer">
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