<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Donor Registration</title>

<%@include file="/jsp/common/headerfiles.html"%>

</head>
<body>
	<%@include file="/jsp/common/commonheader.html"%>
	<div class="container-fluid p-0" style="background-color: #ba181b">
		<h2 style="color: white; text-align: center; font-family: Georgia"
			id="header">Donor Registration</h2>
	</div>
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-dark border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/lifelineportal/DonorRegistration">

					<div class="mb-3">
						<label for="userID" class="form-label"> <i
							class="fas fa-id-badge" style="font-size: 24px; color: black"></i>
							ID
						</label> <input type="text" class="form-control" id="txtid" name="txtid"
							placeholder="Enter your ID" required="required">
						<div class="invalid-feedback">Please Enter your ID</div>
					</div>

					<div class="mb-3">
						<label for="userPass" class="form-label"> <i
							class="fas fa-key" style="font-size: 24px; color: black"></i>
							Password
						</label> <input type="password" class="form-control" id="txtpass"
							name="txtpass" placeholder="Enter your password"
							required="required">
						<div class="invalid-feedback">Please Enter Your Password</div>
					</div>

					<div class="mb-3">
						<label for="username" class="form-label"> <i
							class="fa fa-user" style="font-size: 24px; color: black"></i>Name
						</label> <input type="text" class="form-control" id="txtname"
							name="txtname" placeholder="Enter your name" required="required">
						<div class="invalid-feedback">Please Enter Your Name</div>
					</div>

					<div class="mb-3">
						<label for="useremail" class="form-label"> <i
							class='fas fa-envelope-square'
							style="font-size: 24px; color: black"></i> Email
						</label> <input type="text" class="form-control" id="txtmail"
							name="txtmail" placeholder="Enter your email" required="required">
						<div class="invalid-feedback">Please Enter Your Email</div>
					</div>


					<div class="mb-3">
						<label for="userphone" class="form-label"> <i
							class="fas fa-phone" style="font-size: 24px; color: black"></i>
							Phone Number
						</label> <input type="number" class="form-control" id="txtphone"
							name="txtphone" placeholder="Enter your phone number"
							required="required">
						<div class="invalid-feedback">Please Enter Your phone number</div>
					</div>

					<div class="mb-3">
						<label for="userage" class="form-label"> <i
							class="fas fa-male" style="font-size: 24px; color: black"></i>
							Age
						</label> <input type="number" class="form-control" id="txtage"
							name="txtage" placeholder="Enter your age" required="required">
						<div class="invalid-feedback">Please Enter Your Age</div>
					</div>


					<div class="mb-3">
						<label for="username" class="form-label"> <i
							class="fas fa-check" style="font-size: 24px; color: black"></i>
							Gender
						</label> <br> <input type="radio" id="gender" name="gender"
							value="Male">   <label for="gender">Male</label>  <input
							type="radio" id="gender" name="gender" value="Female">
						  <label for="gender">Female</label><br>
						<div class="invalid-feedback">Please Select your gender</div>
					</div>

					<div class="mb-3">
						<label for="bloodgroup" class="form-label"> <i
							class="fas fa-badge-check" style="font-size: 24px; color: black"></i>
							Blood Group
						</label> <select class="form-select" required aria-label="select example"
							name="cmbgroup">
							<option value="">Select the Blood Group</option>
							<option value="A+">A+</option>
							<option value="A-">A-</option>
							<option value="B+">B+</option>
							<option value="B-">B-</option>
							<option value="AB+">AB+</option>
							<option value="AB-">AB-</option>
							<option value="O+">O+</option>
							<option value="O-">O-</option>
						</select>
						<div class="invalid-feedback">Please Select the Blood Group</div>
					</div>

					<div class="mb-3">
						<label for="city" class="form-label"> <i
							class="fas fa-city" style="font-size: 24px; color: black"></i>
							City
						</label> <select class="form-select" required aria-label="select example"
							name="cmbcity">
							<option value="">Select the city</option>
							<option value="Lucknow">Lucknow</option>
							<option value="Kanpur">Kanpur</option>
							<option value="Raebareli">Raebareli</option>
							<option value="Jhansi">Jhansi</option>
							<option value="Agra">Agra</option>
						</select>
						<div class="invalid-feedback">Please select your city</div>
					</div>

					<div class="mb-3">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>


	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

</body>
</html>