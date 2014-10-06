<%-- 
    Document   : login
    Created on : Aug 4, 2013, 4:36:48 PM
    Author     : Anurag
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor | Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
        <link href="css/pagestyle.css" rel="stylesheet" type="text/css" />
        <link href="css/loginform.css" rel="stylesheet" type="text/css" />
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
        <%
            if(session.getAttribute("userId")!=null){
                int userId = (Integer)session.getAttribute("userId");
                if(DBManager.getRole(userId).equals("admin")){
                    session.setAttribute("userId", null);
                    response.sendRedirect("homepage.jsp");
                }else{
                    response.sendRedirect("resources.jsp");
                }
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
                        <a href="/EMentor/member/registration.jsp">Register</a>
                        <% }else{ %>
                        <a href="member/update.jsp">Update</a>
                        <% } %>
                    </li>
                    <li><% 
                            if(session.getAttribute("userId")==null){
                        %>
                        <a href="login.jsp" class="current">Login</a>
                        <% }else{ %>
                        <a href="member/resources.jsp" class="current">Resources</a>
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
                    <h2>Please Login</h2>
                    <div class="cleaner_h20"></div>
                    <div id="form_look">
                        <form method="post" action="login">
                            <%
                                if(session.getAttribute("loginError")!=null){
                                    if(session.getAttribute("loginError").equals("User not found")){
                            %>
                            <span style="color:red;font-size: large;">Username or password was incorrect. Please try again!</span>
                            <%
                                    }
                                    session.setAttribute("loginError","");
                                }
                            %>
                            <label>Enter your username here</label>
                            <input type="text" name="uname" placeholder="username" size="50" />
                            <div class="cleaner"></div>
                            <label>Enter your password here</label>
                            <input type="password" name="passwd" placeholder="password" size="50" />
                            <input type="hidden" name="action" value="login" />
                            <input id="submit" type="submit" value="Log me in!" />
                        </form>
                    </div>
                    <div class="cleaner_h20"></div>
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
