<%-- 
    Document   : homepage
    Created on : Aug 3, 2013, 1:38:55 PM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E Mentor | Upload Content</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico"/>
        <link href="../css/pagestyle.css" rel="stylesheet" type="text/css" />
        <style>
            label{
                font-size: 1.5em;
                color: #05738C;
            }
            .lbl_cnt{
                font-style: italic;
                font-size: 1.2em;
            }
        </style>
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
                    <li><a href="uploadcontent.jsp" class="current">Upload Content</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                </ul>
            </div>
        </div>
        <!-- menu_wrapper begins -->

        <!-- content_wrapper begins -->
        <div id="content_wrapper">
            
            <div id="content" style="width:920px;">
                <div class="content_box" style="width:920px;">
                    <h2>Upload Content</h2>
                    
                    <div class="cleaner_h20"></div>
                    <div style="float: right;"><img src="images/map.jpg" /></div>
                    <label>Address</label>
                    <div class="lbl_cnt"><br/>
                        Unisoft Technologies<br/>
                        1-A, Panchsheel Park Extn<br/>
                        Behind Cafe Coffee Day<br/>
                        Ballupur FRI Road<br/>
                        Dehradun<br/>
                        Uttarakhand - 248001
                    </div>
                    <br/><br/>
                    <label>Mobile Number</label>
                    <div class="lbl_cnt"><br/>9319056587, 8006818882</div>
                    <br/><br/>
                    <label>E-Mail Us at</label>
                    <div class="lbl_cnt"><br/>ndhagarra@gmail.com</div>
                     
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