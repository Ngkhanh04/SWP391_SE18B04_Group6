<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Feedback" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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

        <style>
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
            .feedback-form {
                margin-top: 40px;
            }
            .feedback-list .card {
                border: none;
            }
            .feedback-list .card-title {
                font-size: 1.2rem;
                margin-bottom: 0.5rem;
            }
            .feedback-list .card-text {
                margin: 0.2rem 0;
            }
        </style>
    </head>
    <body>

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
                        <li class="nav-item ">
                            <a class="nav-link" href="index.jsp">Home </a>
</li>
                        <li class="nav-item">
                            <a class="nav-link" href="PitchServlet">List</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="FeedbackServlet">About <span class="sr-only">(current)</span> </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="product">Product  </a>
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
                
                </c:if>

                    </div>
                </div>
            </nav>
        </div>





        <div class="container"> <h1>Welcome to Tien Son Football Field</h1> <p> Welcome to Tiên Sơn Football Pitch, one of the most modern and high-quality fields in the city! With premium artificial turf, optimized lighting systems, and spacious surroundings, Tiên Sơn is the perfect choice for thrilling matches, local tournaments, or regular training sessions. </p> <p> At Tiên Sơn, we not only provide you with a beautiful football field but also a range of amenities: spacious stands, convenient parking, and clean changing rooms, ensuring you always have a comfortable and memorable experience. </p> <p> Enjoy our facilities, and book a field now for your next match! </p> </div>
        <!-- Feedback Section -->
        <div class="container mt-5">
            <h2 class="text-center mb-4">Customer Feedback</h2>

            <div class="feedback-list row">
                <c:if test="${not empty FeedbackP}">
                    <c:forEach items="${FeedbackP}" var="feedback">
                        <div class="col-md-4 mb-4">
                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><strong>Name:</strong> ${feedback.name}</h5>
                                    <p class="card-text"><strong>Rating:</strong> ${feedback.rating} ★</p>
                                    <p class="card-text"><strong>Comment:</strong> ${feedback.comment}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <!-- Feedback Form -->
            <div class="feedback-form mt-5">
                <h3 class="text-center mb-4">Feedback Form</h3>
<form action="FeedbackServlet" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="rating">Rating:</label>
                        <select id="rating" name="rating" class="form-control" required>
                            <option value="5">★ ★ ★ ★ ★</option>
                            <option value="4">★ ★ ★ ★ ☆</option>
                            <option value="3">★ ★ ★ ☆ ☆</option>
                            <option value="2">★ ★ ☆ ☆ ☆</option>
                            <option value="1">★ ☆ ☆ ☆ ☆</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="comment">Comment:</label>
                        <textarea id="comment" name="comment" class="form-control" rows="4" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-success btn-lg btn-block">Submit Feedback</button>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS and other libraries -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
                                                                                        
