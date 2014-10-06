<%-- 
    Document   : registration
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>
<%@page import="java.util.*,com.bane.Courses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html:html lang="true">
    <head>
        <title>E Mentor | Registration Form</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="/EMentor/images/favicon.ico"/>
        <link href="/EMentor/css/pagestyle.css" rel="stylesheet" type="text/css" />
        <link href="/EMentor/css/registerFormStyle.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <!-- header_wrapper begins -->
        <%@include file="..\WEB-INF\jspf\header.jspf" %>
        <!-- header_wrapper ends -->

        <!-- menu_wrapper begins -->
        <div id="menu_wrapper">
            <div id="menu">
                <ul>
                    <li><a href="/EMentor/homepage.jsp">Home</a></li>
                    <li><a href="/EMentor/courses.jsp">View Courses</a></li>
                    <li><a href="/EMentor/contact.jsp">Contact Us</a></li>
                    <li><a href="/EMentor/about.jsp">About Us</a></li>
                    <li>
                        <%
                            if (session.getAttribute("userId") == null) {
                        %>
                        <a href="/EMentor/member/registration.jsp" class="current">Register</a>
                        <% } else {%>
                        <a href="update.jsp" class="current">Update</a>
                        <% }%>
                    </li>
                    <li><%
                        if (session.getAttribute("userId") == null) {
                        %>
                        <a href="/EMentor/login.jsp">Login</a>
                        <% } else {%>
                        <a href="resources.jsp">Resources</a>
                        <% }%>
                    </li>
                </ul>
            </div>
        </div>
        <!-- menu_wrapper ends -->

        <!-- content_wrapper begins -->
        <div id="content_wrapper">
            <div id="content" style="width: 920px;">
                <div class="content_box" style="width: 920px;">
                    <h2>Registration Form</h2>
                    <div class="cleaner_h20"></div>
                    <div id="form_look">
                        <html:form action="registration.do" method="post" enctype="multipart/form-data" styleId="rform">
                            <fieldset>
                                <%
                                    if(session.getAttribute("profile_updated")!=null && session.getAttribute("profile_updated").equals("true")){
                                %>
                                <span style="color: #fbcb09;font-size: larger;">Your profile has been updated.</span>
                                <%
                                    } 
                                %>
                                <legend>
                                    Account Information
                                </legend>
                                <label>Username<span id="required">*</span></label><html:text property="uname" styleClass="rinput" /><span class="errormsg"><html:errors property="username"/></span>
                                <label>Password<span id="required">*</span></label><html:password property="passwd" styleClass="rinput" /><span class="errormsg"><html:errors property="pass"/></span>
                                <label>Re-Password</label><html:password property="passwd2" styleClass="rinput" /><span class="errormsg"><html:errors property="pass2"/></span>
                                <label>Course</label>
                                <html:select property="courseId" styleId="rselect">
                                    <%
                                        ArrayList list = DBManager.getAllCourseList();
                                        for (int i = 0; i < list.size(); i++) {
                                            Courses c = (Courses) list.get(i);
                                    %>
                                    <html:option value="<%= new Integer(c.getCourseId()).toString()%>"><%= c.getCoursename()%></html:option>
                                    <%
                                        }
                                    %>
                                </html:select>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    User Information
                                </legend>
                                <label>Full Name<span id="required">*</span></label><html:text property="name" styleClass="rinput" /><span class="errormsg"><html:errors property="fullname"/></span>
                                <label>Email ID<span id="required">*</span></label><html:text property="email" styleClass="rinput" /><span class="errormsg"><html:errors property="emailid"/></span>
                                <label>Mobile Number<span id="required">*</span></label><html:text property="mobileNumber" styleClass="rinput" /><span class="errormsg"><html:errors property="mno"/></span>
                                <label>College/University Name<span id="required">*</span></label><html:text property="college" styleClass="rinput" /><span class="errormsg"><html:errors property="colg"/></span>
                                <label>Photo</label><html:file property="photo" styleClass="rbutton" /><span class="errormsg"><html:errors property="pic"/></span>
                            </fieldset>

                                <span><html:submit styleId="submit" >Register</html:submit>
                                    <html:reset styleId="reset" >Reset form</html:reset></span>
                            
                        </html:form>
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
</html:html>
