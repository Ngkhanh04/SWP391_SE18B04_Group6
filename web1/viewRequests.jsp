<%-- 
    Document   : viewRequests
    Created on : Nov 11, 2024, 10:14:11 AM
    Author     : hokha
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Available Team Requests">
        <meta name="keywords" content="team, football, request, pairing">
        <meta name="author" content="Admin">
        <title>Available Team Requests - Tien Son Football Field</title>
        <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- Custom Styles -->
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }

            .navbar {
                background: linear-gradient(135deg, #007bff, #00c6ff);
            }

            .navbar-brand {
                font-size: 1.8rem;
                font-weight: bold;
                color: white !important;
                transition: color 0.3s ease;
            }

            .navbar-brand:hover {
                color: #f8f9fa !important;
            }

            .nav-link {
                font-size: 1.1rem;
                color: white !important;
                margin-right: 20px;
                transition: color 0.3s ease, transform 0.3s ease;
            }

            .nav-link:hover {
                color: #f8f9fa !important;
                transform: scale(1.05);
            }

            .nav-item.active .nav-link {
                color: #ffd700 !important;  /* Gold color for active link */
                font-weight: bold;
            }

            .navbar-toggler-icon {
                background-color: white;
            }

            @media (max-width: 768px) {
                .navbar-nav {
                    text-align: center;
                    margin-top: 10px;
                }
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
                font-size: 2.5rem;
            }

            .request-card {
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                padding: 15px;
                margin-bottom: 15px;
                background-color: white;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .request-card:hover {
                transform: scale(1.02);
                box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
            }

            .table th, .table td {
                padding: 15px;
                text-align: center;
                border: 1px solid #ddd;
            }

            .btn-pair, .btn-cancel {
                background-color: #28a745;
                color: white;
                padding: 8px 18px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .btn-pair:hover {
                background-color: #218838;
                transform: scale(1.05);
            }

            .btn-cancel {
                background-color: #dc3545;
            }

            .btn-cancel:hover {
                background-color: #c82333;
                transform: scale(1.05);
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-error {
                color: red;
                font-size: 14px;
            }

            footer {
                background-color: #f1f1f1;
                padding: 20px 0;
                text-align: center;
                margin-top: 40px;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            footer p {
                color: #333;
            }

            footer:hover {
                background-color: #e9ecef;
            }

            .request-actions {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 15px;
            }

            .request-form {
                display: flex;
                align-items: center;
                gap: 10px; 
                background-color: #f9f9f9; 
                border-radius: 8px;
                padding: 10px 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 100%; 
                max-width: 600px;
            }

            .team-select {
                flex: 1;
                padding: 8px 12px;
                font-size: 1rem;
                border-radius: 5px;
                border: 1px solid #ddd;
            }

            .already-paired {
                font-size: 1rem;
                color: #6c757d;
                font-style: italic;
                margin-left: 20px;
            }

            .already-paired:hover {
                text-decoration: underline;
            }

            .section-title {
                font-family: 'Roboto', sans-serif;
                font-size: 2.5rem;
                font-weight: 700;
                text-align: center;
                color: #333;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                position: relative;
                padding: 20px 0;
                margin-bottom: 40px;
                background: linear-gradient(to right, #007bff, #00c6ff);
                color: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease-in-out;
            }

            .section-title:before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 60%;
                height: 4px;
                background-color: #ffd700;
                border-radius: 5px;
            }

            .section-title:hover {
                transform: scale(1.05);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            }
        </style>
    </head>

    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <a class="navbar-brand" href="index.jsp">
                <img src="images/logo1.png" alt="Tien Son Football Field Logo" style="height: 40px; width: auto;">
                Tien Son Football Field
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="team">Team List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="requestTeam">Request List</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container">
            <h2 class="section-title">Available Team Requests</h2>

            <div class="row">
                <c:forEach var="requestWithName" items="${availableRequests}">
                    <div class="col-md-12">
                        <div class="request-card">
                            <div class="row">
                                <div class="col-md-4">
                                    <h5>Request ID: ${requestWithName.requestTeam.requestTeamId}</h5>
                                    <p><strong>Booking Date:</strong> ${requestWithName.requestTeam.bookingDate}</p>
                                    <p><strong>Pitch ID:</strong> ${requestWithName.requestTeam.pitchId}</p>
                                    <p><strong>Team Request Name:</strong> ${requestWithName.teamName}</p>
                                </div>
                                <div class="col-md-8 request-actions">
                                    <c:if test="${requestWithName.requestTeam.teamMatchId == 1}">
                                        <form action="ViewRequests" method="POST" class="form-inline request-form">
                                            <input type="hidden" name="requestId" value="${requestWithName.requestTeam.requestTeamId}">
                                            <select name="userTeamId" class="form-control team-select" required>
                                                <c:forEach var="team" items="${userTeams}">
                                                    <option value="${team.teamId}">${team.teamName}</option>
                                                </c:forEach>
                                            </select>
                                            <button type="submit" class="btn btn-pair">Pair</button>
                                        </form>
                                    </c:if>

                                    <c:if test="${requestWithName.requestTeam.teamMatchId != 1}">
                                        <c:if test="${requestWithName.userId == sessionScope.currentUser.id}">
                                            <form action="ViewRequests" method="POST" class="form-inline request-form">
                                                <input type="hidden" name="requestId" value="${requestWithName.requestTeam.requestTeamId}">
                                                <input type="hidden" name="userTeamId" value="${requestWithName.requestTeam.teamMatchId}">
                                                <input type="hidden" name="cancel" value="true">
                                                <button type="submit" class="btn btn-cancel">Cancel Pairing</button>
                                            </form>
                                        </c:if>
                                        <span class="text-muted already-paired">Already Paired</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Footer Section -->
        <footer>
            <p>&copy; 2024 Tien Son Football Field. All rights reserved.</p>
        </footer>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>







