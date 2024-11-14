<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <style>
            a { text-decoration: none; }
            table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid black; padding: 8px; text-align: center; }

            .header {
                background-color: #28a745;
                color: white;
                text-align: center;
                padding: 20px;
            }

            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
            }

            .checkout-section {
                text-align: right;
                margin-top: 20px;
            }

            .checkout-button {
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

            .checkout-button:hover {
                background-color: #218838;
            }

            .back-link {
                color: chocolate;
                font-size: 1.2rem;
            }

            .back-link:hover {
                color: darkorange;
            }
               .header {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 20px;
        }
        </style>
    </head>
    <body>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PitchServlet">List</a>
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
                            <a href="#" class="order_online">Profile</a>
                        </c:if>
                        <c:if test ="${sessionScope.currentUser == null}">
                            <a href="login" class="order_online">Login</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Back button -->
        <div class="back-button">
            <a href="product" class="back-link">Back</a>
        </div>

        <h1>My Cart</h1>
        <table>
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <c:set var="t" value="0"/>
            <c:set var="orderIds" value="" />
            <c:forEach items="${sessionScope.cart.items}" var="i" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${i.product.product_name}</td>
                    <td>
                        <button><a href="process?num=-1&id=${i.product.product_id}">-</a></button>
                        <input type="text" readonly value="${i.quantity}">
                        <button><a href="process?num=1&id=${i.product.product_id}">+</a></button>
                    </td>
                    <td>${i.price}</td>
                    <td>${i.quantity * i.price}</td>
                    <td>
                        <form action="process" method="post">
                            <input type="hidden" name="id" value="${i.product.product_id}"/>
                            <input type="submit" value="Return Item"/>
                        </form>
                    </td>
                </tr>
                <c:set var="t" value="${t + (i.quantity * i.price)}" />
                <c:if test="${loop.index == 0}">
                    <c:set var="orderIds" value="${i.product.product_id}" />
                </c:if>
                <c:if test="${loop.index > 0}">
                    <c:set var="orderIds" value="${orderIds}&${i.product.product_id}" />
                </c:if>
            </c:forEach>
        </table>

      <!-- Checkout button -->
        <div class="checkout-section">
            <form action="payment" method="post">
                <a href="CartServlet" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
            </form>
        </div>
    </body>
</html>
