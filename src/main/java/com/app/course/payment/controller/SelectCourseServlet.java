package com.app.course.payment.controller;

import com.app.course.payment.util.CourseFeeUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Map;

@WebServlet("/home")
public class SelectCourseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Double> courseFees = CourseFeeUtil.loadCourseFees();

        request.setAttribute("courseFees", courseFees);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}

