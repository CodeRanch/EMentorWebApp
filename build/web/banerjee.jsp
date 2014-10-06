<%-- 
    Document   : homepage
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor | About Author</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
        <link href="css/pagestyle.css" rel="stylesheet" type="text/css" />
        <style>
            .heading{
                font-weight: bold;
                font-color: black;
                font-size: large;
                text-align: right;
            }
            .content{
                font-family: Calibri, Verdana;
                font-color: magenta;
                font-size: large;
            }
        </style>
    </head>
    <body>
        <!-- header_wrapper begins -->
        <%@include file="WEB-INF\jspf\header.jspf" %>
        <!-- header_wrapper ends -->

        <!-- menu_wrapper begins -->
        <div id="menu_wrapper">
            <div id="menu">
                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="courses.jsp">View Courses</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li>
                        <% 
                            if(session.getAttribute("userId")==null){
                        %>
                        <a href="/EMentor/member/registration.jsp">Register</a>
                        <% }else{ %>
                        <a href="member/update.jsp">Update</a>
                        <% } %>
                    </li>
                    <li><% 
                            if(session.getAttribute("userId")==null){
                        %>
                        <a href="login.jsp">Login</a>
                        <% }else{ %>
                        <a href="member/resources.jsp">Resources</a>
                        <% } %>
                    </li>
                </ul>
            </div>
        </div>
        <!-- menu_wrapper begins -->

        <!-- content_wrapper begins -->
        <div id="content_wrapper">
            <div id="sidebar">
                <img src="images/banerjee.JPG" height="300" width="270" alt="Anurag Banerjee" />
                <div class="sidebar_box_bottom"></div>

            </div>
            <!-- end of sidebar -->
            <div id="content">
                <div class="content_box">
                    <h2>About website developer</h2>
                    
                    <div class="cleaner_h20"></div>
                        <div>
                            <span class="heading">Name:&nbsp;</span>
                            <span class="content">Anurag Banerjee</span><br/>
                            <span class="heading">Education:&nbsp;</span>
                            <span class="content">B.Tech (CSE) (pursuing)</span><br/>
                            <span class="heading">University:&nbsp;</span>
                            <span class="content">Graphic Era University</span><br/>
                            <span class="heading">Training:&nbsp;</span>
                            <span class="content">Unisoft Technologies (Mehuli Enterprises)</span>
                        </div>
                    <div class="cleaner"></div>
                </div>
                
                <div class="content_box_bottom"></div>
            </div>
            <!-- end of content -->
            <div class="cleaner"></div>
        </div>
        <!-- content_wrapper ends -->

        <!-- footer_wrapper begins -->
        <%@include file="WEB-INF\jspf\footer.jspf" %>
        <!-- footer_wrapper ends -->
    </body>
</html>
