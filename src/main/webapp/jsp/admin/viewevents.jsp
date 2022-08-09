<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | View Events</title>
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
		String strsql = "select * from event";

		ResultSet rs = AdminTask.viewEvents(strsql);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #ba181b; text-align: center; font-family: Georgia"
			class="mb-0" id="header">List of Events</h2>
	</div>

	
	<table class="table table-danger table-striped">
		<thead>
			<tr>
				<th scope="col">S.No.</th>
				<th scope="col">Event Name</th>
				<th scope="col">Venue</th>
				<th scope="col">Date</th>
				<th scope="col">Description</th>
			</tr>
		</thead>
		<tbody>

			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("eventid")%></td>
				<td><%=rs.getString("event_name")%></td>
				<td><%=rs.getString("venue")%></td>
				<td><%=rs.getString("date")%></td>
				<td><%=rs.getString("description")%></td>
			</tr>
			<%
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

	<%
	}
	%>

</body>
</html>