<!DOCTYPE html>
<html>
    <head>
        <title>Forget Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="stylee.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="infinity-container">
            <div class="logo">
                <%--<img src="image/logo.jpg" width="150px">--%>
            </div>
            <div class="infinity-form-block">
                <div class="infinity-click-box text-center">Reset Your password</div>

                <div class="infinity-fold">
                    <div class="infinity-form">
                        <div class="reset-form d-block">
                            <!-- Th�m action v� method v�o form -->
                            <form class="reset-password-form px-3" action="forgotpassword" method="get">
                                <p class="mb-3" style="color: #777">
                                    Please enter your email address and we will send you a password reset link.
                                </p>
                                <p class="mb-3" style="color: red">
                                    ${errorEmail}
                                </p>
                                <div class="form-input">
                                    <span><i class="fa fa-envelope"></i></span>

                                    <input type="email"
                                           name="email" value="${email}"
                                           placeholder="name@example.com" 
                                           tabindex="10" required>
                                </div>

                                <div class="col-12 mb-3 text-right"> 
                                    <button type="submit" class="btn">Send Reset Link</button>
                                </div>
                            </form> 
                        </div>
                        <div class="reset-confirmation d-none px-3">
                            <div class="mb-4">
                                <h4 class="mb-3">Link was sent</h4>
                                <h6 style="color: #777">Please, check your inbox for a password reset link.</h6>
                            </div>
                            <div class="text-right">
                                <a href="login.jsp">
                                    <button type="submit" class="btn">Login Now</button>
                                </a>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>

        <!--	<script type="text/javascript">
                        function PasswordReset() {
                                $('form.reset-password-form').on('submit', function(e){
                                        e.preventDefault();
                                        $('.reset-form')
                                        .removeClass('d-block')
                                        .addClass('d-none');
                                        $('.reset-confirmation').addClass('d-block');
                                });
                        }
        
                        window.addEventListener('load',function(){
                                PasswordReset();
                        });
                </script>-->

    </body>
</html>
