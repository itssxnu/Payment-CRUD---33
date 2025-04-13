<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container my-5">
    <h2 class="text-center">Payment History</h2>
    <div class="list-group">
        <%
            List<String> list = (List<String>) request.getAttribute("paymentList");
            for (String record : list) {
                // Extract last 4 digits of the card
                String last4 = record.split("Card: \\*\\*\\*\\*")[1].split(",")[0].trim();
        %>
        <div class="list-group-item d-flex justify-content-between align-items-center">
            <%= record %>
            <form action="deletePayment" method="post" style="display:inline;">
                <input type="hidden" name="cardLast4" value="<%= last4 %>">
                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
            </form>
        </div>
        <% } %>
    </div>
    <div class="text-center mt-4">
        <a href="home" class="btn btn-secondary">Back to Home</a>
    </div>

</div>
</body>
</html>
