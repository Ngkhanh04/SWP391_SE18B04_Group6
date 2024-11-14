<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Team List - Tien Son Football Field">
    <meta name="keywords" content="team, football, list">
    <meta name="author" content="Admin">
    <title>Team List - Tien Son Football Field</title>

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

        .btn {
            padding: 8px 15px;
            font-size: 1rem;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
        }

        .btn-edit:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-create {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            font-size: 1.1rem;
            display: inline-block;
            margin-top: 20px;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn-create:hover {
            background-color: #218838;
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
                    <a class="nav-link" href="requestTeam" style="font-weight: 600;">Request List</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1>All Teams</h1>

        <table class="table">
            <thead>
                <tr>
                    <th>Team Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="team" items="${teams}">
                    <tr>
                        <td>${team.teamName}</td>
                        <td>
                            <button type="button" class="btn btn-edit" data-toggle="modal" data-target="#editTeamModal" data-team-id="${team.teamId}" data-team-name="${team.teamName}">Edit</button> |
                            <a href="team?action=delete&team_id=${team.teamId}" onclick="return confirm('Are you sure?')" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button type="button" class="btn btn-create" data-toggle="modal" data-target="#addTeamModal">Create New Team</button>
    </div>

    <!-- Add Team Modal -->
    <div class="modal fade" id="addTeamModal" tabindex="-1" role="dialog" aria-labelledby="addTeamModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTeamModalLabel">Create New Team</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="team" method="POST">
                        <input type="hidden" name="action" value="create">
                        <div class="form-group">
                            <label for="team_name">Team Name:</label>
                            <input type="text" class="form-control" id="team_name" name="team_name" required>
                        </div>
                        <div class="form-group">
                            <label for="user_id">User ID:</label>
                            <input type="text" class="form-control" id="user_id" name="user_id" required>
                        </div>
                        <button type="submit" class="btn btn-success">Create Team</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Team Modal -->
    <div class="modal fade" id="editTeamModal" tabindex="-1" role="dialog" aria-labelledby="editTeamModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTeamModalLabel">Edit Team</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="team" method="POST">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="team_id" id="edit_team_id">
                        <div class="form-group">
                            <label for="edit_team_name">Team Name:</label>
                            <input type="text" class="form-control" id="edit_team_name" name="team_name" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Team</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript to populate the Edit Modal with team data -->
    <script>
        $('#editTeamModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var teamId = button.data('team-id');
            var teamName = button.data('team-name');

            var modal = $(this);
            modal.find('#edit_team_id').val(teamId);
            modal.find('#edit_team_name').val(teamName);
        });
    </script>
</body>
</html>
