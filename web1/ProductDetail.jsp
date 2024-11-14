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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <style>
            #bag {
                text-align: right;
                margin-right: 30px;
                margin-top: 30px;
            }
            .product-container {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                width: 60%;
                margin: 40px auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: #fff;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }
            .product-image-container {
                width: 40%;
                text-align: center;
            }
            .product-image {
                max-width: 100%;
                height: auto;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }
            .product-details {
                width: 55%;
                text-align: left;
            }
            .product-name {
                font-size: 2rem;
                font-weight: bold;
                margin-bottom: 10px;
                color: #333;
            }
            .product-title {
                font-size: 1.2rem;
                color: #555;
                margin-bottom: 15px;
            }
            .product-price {
                font-size: 1.8rem;
                color: #28a745;
                margin-bottom: 20px;
                font-weight: bold;
            }
            .product-detail {
                font-size: 1rem;
                color: #666;
                margin-bottom: 20px;
            }
            .buy-button {
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 1rem;
                font-weight: 600;
                margin-top: 10px;
            }
            .buy-button:hover {
                background-color: #218838;
            }
            .header {
                background-color: #28a745;
                color: white;
                text-align: center;
                padding: 20px;
            }
            footer {
                margin-top: 40px;
                background-color: #f8f9fa;
                padding: 20px;
                text-align: center;
                font-size: 0.9rem;
                color: #6c757d;
            }
            .buy-button {
    background-color: #28a745;
    color: white;
    padding: 12px 30px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    display: inline-block;
    text-decoration: none;
    text-align: center;
    margin-top: 15px;
}

.buy-button:hover {
    background-color: #218838;
    transform: scale(1.05); /* Slightly enlarges the button on hover */
}

.buy-button:active {
    background-color: #1e7e34;
    transform: scale(0.98); /* Shrinks the button when clicked */
}

.col a.buy-button {
    display: inline-block;
    margin-left: 10px; /* Adds a small margin between buttons */
}
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function buy(id) {
                const quantity = $('input[name="num"]').val();
                $.ajax({
                    type: 'POST',
                    url: 'buy',
                    data: {id: id, num: quantity},
                    success: function (response) {
                        alert('Item added to cart!');
                    }
                });
            }
        </script>
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
                        <c:if test="${sessionScope.currentUser != null}">
                            <a href="#" class="order_online">Profile</a>
                        </c:if>
                        <c:if test="${sessionScope.currentUser == null}">
                            <a href="login" class="order_online">Login</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Product Detail Section -->
        <div class="product-container">
            <jsp:useBean id="db" class="dal.ProductDao"/>
            <c:set var="product" value="${db.getProductbyid(pid)}" />

            <!-- Image on the left -->
            <div class="product-image-container">
                <img class="product-image" src="${detail.product_image}" alt="${detail.product_name}" />
            </div>

            <!-- Product details on the right -->
            <div class="product-details">
                <h2 class="product-name">${detail.product_name}</h2>
                <p class="product-title">${detail.product_title}</p>
                <p class="product-price">${detail.product_price} VND</p>

                <form name="f" action="" method="post">
                    Enter the number of items to buy:
                    <input type="number" name="num" value="1" min="1" />
                    <button type="button" class="buy-button" onclick="buy('${detail.product_id}')">Buy to cart</button>
                    <div class="col">
                        <a href="MyCart.jsp" class="buy-button">Buy</a>
                    </div>
                </form>

                <p class="product-detail">${detail.product_detail}</p>
            </div>
        </div>

        <footer>
            <p>&copy; <span id="displayYear"></span> All Rights Reserved.</p>
        </footer>
    </body>
</html>
