<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

    <head>
        <title>Login</title>
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
            <%--<div class="">
                    <img src="image/.jpg" width="150px"> <!-- logo phia tren --> 
            </div>
            --%>
            <!-- FORM CONTAINER BEGIN -->

            <div class="infinity-form-block">
                <div class="infinity-click-box text-center">Login into your account</div>

                <div class="infinity-fold">
                    <div class="infinity-form">
                        <form class="form-box" action="login" method="post">
                            <h5 style="color: red; margin-bottom: 20px">${error}</h5>
                            <h5 style="color: green; margin-bottom: 20px">${successMessage}</h5>
                            <!-- Input Box -->
                            <div class="form-input">
                                <span><i class="fa fa-envelope"></i></span>
                                <input type="email"  value="${cookie.email.value}" name="email" placeholder="Email Address" tabindex="10" required>
                            </div>
                            <div class="form-input">
                                <span><i class="fa fa-lock"></i></span>
                                <input type="password"  value="${cookie.password.value}" name="password" placeholder="Password" required>
                            </div>
                            <div class="row mb-2">
                                <!--Remember Checkbox -->
                                <div class="col-6 d-flex align-items-center">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" name="remember" id="cb1" ${cookie.remember != null ? 'checked' : ''} value="ON">
                                        <label class="custom-control-label text-sm" for="cb1">Remember me
                                        </label>
                                    </div>
                                </div>
                                <!-- Forget Password -->
                                <div class="col-6 text-right text-sm">
                                    <a href="forgotpassword" class="forget-link">Forgot password?</a>
                                </div>
                            </div>
                            <!-- Login Button -->
                            <div class="col-12 px-0 text-right">
                                <button type="submit" class="btn mb-3">Login</button>
                            </div>

                            <div class="text-center text-sm">or login with</div>
                            <div class="infinity-social-btn text-center">
                                <ul class="text-center">
                                    <li class="text-center">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/swp/loginbygoogle&response_type=code
                                           &client_id=935117260283-hus7u094c2hbjou2qidgjr0ra4q3gfbg.apps.googleusercontent.com&approval_prompt=force" class="google">
                                            <i class="fa fa-google"></i><i class="fa fa-google"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="text-center">Don't have an account?
                                <a class="register-link" href="register">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- FORM CONTAINER END -->
        </div>

    </body>

</html>
