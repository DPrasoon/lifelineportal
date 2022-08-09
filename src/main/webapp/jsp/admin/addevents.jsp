<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Add Events</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>

</head>
<body>

	<%
	//to check admin login
	String adminId = (String) session.getAttribute("admin_sessionId");
	if (adminId == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/admin_login.jsp"); 

		rd.forward(request, response); // always done by server side
	} else {
		
	%>


	<%
	String error_msg = (String) request.getAttribute("message"); 
	if (error_msg != null) {
	%>
	<div class="alert alert-primary alert-dismissible" role="alert">
		<%=error_msg%>
		 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<%
	}
	%>

	<%@include file="/jsp/admin/admin_header.html"%>


	<div
		class="container-fluid col-4 justify-content-center bg-dark text-info mt-3">
		<h1 style="text-align: center">Add Events</h1>
	</div>

	<div class="row mt-5 justify-content-center">
		<div class="col-4">
			<form method="post" action="/lifelineportal/AddEvents">

				<div class="mb-3">
					<label for="txtname" class="form-label">Event Name</label> <input
						type="text" class="form-control" id="txtname" name="txtname">
				</div>

				<div class="mb-3">
					<label for="txtvenue" class="form-label">Venue</label> <input
						type="text" class="form-control" id="txtvenue" name="txtvenue">
				</div>
				
				<label for="txtdate" class="form-label">Date</label>
				<div class="form-floating mb-3">
					<div class="date" id="datepicker">
						<input type="date" class="form-control" id="txtdate" name="txtdate"/>
					</div>
				</div>

				<label for="txtdesc" class="form-label">Description</label>
				<div class="form-floating mb-3">
					<textarea class="form-control" placeholder="About event"
						id="txtdesc" name="txtdesc"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
		</div>
	</div>
	<br>

	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

	<%
	}
	%>

</body>
</html>