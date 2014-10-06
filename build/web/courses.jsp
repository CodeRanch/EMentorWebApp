<%-- 
    Document   : homepage
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor | Courses</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
        <link href="css/pagestyle.css" rel="stylesheet" type="text/css" />


        <script src="js/jquery-1.9.1.js"></script>
        <script src="js/ui/jquery.ui.core.js"></script>
        <script src="js/jquery.ui.widget.js"></script>
        <script src="js/ui/jquery.ui.tabs.js"></script>
        <link rel="stylesheet" href="css/overcast/jquery-ui-1.10.3.custom.min.css">
        <link rel="stylesheet" href="css/overcast/jquery-ui-1.10.3.custom.css">

        
        <script src="js/jquery-ui-1.10.3.custom.js"></script>
        <script>
            $(function() {

                $("#tabs").tabs();
            });
        </script>
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
                    <li><a href="courses.jsp" class="current">View Courses</a></li>
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

            <div id="content" style="width: 920px;">
                <div class="content_box" style="width: 920px;padding: 0px">
                    
                    <div id="tabs">
                        <ul>
                            <li><a href="#tabs-1">Java</a></li>
                            <li><a href="#tabs-2">C#.Net</a></li>
                            <li><a href="#tabs-3">PHP</a></li>
                            <li><a href="#tabs-4">Android</a></li>
                            <li><a href="#tabs-5">C Programming</a></li>
                        </ul>
                        <div id="tabs-1">

                            <h2>Java Expert Curriculum</h2>
                            <hr>
                            <p>
                                Java Expert Curriculum (JEC) is a 90 Hrs Module. It has been designed in such a way so that a student can learn all the major sections of Java programming in-depth. JEC has 3 major modules:
                            </p>
                            <ul>
                                <li>  Core Java </li>
                                <li>  Advance Java </li>
                                <li>  J2EE</li>
                            </ul>

                            <h3>Core Java</h3>
                            <hr>
                            <p>This module has been aimed at understanding the core concepts of Java Language. After completing this module student will be able to appear for Oracle Certified Professional Java Programmer. The main topics are:</p>
                            <ul>
                                <li>Introduction to Programming
                                <li>Setting up the Java Environment</li>
                                <li>Java Language Fundamentals</li>
                                <li>Object Oriented Programming</li>
                                <li>Java Packages</li>
                                <li>Exception Handling</li>
                                <li>Generics</li>
                                <li>Data Structures</li>
                                <li>File Handling</li>
                                <li>Multi-Threading</li>
                                <li>Annotations</li>
                                <li>Enumerations</li>
                            </ul>
                            <h3>Advance Java</h3>
                            <hr>
                            <p>This module will enable the students to become Desktop Application Programmers and Distributed Application Developers. The main topics are:</p>
                            <ul>
                                <li>GUI Programming using AWT/SWING
                                <li>Event Handling</li>
                                <li>JDBC</li>
                                <li>Socket Programming</li>
                                <li>Distributed Application Development using RMI</li>
                                <li>Applets</li>
                                <li>Mini Project</li>
                            </ul>
                            <h3>J2EE</h3>
                            <hr>
                            <p>This module will enable students to understand the server side Java Programming. The main topics are:</p>
                            <ul>
                                <li>Introduction to Web Programming</li>
                                <li>Web Technologies : HTML, CSS, Java Script</li>
                                <li>3 Tier Architecture</li>
                                <li>Servlets</li>
                                <li>JSP</li>
                                <li>EL</li>
                                <li>JSTL</li>
                                <li>Java Beans</li>
                                <li>Understanding MVC Architecture</li>
                                <li>Introduction to Struts</li>
                                <li>Introduction to Hibernates</li>
                                <li>Introduction to EJB</li>
                                <li>Introduction to Web Services</li>
                                <li>Mini Project</li>
                            </ul>
                        </div>
                        <div id="tabs-2">

                            <h2>.Net Expert Curriculum</h2>
                            <hr>
                            <p>
                                .Net Expert Curriculum(DEP) : has been designed for students who want to master .Net Framework. .Net is one of the most powerful Framework available today for building different types of Application like Desktop, Web and Distributed. The Main modules of DEP are
                            </p>
                            <ul>
                                <li>C#.Net</li>
                                <li>Winforms</li>
                                <li>ADO.Net </li>
                                <li>ASP.Net</li>
                            </ul>

                            <h3>C#.Net</h3>
                            <hr>
                            <ul>
                                <li>Understanding the .Net Framework</li>
                                <li>IL and CLR</li>
                                <li>C# Fundamentals</li>
                                <li>OOP using C#</li>
                                <li>Exception Handling</li>
                                <li>Generics</li>
                                <li>Data Structures</li>
                                <li>File Handling</li>
                                <li>Multi-Threading</li>
                                <li>LINQ</li>
                            </ul>
                            <h3>Winforms</h3>
                            <hr>
                            <ul>
                                <li>GUI Programming</li>
                                <li>Events & Delegates</li>
                                <li>Common Controls</li>
                                <li>Containers</li>
                                <li>Data Controls</li>
                                <li>Menus & Toolbars</li>
                                <li>Dialog Boxes</li>
                                <li>Mini Project</li>
                            </ul>
                            <h3>ADO.Net</h3>
                            <hr>
                            <ul>
                                <li>Data Providers</li>
                                <li>Connection</li>
                                <li>Data Adapters</li>
                                <li>DataSets</li>
                                <li>Data Binding</li>
                                <li>Validations , REGEX</li>
                            </ul>
                            <h3>ASP.Net</h3>
                            <hr>
                            <ul>
                                <li>Introduction to Web Programming</li>
                                <li>3 Tier Architecture</li>
                                <li>ASP.Net Life Cycle</li>
                                <li>View State</li>
                                <li>User Controls</li>
                                <li>Rich Controls</li>
                                <li>Themes </li>
                                <li>Master Pages</li>
                                <li>Website Navigation</li>
                                <li>Web Security</li>
                                <li>Deployment</li>
                                <li>AJAX</li>
                            </ul>
                        </div>
                        <div id="tabs-3">

                            <h2>Website Development using PHP</h2>
                            <hr>
                            <p>
                                PHP is a general-purpose server-side scripting language designed for web development to produce dynamic web pages. In this course, you can learn to develop great web applications using PHP. The contents of this course are:
                            </p>
                            <ul>
                                <li>Introduction to Web Programming </li>
                                <li>Setting up the PHP environment </li>
                                <li>Static Page development using HTML and CSS </li>
                                <li>using Java Script</li>
                                <li>Embedding PHP to generate Web Pages</li>
                                <li>Variables, Operators, Decision Making and Looping</li>
                                <li>PHP Functions</li>
                                <li>PHP $_GET,$_POST,$_SERVER </li>
                                <li>Array, Date and String</li>
                                <li>File Handling</li>
                                <li>Uploading Files</li>
                                <li>Cookies & Sessions</li>
                                <li>Website Security</li>
                                <li>Database using Mysql</li>
                                <li>Select, Insert, Update & Delete using SQL</li>
                                <li>Introduction to AJAX</li>
                                <li>Introduction to CMS : Wordpress, Joomla</li>
                                <li>Mini Project</li>
                            </ul>
                        </div>
                        <div id="tabs-4">

                            <h2>Mobile Application Development using Android</h2>
                            <hr>
                            <p>
                                Android Platfrom has gained lot of popularity in recent years. Programming in Android is based on Java Language. This course has been carefully designed for students so that they can become good Android Programmers.
                            </p>
                            <ul>
                                <li>Java Fundamentals for Android</li>
                                <li>Introduction to Mobile Development </li>
                                <li>Setting up Android SDK </li>
                                <li>Eclipse ADT Plugin </li>
                                <li>Android Project Structure</li>
                                <li>Activities and Intents</li>
                                <li>Layouts</li>
                                <li>Widgets </li>
                                <li>Containers</li>
                                <li>Menus</li>
                                <li>Popups</li>
                                <li>Activity Life Cycle Events</li>
                                <li>Threads</li>
                                <li>Accessing Files</li>
                                <li>Accessing Databases</li>
                                <li>Sub-Activities</li>
                            </ul>			    </div>
                        <div id="tabs-5">

                            <h2>Programming Fundamentals using C</h2>
                            <hr>
                            <p>
                                Every programmer must learn C Language as it is the mother of  most of the modern programming languages like Java, C#, VC. This module will enable a student to master the fundamentals of programming and learn the art of software development.
                            </p>
                            <ul>
                                <li>Introduction to Programming</li>
                                <li>Data Types</li>
                                <li>Operators</li>
                                <li>Keywords, Identifiers, Constants and Literals</li>
                                <li>Decision Making</li>
                                <li>Looping</li>
                                <li>Arrays</li>
                                <li>Functions</li>
                                <li>Recursion</li>
                                <li>String</li>
                                <li>Structures</li>
                                <li>Enums, Union</li>
                                <li>Pointers</li>
                                <li>Dynamic Memory Allocation</li>
                                <li>File Handling</li>
                                <li>Macros</li>
                                <li>Preprocessors</li>
                            </ul>
                        </div>
                    </div>		
                </div>
            </div>

           <div class="cleaner"></div>
        </div>
        
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

