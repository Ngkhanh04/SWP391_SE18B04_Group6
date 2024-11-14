<%-- 
    Document   : pitch-form
    Created on : Nov 9, 2024, 1:53:04 PM
    Author     : hokha
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pitch != null ? "Edit Pitch" : "Add New Pitch"}</title>
    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">${pitch != null ? "Edit Pitch" : "Add New Pitch"}</h1>

        <form action="CRUDPitchServlet?action=${pitch != null ? 'update' : 'insert'}" method="post">
            <!-- Hidden field for pitchID if updating -->
            <c:if test="${pitch != null}">
                <input type="hidden" name="pitchID" value="${pitch.pitchID}" />
            </c:if>

            <div class="form-group">
                <label for="pitchType">Pitch Type:</label>
                <input type="text" class="form-control" id="pitchType" name="pitchType" 
                       value="${pitch != null ? pitch.pitchType : ''}" required>
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" class="form-control" id="status" name="status" 
                       value="${pitch != null ? pitch.status : ''}" required>
            </div>

            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" class="form-control" id="image" name="image" 
                       value="${pitch != null ? pitch.image : ''}" required>
            </div>

            <div class="form-group">
                <label for="pricePitch">Price:</label>
                <input type="text" class="form-control" id="pricePitch" name="pricePitch" 
                       value="${pitch != null ? pitch.pricePitch : ''}" required>
            </div>

            <button type="submit" class="btn btn-primary">${pitch != null ? 'Update Pitch' : 'Add Pitch'}</button>
            <a href="CRUDPitchServlet?action=list" class="btn btn-secondary">Back to Pitch List</a>
        </form>

        <!-- Optional Pagination Section (if needed) -->
        <c:if test="${noOfPages > 1}">
            <nav class="mt-4">
                <ul class="pagination justify-content-center">
                    <c:forEach var="i" begin="1" end="${noOfPages}">
                        <li class="page-item <c:if test='${i == page}'>active</c:if>'">
                            <a class="page-link" href="PitchController?action=list&page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
