<%-- 
    Document   : homepage
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
        <link href="css/pagestyle.css" rel="stylesheet" type="text/css" />
        <%-- for slider --%>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <%-- for slider --%>
        <style>
            .sidebar_box a, a:visited, a:hover{
                color: #599fcf;
                text-decoration: none;
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
                    <li><a href="homepage.jsp" class="current">Home</a></li>
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
                <div class="sidebar_box">
                    <%@include file="WEB-INF\jspf\slideshow.jspf" %>
                </div>
                <div class="sidebar_box_bottom"></div>

            </div>
            <!-- end of sidebar -->
            <div id="content">
                <div class="content_box">
                    <h2>Welcome to E-Mentor</h2>
                    <p> Here you can download the additional resources regarding your training in various technologies taught at <a href="www.unisoftdehradun.com">Unisoft Technologies</a>, Dehradun. You can have an overview of various courses taught and also download various assignments. Enjoy!!</p>
                    <div class="cleaner_h20"></div>
                    <div class="image_fl"> <img src="images/ut.jpg" alt="Unisoft Technologies" /> </div>
                    <div class="section_w250 float_r" style="font-size:15px;color: sienna;">
                        Get the best training in town. And get the best online backup for your studies.
                        E-Mentor is your one stop for all the resources. 
                        <a href="login.jsp">Login</a> to your account or <a href="register.jsp">create</a> one and get started.
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

