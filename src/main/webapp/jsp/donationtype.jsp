<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LifeLine | Donation Type</title>

<%@include file="/jsp/common/headerfiles.html" %>

<script>
	function hideDiv(elementId) {
		let d = document.getElementById(elementId);
		d.style.display = "none";
	}
	function showDiv(elementId) {
		let d = document.getElementById(elementId);
		d.style.display = "block";
	}
</script>

</head>
<body>

<%@include file="/jsp/common/commonheader.html" %>

	<div class="container-fluid" style="background-color: #ba181b">
		<h2 style="color: white; text-align: center; font-family: Georgia"
			class="mb-0" id="header">Donation Type</h2>
	</div>



	<div class="container">
		<div class="row mt-4">

			<!-- 		content 1 -->
			<div class="col-4 py-4 mx-auto justify-content-center">
				<button
					onclick="showDiv('divWh');hideDiv('divPls');hideDiv('divPl')"
					type="button" class="btn btn-danger">Whole Blood</button>
				<div id="divWh" style="display: block"
					class="p-3 bg-dark bg-opacity-10 border border-dark rounded-start rounded-end">
					<h2 style="text-align: center;">Whole Blood</h2>
					<b>What is it?</b>
					<p>Blood Collected straight from the donor after its donation
						usually separated into red blood cells, platelets, and plasma.</p>
					<b> Who can donate?</b>
					<p>You need to be 18-65 years old, weigh 45kg or more and be
						fit and healthy.</p>
					<b>User For?</b>
					<p>Stomach disease, kidney disease, childbirth, operations,
						blood loss, trauma, cancer, blood diseases, haemophilia, anemia,
						heart disease.</p>
					<b>Lasts For?</b>
					<p>Red cells can be stored for 42 days.</p>
					<b>How long does it take?</b>
					<p>15 minutes to donate.</p>
					<b>How often can I donate? </b>
					<p>Every 12 weeks</p>
				</div>
			</div>

			<!-- 		content 2 -->

			<div class="col-4 py-4 mx-auto justify-content-center">
				<button
					onclick="showDiv('divPls');hideDiv('divWh');hideDiv('divPl')"
					type="button" class="btn btn-danger">Plasma</button>
				<div id="divPls" style="display: none"
					class="p-3 bg-dark bg-opacity-10 border border-dark rounded-start rounded-end">
					<h2 style="text-align: center;">Plasma</h2>
					<b>What is it?</b>
					<p>The straw-coloured liquid in which red blood cells, white
						blood cells, and platelets float in.Contains special nutrients
						which can be used to create 18 different type of medical products
						to treat many different medical conditions.</p>
					<b>Who can donate?</b>
					<p>You need to be 18-70 (men) or 20-70 (women) years old, weigh
						50kg or more and must have given successful whole blood donation
						in last two years.</p>
					<b>User For? </b>
					<p>Immune system conditions, pregnancy (including anti-D
						injections), bleeding, shock, burns, muscle and nerve conditions,
						haemophilia, immunisations. Lasts For? Plasma can last up to one
						year when frozen.</p>
					<b>How does it work?</b>
					<p>We collect your blood, keep plasma and return rest to you by
						apheresis donation. How long does it take? 15 minutes to donate.
						How often can I donate? Every 2-3 weeks.</p>
				</div>
			</div>
			<!-- 		content 3 -->

			<div class="col-4 py-4 mx-auto justify-content-center">
				<button
					onclick="showDiv('divPl');hideDiv('divPls');hideDiv('divWh')"
					type="button" class="btn btn-danger">Platelets</button>
				<div id="divPl" style="display: none"
					class="p-3 bg-dark bg-opacity-10 border border-dark rounded-start rounded-end">
					<h2 style="text-align: center;">Platelets</h2>
					<b>What is it?</b><p> The tiny 'plates' in blood that wedge together
						to help to clot and reduce bleeding. Always in high demand, Vital
						for people with low platelet count, like malaria and cancer
						patients.</p><b> Who can donate?</b><p> You need to be 18-70 years old (men),
						weigh 50kg or more and have given a successful plasma donation in
						the past 12 months User For? Cancer, blood diseases, haemophilia,
						anaemia, heart disease, stomach disease, kidney disease,
						childbirth, operations, blood loss, trauma, burns.</p><b> Lasts For?</b><p> Just
						five days..</p><b>How does it work?</b> <p> We collect your blood, keep platelet
						and return rest to you by apheresis donation.</p><b> How long does it
						take?</b><p> 45 minutes to donate.</p><b>How often can I donate?</b> <p> Every 2 weeks</p>
				</div>
			</div>
		</div>
	</div>



<%@include file="/jsp/common/commonfooter.html" %>

<%@include file="/jsp/common/scriptfiles.html" %>
</body>
</html>