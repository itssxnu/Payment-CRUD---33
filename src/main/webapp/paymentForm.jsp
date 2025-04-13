<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            max-width: 500px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            text-align: center;
            font-size: 1.5rem;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body class="bg-light">
<div class="container my-5">
    <!-- Payment Card -->
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3>Payment Details</h3>
        </div>
        <div class="card-body">
            <form action="makePayment" method="post">
                <!-- Name -->
                <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-control" id="name" required>
                </div>

                <!-- Card Number -->
                <div class="mb-3">
                    <label for="cardNumber" class="form-label">Card Number</label>
                    <input type="text" name="cardNumber" class="form-control" id="cardNumber" required
                           maxlength="16" placeholder="1234 5678 1234 5678">
                </div>

                <!-- Expiry Date -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="expiryDate" class="form-label">Expiry Date</label>
                        <input type="month" name="expiryDate" class="form-control" id="expiryDate" required>
                    </div>
                    <!-- CVV -->
                    <div class="col-md-6 mb-3">
                        <label for="cvv" class="form-label">CVV</label>
                        <input type="text" name="cvv" class="form-control" id="cvv" required
                               maxlength="3" placeholder="123">
                    </div>
                </div>

                <!-- Hidden fields for amount and courses -->
                <input type="hidden" name="amount" value="<%= request.getAttribute("totalAmount") %>">
                <%
                    List<String> selectedCourses = (List<String>) request.getAttribute("selectedCourses");
                    for (String course : selectedCourses) {
                %>
                <input type="hidden" name="courses" value="<%= course %>">
                <% } %>

                <!-- Total Amount -->
                <div class="mb-3 text-center">
                    <h5>Total Amount: ₹<%= request.getAttribute("totalAmount") %></h5>
                </div>

                <!-- Submit Button -->
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-custom btn-lg">Pay Now</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS (Optional for interactivity) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
