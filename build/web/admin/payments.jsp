<%-- 
    Document   : homepage
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>

<%@page import="com.bane.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (request.getParameter("userId") != null) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int courseId = Integer.parseInt(request.getParameter("courseId"));

            AdminDBManager.setPaymentDone(userId, courseId);
        }
    %>
    <head>
        <title>E Mentor | Verify Payments</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico"/>
        <link href="../css/pagestyle.css" rel="stylesheet" type="text/css" />
        <script>
            function getList() {
                var courseId = document.getElementById("courseId").value;
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function() {
                    var content = document.getElementById("result");
                    content.innerHTML = xmlhttp.responseText;
                };

                xmlhttp.open("post", "course_user_list.jsp", true);
                xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlhttp.send("courseId=" + courseId);
            }

            function setPayment(userId, courseId) {
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function() {
                    document.innerHTML = xmlhttp.responseText;
                };

                xmlhttp.open("post", "payments.jsp", true);
                xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlhttp.send("userId=" + userId + "&courseId=" + courseId);
                //getList();
            }
        </script>
    </head>
    <body>
        <!-- header_wrapper begins -->
        <%@include file="..\WEB-INF\jspf\adminheader.jspf" %>
        <!-- header_wrapper ends -->

        <!-- menu_wrapper begins -->
        <div id="menu_wrapper">
            <div id="menu">
                <ul>
                    <li><a href="addcourses.jsp">Add Courses</a></li>
                    <li><a href="payments.jsp" class="current">Payments</a></li>
                    <li><a href="batch.jsp">Batches</a></li>
                    <li><a href="uploadcontent.jsp">Upload Content</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                </ul>
            </div>
        </div>
        <!-- menu_wrapper begins -->

        <!-- content_wrapper begins -->
        <div id="content_wrapper">

            <div id="content" style="width:920px;">
                <div class="content_box" style="width:920px;">
                    <h2>Confirm payments made by trainees</h2>
                    <div class="cleaner_h20"></div>
                    <select id="courseId">
                        <option value="-1" selected="selected">--Select--</option>
                        <%
                            ArrayList courseList = DBManager.getAllCourseList();
                            for (int i = 0; i < courseList.size(); i++) {
                                Courses c = (Courses) courseList.get(i);
                        %>
                        <option value="<%= new Integer(c.getCourseId()).toString()%>"><%= c.getCoursename()%></option>
                        <%
                            }
                        %> 
                    </select>
                    <input type="button" value="Get List" onclick="getList();" />
                    <div id="result">

                    </div>
                    <div class="cleaner"></div>
                </div>

            </div>
            <!-- end of content -->
            <div class="cleaner"></div>
        </div>
        <!-- content_wrapper ends -->

        <!-- footer_wrapper begins -->
        <%@include file="..\WEB-INF\jspf\adminfooter.jspf" %>
        <!-- footer_wrapper ends -->
    </body>
</html>