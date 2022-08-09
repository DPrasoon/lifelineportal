<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Contact Us</title>

<%@include file="/jsp/common/headerfiles.html"%>


<!-- cycling image -->
<script>
	const imageArr = [ "lifeline.png", "impact.png", "giftoflife.jpg" ]
	var index = 0
	function changeImage() {
		document.getElementById("img1").src = "/lifelineportal/images/"
				+ imageArr[index]
		index++
		if (index > (imageArr.length - 1)) {
			index = 0
		}

		setTimeout(changeImage, 2000)
	}
</script>

</head>
<body onload="changeImage()">

	<%
	String error_msg = (String) request.getAttribute("message"); 
	%>


	<%@include file="/jsp/common/commonheader.html"%>

	<%
	if (error_msg != null) {
	%>
	<div class="alert alert-primary" role="alert">
		<%=error_msg%>
	</div>
	<%
	}
	%>

	<!-- header -->
	<div
		class="container-fluid justify-content-center bg-light text-danger mb=0">
		<h3 style="text-align: center">Feel free to contact us!</h3>
	</div>
	<!-- Image -->
	<div class="row mt-0 justify-content-center">
		<img src="/lifelineportal/images/impact.png" class="d-block w-25"
			id="img1" style="width: 600px; height: 200px">
	</div>

	<!-- Feedback Form -->
	<div class="row mt-0 justify-content-center">
		<div class="col-3">
			<form class="needs-validation" novalidate method="post" action="/lifelineportal/ContactUs">

				<div class="mb-3">
					<label for="uname" class="form-label">Your Name</label> <input
						type="text" class="form-control" id="txtname" name="txtname">
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="txtmail" name="txtmail">
				</div>

				<label for="query" class="form-label">Your query</label>
				<div class="form-floating mb-3">
					<textarea class="form-control"
						placeholder="Please leave your query here!" id="txtquery"
						name="txtquery"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
		</div>
	</div>
	<br>
	<br>
	

	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

</body>
</html>