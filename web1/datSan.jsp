<%-- 
    Document   : datSan
    Created on : Oct 13, 2024, 12:20:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
    // Thông tin sân bóng từ database hoặc servlet
    String fieldName = "Sân bóng ABC"; 
    String openTime = "06:00";
    String closeTime = "22:00";
    String services = "Wifi miễn phí, Đèn chiếu sáng, Phòng thay đồ, Nước uống miễn phí";
    String location = "123 Đường ABC, Quận 1, TP.HCM";
    double price = 300000; // Giá thuê sân theo giờ

    // Lấy ngày hiện tại
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date today = new Date();
    
    // Tạo danh sách các ngày tiếp theo để người dùng chọn
    List<String> availableDays = new ArrayList<>();
    Calendar cal = Calendar.getInstance();
    for (int i = 0; i < 7; i++) { // Từ hôm nay đến 7 ngày tới
        availableDays.add(sdf.format(cal.getTime()));
        cal.add(Calendar.DATE, 1);
    }

    // Tạo danh sách các khung giờ để người dùng chọn
    String[] timeSlots = {"06:00-07:00", "07:00-08:00", "08:00-09:00", "09:00-10:00", 
                          "10:00-11:00", "11:00-12:00", "13:00-14:00", "14:00-15:00", 
                          "15:00-16:00", "16:00-17:00", "17:00-18:00", "18:00-19:00", 
                          "19:00-20:00", "20:00-21:00", "21:00-22:00"};
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Đặt sân bóng đá trực tuyến tại Sân Bóng ABC với nhiều dịch vụ tiện ích, wifi miễn phí, và giờ mở cửa linh hoạt. Đặt sân nhanh chóng và dễ dàng.">
    <meta name="keywords" content="sân bóng đá, đặt sân online, TPHCM, sân mini, đặt sân trực tuyến">
    <meta name="author" content="Admin">
    
    <!-- Title and Favicon -->
    <title>Tien Son Football Field
</title>
    <link rel="shortcut icon" href="images/5f32846ad37b4e9a20fb3bcd085bc0d8.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    
    <!-- Font Awesome for icons -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet" />
    
    <!-- Responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />

    <!-- Custom CSS for this page -->
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

        .field-info {
            text-align: center;
            margin-bottom: 30px;
        }

        .field-info p {
            font-size: 18px;
            color: #666;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        label {
            flex-basis: 30%;
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }

        select, button {
            flex-basis: 65%;
            padding: 15px;
            font-size: 18px;
            border-radius: 8px;
            border: 1px solid #ddd;
            outline: none;
            transition: all 0.3s;
        }

        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
        }

        button:hover {
            background-color: #218838;
        }

        .booking-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        footer {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }

        @media (max-width: 768px) {
            .form-group {
                flex-direction: column;
            }

            label, select, button {
                flex-basis: 100%;
            }

            label {
                margin-bottom: 10px;
            }
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

<!-- Booking Form Section -->
<div class="container">
    <h2>Field Information: <%= fieldName %></h2>
    
    <img src="images/san1.jpg" class="booking-image" alt="Football Field Image">

    <div class="field-info">
        <p>Giá thuê: <%= price %> VND/giờ</p>
        <p>Địa chỉ: <%= location %></p>
        <p>Giờ mở cửa: <%= openTime %></p>
        <p>Giờ đóng cửa: <%= closeTime %></p>
        <p>Dịch vụ: <%= services %></p>
    </div>

    <form action="bookFieldServlet" method="post">
        <!-- Chọn ngày -->
        <div class="form-group">
            <label for="date">Chọn ngày đặt sân:</label>
            <select name="date" id="date">
                <%
                    for (String day : availableDays) {
                        out.println("<option value='" + day + "'>" + day + "</option>");
                    }
                %>
            </select>
        </div>

        <!-- Chọn khung giờ -->
        <div class="form-group">
            <label for="timeSlot">Chọn khung giờ:</label>
            <select name="timeSlot" id="timeSlot">
                <%
                    for (String slot : timeSlots) {
                        out.println("<option value='" + slot + "'>" + slot + "</option>");
                    }
                %>
            </select>
        </div>

        <!-- Submit button -->
        <div class="form-group">
            <button type="submit">Đặt sân ngay</button>
        </div>
    </form>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 </p>
</footer>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
