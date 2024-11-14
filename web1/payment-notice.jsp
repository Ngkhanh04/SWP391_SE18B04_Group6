<%-- 
    Document   : ReturnVnPay
    Created on : Nov 9, 2024, 3:10:09 PM
    Author     : hokha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Status</title>
        <!-- Include Bootstrap for styling -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <c:if test="${paymentStatus.equals('success')}">
                        <div class="alert alert-success">
                            <h4 class="alert-heading">Payment Successful!</h4>
                            <p>Your payment has been processed successfully. Thank you for your purchase!</p>
                            <hr>
                            <p class="mb-0">You can view your booking details or continue browsing.</p>
                        </div>

                        <!-- Only show 'View My Bookings' if the payment was successful -->
                        <a href="viewBookings.jsp" class="btn btn-success">View My Bookings</a>

                    </c:if>
                    <c:if test="${paymentStatus.equals('failure')}">
                        <div class="alert alert-danger">
                            <h4 class="alert-heading">Payment Failed!</h4>
                            <p>Unfortunately, there was a problem processing your payment. Please try again later.</p>
                            <hr>
                            <p class="mb-0">If the problem persists, contact customer support.</p>
                        </div>

                        <!-- Only show 'Retry Payment' if the payment failed -->
                        <a href="retryPayment.jsp" class="btn btn-warning">Retry Payment</a>


                    </c:if>
                    <!-- Go to Home button (common for both success and failure) -->
                    <div class="mt-4">
                        <a href="index.jsp" class="btn btn-primary">Go to Home</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

