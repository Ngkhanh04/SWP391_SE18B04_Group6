<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Sân Bóng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .back-btn {
            position: absolute;
            top: 10px;
            left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="javascript:history.back()" class="btn btn-secondary back-btn">Quay lại</a>
        
        <h1 class="mt-4 mb-4">Cập Nhật Sân Bóng</h1>
        
        <form action="editproduct" method="post">
             <div class="form-group">
                <label for="name">ID</label>
                <input type="text" class="form-control" id="id" name="Id" value="${detail.product_id}" readonly required>
            </div>

            <div class="form-group">
                <label for="name">Tên Sân Bóng:</label>
                <input type="text" class="form-control" id="name" name="Name" value="${detail.product_name}" required>
            </div>
            <div class="form-group">
                <label for="image">Link Ảnh:</label>
                <input type="text" class="form-control" id="image" name="Image" value="${detail.product_image}" required>
            </div>
            <div class="form-group">
                <label for="price">So Luong:</label>
                <input type="number" class="form-control" id="price" name="Quantity" value="${detail.quantity}" required>
            </div>
            <div class="form-group">
                <label for="price">Giá:</label>
                <input type="number" class="form-control" id="price" name="Price" value="${detail.product_price}" required>
            </div>
            <div class="form-group">
                <label for="title">Tiêu Đề:</label>
                <input type="text" class="form-control" id="title" name="Title" value="${detail.product_title}" required>
            </div>
            <div class="form-group">
                <label for="detail">Chi Tiết:</label>
                <textarea class="form-control" id="detail" name="Detail" rows="3" required>${detail.product_detail}</textarea>
            </div>
            <div class="form-group">
                <label for="caste_id">ID Caste:</label>
                <select class="form-control" id="caste_id" name="Category" required>
                    <c:forEach items="${listC}" var="o">
                         <option value="${o.cid}">${o.cname}</option>
                    </c:forEach>
                   
                    
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Cập Nhật Sân Bóng</button>
        </form>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>