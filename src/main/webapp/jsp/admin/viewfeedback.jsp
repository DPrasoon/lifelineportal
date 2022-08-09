<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | View Feedback</title>
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
		String strsql = "select * from feedback";

		ResultSet rs = AdminTask.viewFeedback(strsql);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #ba181b; text-align: center; font-family: Georgia"
			class="mb-0" id="header">View Feedback</h2>
	</div>

	<table class="table table-danger table-striped">
		<thead>
			<tr>
				<th scope="col">S.No.</th>
				<th scope="col">Donor Name</th>
				<th scope="col">Email</th>
				<th scope="col">Feedback</th>
				<th scope="col">Rating</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody>

			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("sno")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("feedbacktxt")%></td>
				<td><%=rs.getString("rating")%></td>
				<td><%=rs.getString("date")%></td>
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