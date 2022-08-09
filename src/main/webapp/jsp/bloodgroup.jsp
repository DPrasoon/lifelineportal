<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Blood Group</title>

<%@include file="/jsp/common/headerfiles.html"%>

</head>
<body>

	<%@include file="/jsp/common/commonheader.html"%>

	<div class="container-fluid p-0" style="background-color: #ba181b">
		<h2 style="color: white; text-align: center; font-family: Georgia"
			id="header">About Blood Groups</h2>
	</div>

	<!-- image -->
	<div class="container">
		<div class="row">
			<div class="col-4 mx-auto">
				<img src="/lifelineportal/images/bloodtypes.png" class="img-thumbnail">
			</div>
		</div>
	</div>

	<!-- accordion -->
	<div class="container mt-4">
		<div class="accordion" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">Blood
						group AB</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<strong> Blood group AB individuals</strong> have both A and B
						antigens on the surface of their RBCs, and their blood plasma does
						not contain any antibodies against either A or B antigen.
						Therefore, an individual with type AB blood can receive blood from
						any group (with AB being preferable), but cannot donate blood to
						any group other than AB. They are known as universal recipients.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">Blood
						group A</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<strong>Blood group A</strong> individuals have the A antigen on
						the surface of their RBCs, and blood serum containing IgM
						antibodies against the B antigen. Therefore, a group A individual
						can receive blood only from individuals of groups A or O (with A
						being preferable), and can donate blood to individuals with type A
						or AB.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">
						Blood group B</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse"
					aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<strong>Blood group B</strong> individuals have the B antigen on
						the surface of their RBCs, and blood serum containing IgM
						antibodies against the A antigen. Therefore, a group B individual
						can receive blood only from individuals of groups B or O (with B
						being preferable), and can donate blood to individuals with type B
						or AB.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingFour">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseFour"
						aria-expanded="false" aria-controls="collapseFour">Blood
						group O</button>
				</h2>
				<div id="collapseFour" class="accordion-collapse collapse"
					aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<strong>Blood group O</strong> individuals do not have either A or
						B antigens on the surface of their RBCs, and their blood serum
						contains IgM anti-A and anti-B antibodies. Therefore, a group O
						individual can receive blood only from a group O individual, but
						can donate blood to individuals of any ABO blood group (i.e., A,
						B, O or AB). If a patient needs an urgent blood transfusion, and
						if the time taken to process the recipient's blood would cause a
						detrimental delay, O negative blood can be issued. Because it is
						compatible with anyone, O negative blood is often overused and
						consequently is always in short supply.
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>
</body>
</html>