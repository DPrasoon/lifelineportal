<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Edit Profile</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp" %>

</head>
<body>

	<%
	String donorId = (String) session.getAttribute("donor_sessionId");
	if (donorId == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/donor/login.jsp"); 

		rd.forward(request, response); 
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

	<form method="post" action="/lifelineportal/Donor_EditProfile">
		<div class="card text-bg-dark mb-3"
			style="max-width: 18rem; margin-left: 625px">
			<div class="card-header"><%=rs.getString("name")%></div>
			<div class="card-body text-light">
				<h5 class="card-title">
					Your email is
					<input type="email" class="form-control" name="txtemail" value="<%=rs.getString("email")%>">
					</h5>
					
				<h5 class="card-title">
					Phone: 
					<input type="number" class="form-control" name="txtphone" value="<%=rs.getString("phone")%>">
					</h5>
				
				<h5 class="card-title">
					Age: 
					<input type="number" class="form-control" name="txtage" value="<%=rs.getString("age")%>">
					</h5>

				<h5 class="card-title">
					City: 
					<input type="text" class="form-control" name="txtcity" value="<%=rs.getString("city")%>">
					</h5>
			</div>
			<button type="submit" class="btn btn-light">Edit</button>
		</div>
	</form>

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