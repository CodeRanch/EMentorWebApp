<%-- 
    Document   : homepage
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>

<%@page import="com.bane.*,java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor | Resources</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico"/>
        <link href="../css/pagestyle.css" rel="stylesheet" type="text/css" />


        <script src="../js/jquery-1.9.1.js"></script>
        <script src="../js/ui/jquery.ui.core.js"></script>
        <script src="../js/jquery.ui.widget.js"></script>
        <script src="../js/ui/jquery.ui.tabs.js"></script>
        <link rel="stylesheet" href="../css/overcast/jquery-ui-1.10.3.custom.min.css">
        <link rel="stylesheet" href="../css/overcast/jquery-ui-1.10.3.custom.css">

        
        <script src="../js/jquery-ui-1.10.3.custom.js"></script>
        <script>
            $(function() {

                $("#tabs").tabs();
            });
        </script>
    </head>
    <body>
        <!-- header_wrapper begins -->
        <%@include file="..\WEB-INF\jspf\header.jspf" %>
        <!-- header_wrapper ends -->

        <!-- menu_wrapper begins -->
        <div id="menu_wrapper">
            <div id="menu">
                <ul>
                    <li><a href="../homepage.jsp">Home</a></li>
                    <li><a href="../courses.jsp">View Courses</a></li>
                    <li><a href="../contact.jsp">Contact Us</a></li>
                    <li><a href="../about.jsp">About Us</a></li>
                    <li>
                        <% 
                            if(session.getAttribute("userId")==null){
                        %>
                        <a href="/EMentor/member/registration.jsp">Register</a>
                        <% }else{ %>
                        <a href="update.jsp">Update</a>
                        <% } %>
                    </li>
                    <li>
                        <%
                            if (session.getAttribute("userId") == null) {
                        %>
                        <a href="login.jsp" class="current">Login</a>
                        <% } else {%>
                        <a href="../resources.jsp" class="current">Resources</a>
                        <% }%>
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
                            <%
                                int userId = (Integer)session.getAttribute("userId");
                                
                                ArrayList<StudentCourseClass> list = DBManager.getMemberCourseList(userId);
                                for(int i=0 ; i<list.size() ; i++){
                            %>
                            <li><a href="#tabs-<%= list.get(i).getCourseId() %>"><%= DBManager.getCoursename(list.get(i).getCourseId()) %></a></li>
                            <% } %>
                        </ul>
                        <% for(int i=0 ; i<list.size() ; i++){ %>
                            <% if(list.get(i).getCourseId()==1){ %>
                            <div id="tabs-1">
                                <% if(list.get(i).getPayment().equals("done")){ %>
                                    <%@include file="..\\WEB-INF\\jspf\\course1.jspf" %>
                                <% }else{ %>
                                <span style="font-size: larger;color: #c77405">Your registration for this course is pending.</span>
                                <%}%>
                            </div>
                            <% } %>
                            <% if(list.get(i).getCourseId()==2){ %>
                            <div id="tabs-2">
                                <% if(list.get(i).getPayment().equals("done")){ %>
                                    <%@include file="..\\WEB-INF\\jspf\\course2.jspf" %>
                                <% }else{ %>
                                <span style="font-size: larger;color: #c77405">Your registration for this course is pending.</span>
                                <%}%>
                            </div>
                            <% } %>
                            <% if(list.get(i).getCourseId()==3){ %>
                            <div id="tabs-3">
                                <% if(list.get(i).getPayment().equals("done")){ %>
                                    <%@include file="..\\WEB-INF\\jspf\\course3.jspf" %>
                                <% }else{ %>
                                <span style="font-size: larger;color: #c77405">Your registration for this course is pending.</span>
                                <%}%>
                            </div>
                            <% } %>
                            <% if(list.get(i).getCourseId()==4){ %>
                            <div id="tabs-4">
                                <% if(list.get(i).getPayment().equals("done")){ %>
                                    <%@include file="..\\WEB-INF\\jspf\\course4.jspf" %>
                                <% }else{ %>
                                <span style="font-size: larger;color: #c77405">Your registration for this course is pending.</span>
                                <%}%>
                            </div>
                            <% } %>
                            <% if(list.get(i).getCourseId()==5){ %>
                            <div id="tabs-5">
                                <% if(list.get(i).getPayment().equals("done")){ %>
                                    <%@include file="..\\WEB-INF\\jspf\\course5.jspf" %>
                                <% }else{ %>
                                <span style="font-size: larger;color: #c77405">Your registration for this course is pending.</span>
                                <%}%>
                            </div>
                            <% }} %>
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
<%@include file="..\WEB-INF\jspf\footer.jspf" %>
<!-- footer_wrapper ends -->
</body>
</html>


