<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Donor Home</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp" %>
</head>
<body>

	<%
	String donorId = (String) session.getAttribute("donor_sessionId");
	if (donorId == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/donor/login.jsp"); //relative path

		rd.forward(request, response); // always done by server side
	} else {
		String strsql = "select * from donor where donor_id=?";

		ResultSet rs = DonorTask.getDonorDetails(strsql, donorId);
	%>

	<%@include file="/jsp/donor/donor_header.html"%>

	<div class="container-fluid">
		<h1 style="text-align: center">
			Hello
			<%=donorId%></h1>
	</div>

	<%
	if (rs.next()) {
	%>

	<div class="card border-danger mb-3" style="max-width: 18rem; margin-left: 625px">
		<div class="card-header"><%=rs.getString("name")%></div>
		<div class="card-body text-danger">
			<h5 class="card-title">
				Your email is
				<%=rs.getString("email")%></h5>
			<p class="card-text">
				Phone:
				<%=rs.getString("phone")%></p>
			<p class="card-text">
				Age:
				<%=rs.getString("age")%></p>
			<p class="card-text">
				Gender:
				<%=rs.getString("gender")%></p>
			<p class="card-text">
				City:
				<%=rs.getString("city")%></p>
			<p class="card-text">
				Date of Registration:
				<%=rs.getString("date")%></p>
			<div class="card-footer bg-transparent border-danger">
				Blood Group:
				<%=rs.getString("bloodgroup")%></div>
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