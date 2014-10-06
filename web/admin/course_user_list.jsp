<%@page import="java.util.ArrayList"%>
<%@page import="com.bane.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table <% if(request.getParameter("userId")!=null && request.getParameter("courseId")!=null){ %>onload="getList();"<% } %>>
    
    <%
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        ArrayList regUsers = AdminDBManager.getCourseWiseUsers(courseId);
    %>
    <tr>
        <th>Name</th><th>E-Mail</th><th>Mobile Number</th><th>Payment Status</th>
    </tr>
    <%
        for(int i=0 ; i<regUsers.size() ; i++){
            int userId = (Integer)regUsers.get(i);
            Member m = DBManager.getMemberInfo(userId);
    %>
    <tr>
        <td><%= m.getName()  %></td>
        <td><%= m.getEmail()  %></td>
        <td><%= m.getMobileNumber()  %></td>
        <%
            if(AdminDBManager.getPaymentStatus(userId , courseId)){
        %>
        <td><i>done</i></td>
        <%
            }else{
        %>
        <td><input type="button" value="paid" onclick="setPayment(<%= userId %>,<%= courseId %>);" /></td>
        <% } %>
    </tr>
    <%
        }
    %>
</table>