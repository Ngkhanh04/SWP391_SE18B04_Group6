<%-- 
    Document   : DKghepcap
    Created on : Oct 19, 2024, 10:45:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Đăng ký ghép cặp sân bóng đá.">
    <meta name="keywords" content="đăng ký ghép cặp, sân bóng, bóng đá">
    <meta name="author" content="Admin">
    
    <!-- Title and Favicon -->
    <title>Đăng Ký Ghép Cặp - Tien Son Football Field</title>
    <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet" />
    
    <!-- Responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />

    <!-- Custom CSS for this page -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .btn-submit {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .form-error {
            color: red;
            font-size: 14px;
        }

        .form-section {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<!-- Header Section -->
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
                <a href="menu.jsp" class="order_online">Book a Field Online</a>
            </div>
        </div>
    </nav>
</div>

<!-- Main Content -->
<div class="container">
    <h2>Đăng Ký Ghép Cặp</h2>
    <form action="registerMatch" method="post" id="registerForm">
        <!-- Date selection -->
        <div class="form-group">
            <label for="date">Chọn Ngày:</label>
            <input type="date" class="form-control" id="date" name="matchDate" required>
            <div class="form-error" id="date-error"></div>
        </div>
        
        <!-- Time slot selection -->
        <div class="form-group">
            <label for="timeSlot">Chọn Khung Giờ:</label>
            <select class="form-control" id="timeSlot" name="timeSlot" required>
                <option value="" disabled selected>Chọn khung giờ</option>
                <option value="morning">Sáng (7:00 - 9:00)</option>
                <option value="afternoon">Chiều (16:00 - 18:00)</option>
                <option value="evening">Tối (19:00 - 21:00)</option>
            </select>
            <div class="form-error" id="timeslot-error"></div>
        </div>
        
        <!-- Submit button -->
        <button type="submit" class="btn-submit">Tìm Sân</button>
    </form>
</div>

<!-- Footer Section -->
<footer>
    <p>&copy; 2024 Tien Son Football Field. All rights reserved.</p>
</footer>

<!-- JavaScript validation -->
<script>
    document.getElementById("registerForm").addEventListener("submit", function(event) {
        let valid = true;
        let dateInput = document.getElementById("date");
        let timeSlotInput = document.getElementById("timeSlot");

        // Validate date input
        if (!dateInput.value) {
            document.getElementById("date-error").textContent = "Vui lòng chọn ngày.";
            valid = false;
        } else {
            document.getElementById("date-error").textContent = "";
        }

        // Validate time slot input
        if (!timeSlotInput.value) {
            document.getElementById("timeslot-error").textContent = "Vui lòng chọn khung giờ.";
            valid = false;
        } else {
            document.getElementById("timeslot-error").textContent = "";
        }

        // Prevent form submission if validation fails
        if (!valid) {
            event.preventDefault();
        }
    });
</script>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
