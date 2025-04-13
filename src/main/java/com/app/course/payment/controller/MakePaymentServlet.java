package com.app.course.payment.controller;

import com.app.course.payment.model.Payment;
import com.app.course.payment.util.PaymentUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/makePayment")
public class MakePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String cardNumber = request.getParameter("cardNumber");
        String[] courseArr = request.getParameterValues("courses");
        double amount = Double.parseDouble(request.getParameter("amount"));

        List<String> courses = Arrays.asList(courseArr);

        Payment payment = new Payment(name, courses, amount, cardNumber, "Completed");
        PaymentUtil.savePayment(payment);

        request.setAttribute("name", name);
        request.setAttribute("amount", amount);

        request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
    }
}
