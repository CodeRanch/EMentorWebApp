package com.bane;

/**
 *
 * @author Anurag
 */
public class StudentCourseClass {
    private int userId;
    private int courseId;
    private String payment;

    public StudentCourseClass() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }
}
