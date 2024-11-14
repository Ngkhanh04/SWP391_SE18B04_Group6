<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="stylee.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
           <link rel="shortcut icon" href="images/5f32846ad37b4e9a20fb3bcd085bc0d8.png" type="">
    </head>
    <body>
        <div class="infinity-container">
            <!-- Company Logo -->
            <div class="logo">
                <%--<img src="image/.jpg" width="150px">--%>
            </div>
            <!-- FORM CONTAINER BEGIN -->
            <div class="infinity-form-block">
                <div class="infinity-click-box text-center">Create an account</div>

                <div class="infinity-fold">
                    <div class="infinity-form">
                        <!-- Updated form with action and method -->
                        <form class="form-box" action="register" method="POST">
                            <!-- Input Box -->
<!--                            <div class="form-input">
                                <span><i class="fa fa-user"></i></span>
                                <input type="text" name="fullName" placeholder="Full Name" tabindex="10" required>
                            </div>  -->
                            <div class="form-input">
                                <span><i class="fa fa-envelope"></i></span>
                                <input type="email" name="email" placeholder="Email Address" tabindex="10" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-lock"></i></span>
                                <input type="password" name="password" placeholder="Password" required>
                            </div>
                            <!-- Register Button -->
                            <div class="col-12 px-0 text-right">
                                <button type="submit" class="btn mb-3">Register</button>
                            </div>
                            <div class="text-center text-sm">or register with</div>
                            <div class="infinity-social-btn text-center">
                                <ul class="text-center">
                                    <!-- Google Button -->
                                    <li class="text-center"><a href="#" class="google">
                                            <i class="fa fa-google"></i><i class="fa fa-google"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="text-center">Already have an account?
                                <a class="login-link" href="login">Login here</a>
                            </div>
                        </form>

                        <p class ="text-danger">${error} </p>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
