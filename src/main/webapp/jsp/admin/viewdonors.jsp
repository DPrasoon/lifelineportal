<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | View Donors</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp" %>
</head>
<body>

	<%
	String adminId = (String) session.getAttribute("admin_sessionId");
	if (adminId == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/admin_login.jsp"); 

		rd.forward(request, response);
	} else {
		String strsql = "select * from donor";

		ResultSet rs = AdminTask.viewDonors(strsql);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #ba181b; text-align: center; font-family: Georgia"
			class="mb-0" id="header">Donors' Details</h2>
	</div>


	<table class="table table-danger table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Donor Name</th>
				<th scope="col">Age</th>
				<th scope="col">Email</th>
				<th scope="col">Gender</th>
				<th scope="col">Phone</th>
				<th scope="col">Blood Group</th>
				<th scope="col">City</th>
				<th scope="col">Date of Registration</th>
			</tr>
		</thead>
		<tbody>

			<%int i=1; %>
			<%while(rs.next())
				{
				%>
			<tr>
				<th><%=i %></th>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("age")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("bloodgroup")%></td>
				<td><%=rs.getString("city")%></td>
				<td><%=rs.getString("date")%></td>
			</tr>
			<%i++;
			}
			%>
		</tbody>
	</table>

	<%
	if (rs != null) {
		rs.close();
	}
	%>

	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

	<%}%>

</body>
</html>