package com.app.course.payment.controller;

import com.app.course.payment.util.CourseFeeUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/CalculateAmountServlet")
public class CalculateAmountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] selectedCourses = request.getParameterValues("courses");
        Map<String, Double> courseFees = CourseFeeUtil.loadCourseFees();

        double total = 0;
        List<String> courseList = new ArrayList<>();

        if (selectedCourses != null) {
            for (String course : selectedCourses) {
                courseList.add(course);
                total += courseFees.getOrDefault(course, 0.0);
            }
        }

        request.setAttribute("selectedCourses", courseList);
        request.setAttribute("totalAmount", total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentForm.jsp");
        dispatcher.forward(request, response);
    }
}
