<%-- 
    Document   : PitchList
    Created on : Nov 9, 2024, 1:52:28 PM
    Author     : hokha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pitch List</title>
    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>

    
    <!-- Include Bootstrap JS and Font Awesome for icons -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
    <style>
        .action-icons a {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mb-4">Pitch List</h1>
                <!-- Search bar -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <form action="CRUDPitchServlet" method="get">
                            <input type="hidden" name="action" value="list">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Search...">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="submit">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6 text-right">
                        <a href="CRUDPitchServlet?action=new" class="btn btn-success">
                            <i class="fas fa-plus"></i> Add New Pitch
                        </a>
                    </div>
                </div>
                <!-- Pitch table -->
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col"><input type="checkbox"></th>
                            <th scope="col">ID</th>
                            <th scope="col">Type</th>
                            <th scope="col">Image</th>
                            <th scope="col">Price</th>
                            <th scope="col">Status</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pitch" items="${pitchList}">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>${pitch.pitchID}</td>
                                <td>${pitch.pitchType}</td>
                                <td>
                                    <img src="${pitch.image}" alt="Pitch Image" width="100" height="100">
                                </td>
                                <td>${pitch.pricePitch}</td>
                                <td>${pitch.status}</td>
                                <td class="action-icons">
                                    <a href="CRUDPitchServlet?action=edit&pitchID=${pitch.pitchID}" class="text-primary">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="CRUDPitchServlet?action=delete&pitchID=${pitch.pitchID}" 
                                        class="text-danger" onclick="return confirm('Are you sure you want to delete this pitch?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Pagination -->
                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="CRUDPitchServlet?action=list&page=${page-1}" 
                               <c:if test="${page == 1}">class="disabled"</c:if>>Previous</a>
                        </li>
                        <c:forEach var="i" begin="1" end="${noOfPages}">
                            <li class="page-item <c:if test="${i == page}">active</c:if>">
                                <a class="page-link" href="CRUDPitchServlet?action=list&page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="PitchController?action=list&page=${page+1}" 
                               <c:if test="${page == noOfPages}">class="disabled"</c:if>>Next</a>
                        </li>
                    </ul>
                </nav>
                <a href="home.jsp" class="btn btn-primary">Back to home</a>
            </div>
        </div>
    </div>

    
</body>
</html>


