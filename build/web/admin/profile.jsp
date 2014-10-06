<%-- 
    Document   : registration
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>
<%@page import="java.util.*,com.bane.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html:html lang="true">
    <head>
        <title>E Mentor | Update Profile</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="/EMentor/images/favicon.ico"/>
        <link href="/EMentor/css/pagestyle.css" rel="stylesheet" type="text/css" />
        <link href="/EMentor/css/registerFormStyle.css" rel="stylesheet" type="text/css" />

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
                    <li><a href="payments.jsp">Payments</a></li>
                    <li><a href="batch.jsp">Batches</a></li>
                    <li><a href="uploadcontent.jsp">Upload Content</a></li>
                    <li><a href="profile.jsp" class="current">Profile</a></li>
                </ul>
            </div>
        </div>
        <!-- menu_wrapper ends -->

        <!-- content_wrapper begins -->
        <div id="content_wrapper">
            <div id="content" style="width: 920px;">
                <div class="content_box" style="width: 920px;">
                    <h2>Update your Information</h2>
                    <div class="cleaner_h20"></div>
                    <div id="form_look">
                        <html:form action="adminupdate.do" method="post" enctype="multipart/form-data" styleId="rform">
                            <fieldset>
                                <%
                                    if(session.getAttribute("profile_updated")!= null && session.getAttribute("profile_updated").equals("true")){
                                %>
                                <span style="color: #fbcb09;font-size: larger;">Your profile has been updated.</span>
                                <%
                                    } 
                                %>
                                <legend>
                                    Account Information
                                </legend>
                                <%
                                    int userId = (Integer) session.getAttribute("userId");
                                    Member m = DBManager.getMemberInfo(userId);
                                    String uname = (String) session.getAttribute("uname");
                                    HashMap check = new HashMap();
                                %>
                                <label>Username</label><div class="filler"><%= uname%></div>
                                <label>Password<span id="required">*</span></label><html:password property="passwd" styleClass="rinput" /><span class="errormsg"><html:errors property="pass"/></span>
                                <label>Re-Password</label><html:password property="passwd2" styleClass="rinput" /><span class="errormsg"><html:errors property="pass2"/></span>
                                
                            </fieldset>
                            <fieldset>
                                <legend>
                                    User Information
                                </legend>
                                <label>Full Name</label><div class="filler"><%= m.getName()%></div>
                                <label>Email ID<span id="required">*</span></label><html:text property="email" styleClass="rinput" value="<%=m.getEmail()%>" /><span class="errormsg"><html:errors property="emailid"/></span>
                                <label>Mobile Number<span id="required">*</span></label><html:text property="mobileNumber" styleClass="rinput" value="<%=m.getMobileNumber()%>" /><span class="errormsg"><html:errors property="mno"/></span>
                                <label>Organization Name<span id="required">*</span></label><html:text property="college" styleClass="rinput" value="<%=m.getCollege()%>" /><span class="errormsg"><html:errors property="colg"/></span>
                                <label>Photo</label><html:file property="photo" styleClass="rbutton" /><span class="errormsg"><html:errors property="pic"/></span>
                            </fieldset>

                            <span><html:submit styleId="submit" >Update</html:submit>
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
        <%@include file="..\WEB-INF\jspf\adminfooter.jspf" %>
        <!-- footer_wrapper ends -->
    </body>
</html:html>
