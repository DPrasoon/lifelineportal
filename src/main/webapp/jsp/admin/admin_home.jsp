<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Admin Home</title>
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
		String strsql = "select * from admin_details where admin_id=?";

		ResultSet rs = AdminTask.getAdmin(strsql, adminId);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid">
		<h1 style="text-align: center">
			Hello
			<%=adminId%></h1>
	</div>

	<%
	if (rs.next()) {
	%>
	<div class="card border-danger mb-3"
		style="max-width: 18rem; margin-left: 625px">
		<div class="card-header"><%=rs.getString("name")%></div>
		<div class="card-body text-danger">
			<h5 class="card-title">
				Email
				<%=rs.getString("email")%></h5>
			<p class="card-text">
				Phone:
				<%=rs.getString("phone")%></p>
		</div>
	</div>

	<%
	}
	%>


	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

	<%
	}
	%>
</body>
</html>