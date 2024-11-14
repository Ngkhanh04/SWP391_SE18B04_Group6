<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/5f32846ad37b4e9a20fb3bcd085bc0d8.png" type="image/png">
        <title>Tien Son Football Field</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="css/bootstrap.css" />

        <!-- Font Awesome for icons -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles -->
        <link href="css/style.css" rel="stylesheet" />

        <!-- Responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

        <style>
            /* Add your custom CSS here */
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .header {
                background-color: #28a745;
                color: white;
                text-align: center;
                padding: 20px;
            }

            .container {
                width: 90%;
                max-width: 1200px;
                margin: 40px auto;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
            }

            h1, h2 {
                text-align: center;
                color: #333;
            }

            .pitch-list {
                padding: 40px 0;
            }

            .scrolling-header {
                overflow: hidden;
                white-space: nowrap;
                box-sizing: border-box;
                width: 100%;
                position: relative;
            }

            .scrolling-header h3 {
                display: inline-block;
                padding-left: 100%; /* Start off-screen */
                animation: scroll 10s linear infinite; /* Animation speed and duration */
            }

            @keyframes scroll {
                0% {
                    transform: translateX(0);
                }
                100% {
                    transform: translateX(-100%); /* Move to the left until off-screen */
                }
            }

            .playground-item {
                background-color: #f9f9f9;
                border-radius: 10px;
                padding: 15px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s, box-shadow 0.3s, opacity 0.5s;
                position: relative;
                overflow: hidden;
            }

            .image-wrapper {
                width: 100%;
                padding-top: 75%;
                position: relative;
                overflow: hidden;
                border-radius: 10px;
            }

            .image-wrapper img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease, filter 0.5s ease;
            }

            .image-wrapper:hover img {
                transform: scale(1.1);
                filter: brightness(90%);
            }

            .book-now {
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 20px;
                font-weight: bold;
                text-transform: uppercase;
                border-radius: 8px;
                padding: 10px 15px;
                transition: all 0.3s ease-in-out;
            }

            .book-now:hover {
                background-color: #218838;
                transform: scale(1.05);
            }

            .pagination {
                justify-content: center;
                margin-top: 20px;
                display: flex;
                list-style-type: none;
                padding: 0;
            }

            .pagination a,
            .pagination span {
                margin: 0 5px;
                padding: 10px 15px;
                text-decoration: none;
                color: white;
                background-color: #28a745;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .pagination a:hover {
                background-color: #218838;
            }

            .pagination .active {
                background-color: #218838;
                color: white;
            }
        </style>
    </head>
    <body>

        <%
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  // Define the format
            Date date = new Date();  // Get the current date and time
            String currentDate = sdf.format(date);
        %>
        <!-- Header -->
        <div class="header">
            <nav class="navbar navbar-expand-lg custom_nav-container">
                <a class="navbar-brand" href="index.jsp">
                    <span>Tien Son Football Field</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="PitchServlet">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">List <span class="sr-only">(current)</span></a>
                        </li>



                        <li class="nav-item">
                            <a class="nav-link" href="product">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FeedbackServlet">About</a>
                        </li>
                        <li class="nav-item">
                            <c:set var="size" value="${sessionScope.size}"/>
                            <p id="bag">
                                <img src="purepng.com-shopping-cartshoppingcarttrolleycarriagebuggysupermarkets-1421526532323sy0um.png" />
                                <a href="MyCart.jsp">MyCart (${size}) items</a>
                            </p>
                        </li>
                    </ul>
                    <div class="user_option">
                        <form action="menu.jsp" class="form-inline" method="get">
                            <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </form>
                        <c:if test ="${sessionScope.currentUser != null}">
                            <a href="#" class="order_online">
                                Profile
                            </a>
                        </c:if>
                        <c:if test ="${sessionScope.currentUser == null}">
                            <a href="login" class="order_online">
                                Login
                            </a>
                            </a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>

        <!-- List of Pitches -->
        <section class="pitch-list">
            <div class="scrolling-header">
                <h3 class="mt-4 text-center">List of Tien Son Fields</h3>
            </div>
            <div id="pitchListContainer" class="row">
                <c:forEach items="${pitchList}" var="pitch">
                    <div class="col-lg-3 col-md-4 col-6 mb-4">
                        <div class="playground-item">
                            <div class="inner-image mb-3">
                                <div class="image-wrapper">
                                    <a href="pitchInfo.jsp" title="${pitch.pitchType}">
                                        <img src="${pitch.image != null ? pitch.image : 'images/default-pitch.jpg'}" alt="${pitch.pitchType}">
                                    </a>
                                </div>
                            </div>
                            <div class="inner-content">
                                <h5>Field Type: Field ${pitch.pitchType}</h5>
                                <h5>Opening 06:00 - Closing 24:00</h5>
                                <p class="card-text">Price: ${pitch.pricePitch} VND (Services: Free Wifi, lighting, free drinking water.)</p>
                                <!--                        <form action="BookingTimeServlet" method="post">
                                                            <input type="hidden" name="action" value="1">
                                                            <input type="hidden" name="pitchID" value="${pitch.pitchID}">
                                                            <input type="hidden" name="pitchType" value="${pitch.pitchType}">
                                                            <button type="submit" class="btn btn-primary book-now">Book Now</button>
                                                        </form>-->
                                <a class="btn btn-primary book-now" href="BookingTimeServlet?date=<%= currentDate %>&pitchID=${pitch.pitchID}">Book Now</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="PitchServlet?page=1">First</a>
                    <a href="PitchServlet?page=${currentPage - 1}">Previous</a>
                </c:if>
                <span>Page ${currentPage}</span>
                <c:if test="${currentPage < noOfPages}">
                    <a href="PitchServlet?page=${currentPage + 1}">Next</a>
                    <a href="PitchServlet?page=${noOfPages}">Last</a>
                </c:if>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer_section text-center">
            <p>&copy; <span id="displayYear"></span> All Rights Reserved.</p>
        </footer>

        <!-- Bootstrap JS and dependencies -->
        <script src="js/bootstrap.js"></script>
        <script src="js/custom.js"></script>


    </body>
</html>
