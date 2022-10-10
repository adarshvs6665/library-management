<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.library.bean.books.Book"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>All Books</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />
    <!-- Place favicon.ico in the root directory -->

    <!-- ======== CSS here ======== -->
    <link rel="stylesheet" href="css-table-18/fonts/icomoon/style.css">

    <link rel="stylesheet" href="css-table-18/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css-table-18/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="css-table-18/css/style.css">

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
    <script>
        function myFunction() {
            // Declare variables 
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    <style>
        .customSearch {
            padding: 6px 12px;
            width: 100%;
            background: rgba(31, 32, 35, 0.801);
            border: 1px solid rgb(240, 243, 249);
            border-radius: 4px;
            font-size: 18px;
            color: rgb(255, 255, 255);
            height: 46px;
            appearance: none;
            transition: border 0.15s ease 0s;
        }
    </style>
    <style>
        .hero-section {
            padding-top: 100px;
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
        
        .mb-5 {
            color: #162447;
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
                                    <h2 class="mb-5">All Books</h2>
                                    <input style="margin-bottom: 20px;" class="customSearch" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Books"><br>


                                    <div class="table-responsive custom-table-responsive">

                                        <table id="myTable" class="table custom-table">
                                            <thead>
                                                <tr>
                                                    <th id="demo" class="table-head" scope="col">ID</th>
                                                    <th class="table-heading" scope="col">Book</th>
                                                    <th class="table-heading" scope="col">Author</th>
                                                    <th class="table-heading" scope="col">Publisher</th>
                                                    <th class="table-heading" scope="col">Total Qty</th>
                                                    <th class="table-heading" scope="col">Issued Qty</th>
                                                    <th class="table-heading" scope="col">Added Date</th>
                                                    <th class="table-heading" scope="col">Remove</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <% 
                                            	
	                                    		for(int i=0; i<10; ++i) {
                                            %>
                                                <tr scope="row">
                                                    <td>100</td>
                                                    <td>a</td>
                                                    <td>a</td>
                                                    <td>a</td>
                                                    <td name="quantities">5</td>
                                                    <td>a</td>
                                                    <td>a</td>
                                                    <td style="text-align: right;padding-right: 50px;">
                                                        <form action="RemoveJobPostAdmin" method="post">
                                                            <a name="removeLink" id="Link1" style="font-color: #df2359" href="#"><i class="fa fa-solid fa-check"></i></a>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr class="spacer">
                                                    <td colspan="100"></td>
                                                </tr>
												<%} %>
												<script>
												let elements = document.getElementsByName("removeLink");
												let quantities = document.getElementsByName("quantities");
												document.getElementById("demo").innerHTML = elements[1].tagName;
												let i = 10;
												for(let j=0;j<i;++j) {
													elements[j].innerHTML = "jandsjfna";
													console.log(quantities[j].innerHTML);
													var x = quantities[j].innerHTML;
													if(x == 0) {
														disableLink(i,elements);
													} else {
														showLink(i,elements);
													}
													
												}
												function disableLink(i,elements)
                                                {

                                                elements[i].disabled=true;
                                                elements[i].removeAttribute('href');    
                                                elements[i].style.textDecoration = 'none';
                                                elements[i].style.cursor = 'default';
                                                
                                                colourcode = "red";
                                                }

                                                function showLink(i,elements)
                                                {
                                                	elements[i]('Link1').disabled=false;
                                                //assign href dynamically
                                                elements[i].href = "<%=request.getContextPath()%>/HelloServlet";
                                                elements[i].style.textDecoration = "underline";
                                                elements[i].style.cursor = "hand";
                                                colourcode = "green";
                                                }
                                                
                                                
                                                

                                             //Change text color on mouseover
                                             elements[0].addEventListener('mouseover', function handleMouseOver() {
                                               elements[0].style.color = colourcode;
                                             });

                                             //Change text color back on mouseout
                                             elements[0].addEventListener('mouseout', function handleMouseOut() {
                                               elements[0].style.color = 'black';
                                             });
												
                                                

                                                  
													</script>


                                            </tbody>
                                        </table>
                                    </div>

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
                                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed dinonumy eirmod tempor invidunt.
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