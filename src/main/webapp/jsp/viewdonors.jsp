<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,lifelineportal.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | View Donors</title>
<%@include file="/jsp/common/headerfiles.html"%>
</head>
<body>
	<%@include file="/jsp/common/commonheader.html"%>

	<%
String strsql = "select * from donor";

		ResultSet rs = CommonTask.viewDonors(strsql);
	%>
	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #ba181b; text-align: center; font-family: Georgia"
			class="mb-0" id="header">Donors' Details</h2>
	</div>

	<table class="table table-danger table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Donor Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">Blood Group</th>
				<th scope="col">City</th>
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
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("bloodgroup")%></td>
				<td><%=rs.getString("city")%></td>
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
</body>
</html>