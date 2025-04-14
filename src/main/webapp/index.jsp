<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Map" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container my-5">
    <h2 class="text-center mb-4">Select Courses</h2>
    <form action="CalculateAmountServlet" method="post" class="border p-4 bg-white rounded shadow-sm">

        <%
            Map<String, Double> courseFees = (Map<String, Double>) request.getAttribute("courseFees");
            if (courseFees != null && !courseFees.isEmpty()) {
                for (Map.Entry<String, Double> entry : courseFees.entrySet()) {
        %>
        <%
            Double total = entry.getValue();
        %>
        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" name="courses" value="<%= entry.getKey() %>" id="<%= entry.getKey() %>">
            <label class="form-check-label" for="<%= entry.getKey() %>">
                <%= entry.getKey() %> - <%= String.format("%.2f", total) %> LKR
            </label>
        </div>
        <%
            }
        } else {
        %>
        <div class="alert alert-warning">No courses found.</div>
        <%
            }
        %>

        <div class="text-center mt-4">
            <input type="submit" value="Calculate Total & Proceed" class="btn btn-primary btn-lg">
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="viewPayments" class="btn btn-outline-secondary btn-sm">View Payment History</a>
    </div>
</div>
</body>
</html>
