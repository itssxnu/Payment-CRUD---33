package com.app.course.payment.util;

import java.io.*;
import java.util.*;

public class CourseFeeUtil {

    private static final String FILE_PATH = "E:\\Y1S2\\OOP\\Payment\\src\\main\\webapp\\txt\\course_fees.txt";

    public static Map<String, Double> loadCourseFees() {
        Map<String, Double> courseFees = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("=");
                if (parts.length == 2) {
                    courseFees.put(parts[0], Double.parseDouble(parts[1]));
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courseFees;
    }
}

