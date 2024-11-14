<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <style>
            #bag {
                text-align: right;
                margin-right: 30px;
                margin-top: 30px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function buy(id) {
                const quantity = $('input[name="num"]').val();
                $.ajax({
                    type: 'POST',
                    url: 'buy',
                    data: { id: id, num: quantity },
                    success: function(response) {
                        // Optionally update cart size or show a message
                        alert('Item added to cart!');
                    }
                });
            }
        </script>
    </head>
    <body>
        <c:set var="size" value="${sessionScope.size}"/>
        <p id="bag">
            <img src="purepng.com-shopping-cartshoppingcarttrolleycarriagebuggysupermarkets-1421526532323sy0um.png" width="50" height="50"/>
            <a href="MyCart.jsp">MyCart (${size}) items</a>
        </p>
        <h1>The list Product</h1>
        <form name="f" action="" method="post">
            Enter the number of items to buy:
            <input type="number" name="num" value="1"/>
            <hr/>
            <table border="1px" width="40%">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
                <jsp:useBean id="db" class="dal.ProductDao"/>
                <c:forEach items="${db.allProdcut}" var="p">
                <tr>
                    <td>${p.product_id}</td>
                    <td>${p.product_name}</td>
                    <td>${p.quantity}</td>
                    <td><img src="${p.product_image}" alt="${p.product_name}" width="50"/></td>
                    <td>
                        <button type="button" onclick="buy('${p.product_id}')">Buy item</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>