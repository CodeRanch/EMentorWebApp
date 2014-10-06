package com.bane;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDBManager {
    
    private final static String DBDriver = "com.mysql.jdbc.Driver";
    private final static String DBUrl = "jdbc:mysql://localhost/ementor";
    private final static String DBUser = "root";
    private final static String DBPass = "root";
    
    static{
        try {
            Class.forName(DBDriver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static boolean updateAdmin(int userId , AdminUpdateBean aub , String photoFileName){
        boolean status = false;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPass);
            
            PreparedStatement st = con.prepareStatement("UPDATE logintable SET passwd=? WHERE userId=?");
            st.setString(1, aub.getPasswd());
            st.setInt(2, userId);
            st.executeUpdate();
            st.close();
            
            st = con.prepareStatement("UPDATE userinfo SET email=? , mobileNumber=? , photo=? , college=? WHERE userId=?");
            st.setString(1, aub.getEmail());
            st.setString(2, aub.getMobileNumber());
            st.setString(3, photoFileName);
            st.setString(4, aub.getCollege());
            st.setInt(5, userId);
            st.executeUpdate();
            st.close();
            
            con.close();
            status = true;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return status;
    }
    public static ArrayList getCourseWiseUsers(int courseId){
        ArrayList list = new ArrayList();
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT userId FROM studentcourse WHERE courseId=?");
            st.setInt(1,courseId);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                list.add(rs.getInt(1));
            }
            
            rs.close();
            st.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static boolean getPaymentStatus(int userId , int courseId){
        boolean flag = false;
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT payment FROM studentcourse WHERE userId=? AND courseId=?");
            st.setInt(1,userId);
            st.setInt(2, courseId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                if(rs.getString(1).equals("done")){
                    flag = true;
                }
            }
            rs.close();
            st.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
    public static boolean setPaymentDone(int userId , int courseId){
        boolean status = false;
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("UPDATE studentcourse SET payment=? WHERE userId=? AND courseId=?");
            st.setString(1, "done");
            st.setInt(2, userId);
            st.setInt(3, courseId);
            st.execute();
            st.close();
            con.close();
            status = true;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }
}