<%-- 
    Document   : requestTeamList
    Created on : Nov 10, 2024, 11:29:22 PM
    Author     : hokha
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Request Team List - Tien Son Football Field">
    <meta name="keywords" content="request, team, list">
    <meta name="author" content="Admin">
    <title>Request Team List - Tien Son Football Field</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #007bff;
            padding: 10px 20px;
        }

        .navbar-brand {
            font-size: 1.8rem;
            color: white;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            margin-right: 20px;
        }

        .navbar-nav .nav-link:hover {
            color: #ffd700;
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

        h1 {
            font-size: 2.5rem;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        .btn {
            padding: 8px 15px;
            font-size: 1rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .btn-create {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            font-size: 1.1rem;
            margin-bottom: 20px;
        }

        .btn-create:hover {
            background-color: #218838;
        }

        .table {
            width: 100%;
            margin-bottom: 30px;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            background-color: #f9f9f9;
        }

        .table tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .form-inline {
            display: inline-block;
        }

        .form-inline .btn {
            margin-left: 10px;
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
                    <a class="nav-link" href="ViewRequests" style="font-weight: 600;">Match Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="team" style="font-weight: 600;">Team List</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="container">
        <h1>Request Teams</h1>

        <!-- Button to Trigger Create Modal -->
        <button class="btn btn-create" data-toggle="modal" data-target="#addRequestModal">Create New Request</button>

        <!-- Request Teams Table -->
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Request Team ID</th>
                    <th>Status</th>
                    <th>Booking Date</th>
                    <th>Pitch ID</th>
                    <th>Team Request ID</th>
                    <th>Team Match ID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="request" items="${requests}">
                    <tr>
                        <td>${request.requestTeamId}</td>
                        <td>${request.status}</td>
                        <td>${request.bookingDate}</td>
                        <td>${request.pitchId}</td>
                        <td>${request.teamRequestId}</td>
                        <td>
                            <c:if test="${request.teamMatchId != 1}">
                                ${request.teamMatchId}
                            </c:if>
                        </td>
                        <td>
                            <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#editRequestModal" data-request-id="${request.requestTeamId}" data-status="${request.status}" data-booking-date="${request.bookingDate}" data-pitch-id="${request.pitchId}" data-team-request-id="${request.teamRequestId}">Edit</button>
                            <form action="requestTeam" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="request_team_id" value="${request.requestTeamId}">
                                <input type="submit" value="Delete" class="btn btn-danger btn-sm">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Add Request Modal -->
    <div class="modal fade" id="addRequestModal" tabindex="-1" role="dialog" aria-labelledby="addRequestModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="requestTeam" method="POST">
                    <input type="hidden" name="action" value="create">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addRequestModalLabel">Create New Request Team</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="bookingDate">Booking Date</label>
                            <input type="date" class="form-control" id="bookingDate" name="booking_date" required>
                        </div>
                        <div class="form-group">
                            <label for="pitchId">Pitch ID</label>
                            <select class="form-control" name="pitch_id" required>
                                <c:forEach var="pitch" items="${pitchs}">
                                    <option value="${pitch.pitchID}">${pitch.pitchID}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="teamRequestId">Team Request ID</label>
                            <select class="form-control" name="team_request_id" required>
                                <c:forEach var="team" items="${teamsUser}">
                                    <option value="${team.teamId}">${team.teamName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Create Request</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Request Modal -->
    <div class="modal fade" id="editRequestModal" tabindex="-1" role="dialog" aria-labelledby="editRequestModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="requestTeam" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="request_team_id" id="editRequestId">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editRequestModalLabel">Edit Request Team</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="editStatus">Status</label>
                            <input type="text" class="form-control" id="editStatus" name="status" required>
                        </div>
                        <div class="form-group">
                            <label for="editBookingDate">Booking Date</label>
                            <input type="date" class="form-control" id="editBookingDate" name="booking_date" required>
                        </div>
                        <div class="form-group">
                            <label for="editPitchId">Pitch ID</label>
                            <input type="text" class="form-control" id="editPitchId" name="pitch_id" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Request</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // JavaScript to pre-fill the Edit Modal with data
        $('#editRequestModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var requestId = button.data('request-id');
            var status = button.data('status');
            var bookingDate = button.data('booking-date');
            var pitchId = button.data('pitch-id');
            var teamRequestId = button.data('team-request-id');

            // Set values to the modal input fields
            var modal = $(this);
            modal.find('#editRequestId').val(requestId);
            modal.find('#editStatus').val(status);
            modal.find('#editBookingDate').val(bookingDate);
            modal.find('#editPitchId').val(pitchId);
        });
    </script>

</body>
</html>


