<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        /* CSS for the update profile page */
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .back-button {
            background-color: #007BFF; /* Màu xanh cho nút quay l?i */
        }
        .back-button:hover {
            background-color: #0056b3; /* Màu xanh ??m h?n khi hover */
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Profile</h2>
    <form action="UpdateProfileServlet" method="post">
<!--        <div class="mb-3">
            <label class="small mb-1" for="inputId">User ID</label>
            <input class="form-control" id="inputId" type="text" 
                   value="${user.id}" readonly>
        </div>-->
        <div class="mb-3">
            <label class="small mb-1" for="inputEmail">Email Address</label>
            <input class="form-control" id="inputEmail" name="email" type="email" 
                   value="${user.email}" required>
        </div>
    <!--        <div class="mb-3">
                <label class="small mb-1" for="inputPassword">Password</label>
                <input class="form-control" id="inputPassword" name="password" type="password" 
                       placeholder="Enter new password" required>
            </div>        -->
        <div class="mb-3">
            <label class="small mb-1" for="inputPhone">Phone Number</label>
            <input class="form-control" id="inputPhone" name="phone" type="tel" 
                   value="${user.phoneNumber}" required>
        </div>
        <button class="btn btn-primary" type="submit">Save Changes</button>
    </form>
    <button class="back-button" onclick="window.location.href='index.jsp';">Back to Home</button> <!-- Nút quay l?i -->
</div> 

</body>
</html>