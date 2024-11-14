<%-- 
    Document   : Fields
    Created on : Oct 16, 2024, 5:57:07 PM
    Author     : hokha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <!-- menu tren -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .container{
                width: 90%;
                max-width: 1200px;
                margin: 40px auto;
                background-color: white;
                border-radius: 10px;
                box-shadow: auto;
                padding: 40px
            }
            body{
                background-color: floralwhite;
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
            /* Footer styling */
            footer {
                background-color: #343a40;
                color: white;
                padding: 50px 0;
            }
            .footer-links a {
                color: white;
                text-decoration: none;
            }
            .footer-links a:hover {
                text-decoration: underline;
            }

            #bag {
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #f8f9fa;
                padding: 10px 15px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                width: fit-content;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            #bag:hover {
                background-color: #e9ecef;
            }

            #bag img {
                margin-right: 10px;
                width: 24px; /* Adjust the image size */
            }

            #bag p {
                font-size: 14px;
                font-weight: bold;
                color: #343a40;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            #bag p:hover {
                color: #28a745; /* Green color when hovering */
            }

            .item-count {
                background-color: #28a745;
                color: white;
                border-radius: 50%;
                padding: 0 8px;
                font-size: 12px;
                position: absolute;
                top: -5px;
                right: -5px;
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <!--begin of menu-->
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
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>                <li class="nav-item">
                            <a class="nav-link" href="PitchServlet">List</a>
                        </li>
                        <li class="nav-item active">

                            <a class="nav-link" href="product">Product <span class="sr-only">(current)</span></a>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" href="FeedbackServlet">About</a>
                        </li>
                        <li class="nav-item">
                            <a id="bag"  href="MyCart.jsp">
                                <img src="images/purepng.com-shopping-cartshoppingcarttrolleycarriagebuggysupermarkets-1421526532323sy0um.png" width="24px" alt="Cart Icon" />
                                <p>
                                    MyCart
                                    <span class="item-count">
                                        <!-- Fetch the number of items dynamically using sessionScope.cart -->
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.cart}">
                                                ${sessionScope.cart.size()} <!-- This assumes your cart is a List or Map -->
                                            </c:when>
                                            <c:otherwise>
                                                0
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    items
                                </p>
                            </a>
                        </li>
                    </ul>
                    <div class="user_option">
                        <form action="menu.jsp" class="form-inline" method="get">
                            <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </form>
                        <c:if test ="${sessionScope.currentUser != null}">
                            <a href="#" class="order_online">Profile</a>
                        </c:if>
                        <c:if test ="${sessionScope.currentUser == null}">
                            <a href="login" class="order_online">Login</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>

        <!--end of menu-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Category</a></li>
                            <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listC}" var="o">
                                <li class="list-group-item text-white"><a href="Category?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Lưu ý</div>
                        <div class="card-body">
                            Thanh toán bằng mã QR, xin cảm ơn !!!
                        </div>
                    </div>
                </div>

                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.product_image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.product_id}" title="View Product">${o.product_name}</a></h4>
                                        <p class="card-text show_txt">${o.product_title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.product_price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="detailproduct?pid=${o.product_id}" class="btn btn-success btn-block">Booking</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <footer class="footer_section text-center">
            <p>&copy; <span id="displayYear"></span> All Rights Reserved.</p>
        </footer>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var categories = document.querySelectorAll('.list-group-item');

                categories.forEach(function (category) {
                    category.addEventListener('click', function () {
                        // Remove 'active' class from all categories
                        categories.forEach(function (cat) {
                            cat.classList.remove('active');
                        });

                        // Add 'active' class to the clicked category
                        this.classList.add('active');
                    });
                });
            });
        </script>

        <script type="text/javascript">
            function buy(id) {
                var m = document.f.num.value;
                document.f.action = "buy?id=" + id + "&num" + m;
                document.f.submit();
            }
        </script>
    </body>
</html>
