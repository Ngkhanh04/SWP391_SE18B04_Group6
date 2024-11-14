<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            .back-link {
                color: chocolate;
                font-size: 1.2rem;
            }

            .back-link:hover {
                color: darkorange;
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
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
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
                </div>
            </nav>  
        </div>
            <hr class="mt-0 mb-4">

            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                            <button class="btn btn-primary" type="button">Upload new image</button>
                        </div>
                    </div>
                </div>


        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form action="updateProfileServlet" method="post"> <!-- Action to update profile -->
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputEmail">Email Address</label>
                            <input class="form-control" id="inputEmail" name="email" type="email"
                                   placeholder="Enter your email" value="${user.email}" required>
                        </div>
                        <!-- Form Group (password)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputPassword">Password</label>
                            <input class="form-control" id="inputPassword" name="password" type="password"
                                   placeholder="Enter your password" value="${user.password}" required>
                            <input type="checkbox" id="showPassword" onclick="togglePassword()"> Show Password
                        </div>
                        <!-- Update button-->
                        <button href="updateProfile.jsp" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>