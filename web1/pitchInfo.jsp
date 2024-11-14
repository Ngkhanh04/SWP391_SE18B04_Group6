<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tien Son Football Field - Booking</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet" />
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
                        <a class="nav-link" href="menu.jsp">List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="book.jsp">Book</a>
                    </li>
                </ul>
                <div class="user_option">
                    <form action="menu.jsp" class="form-inline" method="get">
                        <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                    <a href="menu.jsp" class="order_online">
                        Book a Field Online
                    </a>
                </div>
            </div>
        </nav>
    </div>
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

        .container-custom {
            width: 100%;
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

        .carousel-item img {
            object-fit: cover;
            height: 450px;
            width: 100%;
            border-radius: 10px;
        }

        .carousel-indicators li {
            background-color: #28a745;
        }


    </style>
</head>
<body>
    <div class="container mt-5">
        <h3>Select the date to book the field.</h3>
        <form action="BookingTimeServlet" method="get">
            <input type="hidden" name="pitchID" value="${pitchID}">
            <input type="date" name="date" required min="<%= LocalDate.now() %>" />
            <button type="submit" class="btn btn-primary mt-2">Check Available Times</button>
        </form>

        <c:if test="${not empty availableTimes}">
            <h4>Available times for ${pitchID}:</h4>
            <form action="BookingTimeServlet" method="post">
                <input type="hidden" name="pitchID" value="${pitchID}">
                <input type="hidden" name="date" value="${param.date}">

                <div class="list-group mt-3">
                    <c:forEach var="time" items="${availableTimes}">
                        <div class="list-group-item">
                            <input type="checkbox" name="selectedTimes" value="${time.bookingTimeID}" id="time-${time.bookingTimeID}">
                            <label for="time-${time.bookingTimeID}">${time.time}</label>
                        </div>
                    </c:forEach>
                </div>
                <button type="submit" class="btn btn-primary mt-2">Proceed to Payment</button>
            </form>

        </c:if>
    </div>
</body>
</html>
