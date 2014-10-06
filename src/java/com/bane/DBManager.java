package com.bane;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBManager {

    static final String DBDriver = "com.mysql.jdbc.Driver";
    static final String DBUrl = "jdbc:mysql://localhost/ementor";
    static final String DBUser = "root";
    static final String DBPass = "root";

    static {
        try {
            Class.forName(DBDriver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static int authenticateUser(String uname , String passwd){
        int userId = -1;
        
        try {
            Connection con = DriverManager.getConnection(DBUrl , DBUser , DBPass);
            PreparedStatement st = con.prepareStatement("SELECT userId FROM logintable WHERE UNAME=? AND PASSWD=?");
            st.setString(1, uname);
            st.setString(2, passwd);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                userId = rs.getInt(1);
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.OFF, "no connection");
        }
        
        return userId;
    }
    
    public static String getUname(int userId){
        String uname = null;
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT uname FROM logintable WHERE userId=?");
            st.setInt(1,userId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                uname = rs.getString(1);
            }
            rs.close();
            st.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uname;
    }
    
    public static String getRole(int userId){
        String role = null;
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT role FROM loginTable WHERE userId=?");
            st.setInt(1,userId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                role = rs.getString(1);
            }
            rs.close();
            st.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
    }
    
    public static Member getMemberInfo(int userId){
        Member member = new Member();
        try{
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT * FROM userinfo WHERE userId=?");
            st.setInt(1,userId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                member.setName(rs.getString(2));
                member.setEmail(rs.getString(3));
                member.setMobileNumber(rs.getString(4));
                member.setPhoto(rs.getString(5));
                member.setCollege(rs.getString(6));
            }
            rs.close();
            st.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return member;
    }
    public static ArrayList<StudentCourseClass> getMemberCourseList(int userId){
        ArrayList<StudentCourseClass> list = new ArrayList<StudentCourseClass>();
        try{
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT * FROM studentcourse where userId=?");
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                StudentCourseClass c = new StudentCourseClass();
                c.setUserId(rs.getInt(1));
                c.setCourseId(rs.getInt(2));
                c.setPayment(rs.getString(3));
                list.add(c);
            }
            rs.close();
            st.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
                
    public static boolean addUser(RegistrationFormBean rfb,String photoFileName){
        boolean flag = false;
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("INSERT INTO logintable VALUES(?,?,?,?)");
            st.setString(1,null);
            st.setString(2, rfb.getUname());
            st.setString(3, rfb.getPasswd());
            st.setString(4, "user");
            
            st.executeUpdate();
            st.close();
            con.close();
            
            int userId = DBManager.authenticateUser(rfb.getUname(), rfb.getPasswd());
            con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            st = con.prepareStatement("INSERT INTO userinfo VALUES(?,?,?,?,?,?)");
            st.setInt(1, userId);
            String name = toNameCase(rfb.getName());
            st.setString(2,name);
            st.setString(3,rfb.getEmail());
            st.setString(4,rfb.getMobileNumber());
            st.setString(5,photoFileName);
            st.setString(6,rfb.getCollege()); 
            st.executeUpdate();
            st.close();
            con.close();
            
            con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            st = con.prepareStatement("INSERT INTO studentcourse VALUES(?,?,?)");
            st.setInt(1, userId);
            st.setInt(2, Integer.parseInt(rfb.getCourseId()));
            st.setString(3,"pending");
                        
            st.executeUpdate();
            st.close();
            
            con.close();
            flag = true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return flag;
    }
    
    public static boolean updateUser(int userId , UpdateFormBean ufb , String photoFileName){
        boolean flag = false;
        try {
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("UPDATE logintable SET passwd=? WHERE userId=?");
            st.setString(1,ufb.getPasswd());
            st.setInt(2,userId);
            
            st.executeUpdate();
            st.close();
            con.close();
            
            con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            st = con.prepareStatement("UPDATE userinfo SET email=? , mobileNumber=? , photo=? , college=? WHERE userId=?");
            st.setString(1, ufb.getEmail());
            st.setString(2,ufb.getMobileNumber());
            st.setString(3,photoFileName);
            st.setString(4,ufb.getCollege());
            st.setInt(5,userId);
            st.executeUpdate();
            st.close();
            con.close();
            
            con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            
            if(Integer.parseInt(ufb.getCourseId()) != 0){
                st = con.prepareStatement("INSERT INTO studentcourse VALUES(?,?,?)");
                st.setInt(1, userId);
                st.setInt(2, Integer.parseInt(ufb.getCourseId()));
                st.setString(3,"pending");
                st.executeUpdate();
                st.close();
            }
            con.close();
            flag = true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return flag;
    }
    
    public static ArrayList getAllCourseList(){
        ArrayList list = new ArrayList();
        try{
            Courses c=null;
            Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPass);
            PreparedStatement st = con.prepareStatement("SELECT * FROM courses");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                c = new Courses();
                c.setCourseId(rs.getInt(1));
                c.setCoursename(rs.getString(2));
                list.add(c);
            }
            rs.close();
            st.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static boolean doesUnameExist(String uname){
        boolean flag = false;
        try {
            Connection con = DriverManager.getConnection(DBUrl , DBUser , DBPass);
            PreparedStatement st = con.prepareStatement("SELECT * FROM logintable WHERE uname=?");
            st.setString(1, uname);
            
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                flag=true;
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.OFF, "no connection");
        }
        return flag;
    }
    public static String toNameCase(String name){
        StringTokenizer stok = new StringTokenizer(name, " ");
        name="";
        
        while(stok.hasMoreTokens()){
            String token = stok.nextToken();
            token = Character.toUpperCase(token.charAt(0)) + token.substring(1);
            name = name + " " + token;
        }
        return name.trim();
    }
    public static String getCoursename(int courseId){
        String coursename = null;
        try {
            Connection con = DriverManager.getConnection(DBUrl , DBUser , DBPass);
            PreparedStatement st = con.prepareStatement("SELECT coursename FROM courses WHERE courseId=?");
            st.setInt(1, courseId);
            
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                coursename = rs.getString(1);
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.OFF, "no connection");
        }
        return coursename;
    }
}
