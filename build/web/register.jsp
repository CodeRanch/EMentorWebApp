<%-- 
    Document   : login
    Created on : Aug 4, 2013, 4:36:48 PM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor | Register</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
        <link href="css/pagestyle.css" rel="stylesheet" type="text/css" />
        <link href="css/loginform.css" rel="stylesheet" type="text/css" />
        <%-- for slider --%>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <%-- for slider --%>
        
        <style>
            legend{
                font-size: large;
                color: #E2A272;
            }
            fieldset{
                border: none;
            }
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
        <%
            if(session.getAttribute("userId")!=null){
                response.sendRedirect("member\\update.jsp");
            }
        %>
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
                        <a href="/EMentor/member/registration.jsp" class="current">Register</a>
                        <% }else{ %>
                        <a href="member/update.jsp" class="current">Update</a>
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
            <div id="content">
                <div class="content_box">
                    <h2>Registration Form</h2>
                    <div class="cleaner_h20"></div>
                    <div id="form_look">
                        <form method="post" action="register">
                            <fieldset>
                                <legend>
                                    Account Information
                                </legend>
                                <input type="text" name="uname" placeholder="Enter desired username" />
                                <input type="password" name="passwd" placeholder="Enter desired password" />
                                <input type="password" name="passwd2" placeholder="Confirm your password" />
                            </fieldset>
                            <fieldset>
                                <legend>
                                    User Information
                                </legend>
                                <input type="text" name="name" placeholder="Enter your full name" />
                                <input type="email" name="email" placeholder="Enter your email ID" />
                                <input type="text" name="mobileNumber" placeholder="Enter your mobile number" />
                                <input type="text" name="college" placeholder="Enter your college/university name" />
                            </fieldset>
                            <input type="hidden" name="action" value="register" />
                            <input id="submit" type="submit" value="Submit" />
                            <input id="reset" type="reset" value="Reset form" />
                        </form>
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