<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="lifelineportal.dbtask.*, java.util.*, lifelineportal.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeLine</title>


<script>
	// image switching script
	function changeImage(imgId, imgName) {
		let x = document.getElementById(imgId)

		x.src = "/lifelineportal/images/" + imgName

	}
	function changeAgain(imgId, imgName) {
		let x = document.getElementById(imgId)
		x.src = "/lifelineportal/images/" + imgName
	}

	// text blink
	const colors = [ "black", "white" ]
	var index = 0
	function textBlink() {
		document.getElementById("header").style.color = colors[index];
		index++
		if (index > (colors.length - 1)) {
			index = 0
		}
		setTimeout(textBlink, 300)
	}
</script>


<%@include file="/jsp/common/headerfiles.html"%>


<style>
.w-100 {
	width: 100% !important;
	height: 80vh;
}
</style>

</head>


<body onload="textBlink()">

	<div class="container-fluid" style="background-color: #ba181b">
		<h2 style="color: white; text-align: center; font-family: Georgia"
			class="mb-0" id="header">LifeLine Portal Welcomes You!</h2>
	</div>

	<!-- navbar starts here -->

	<%@include file="/jsp/common/commonheader.html"%>

	<!-- navbar closed -->

	<!-- carousel starts from here -->

	<div class="container">
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="7000">
					<img src="/lifelineportal/images/lifeline.png" alt="pic1"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5 style="color: black !important">Blood Donation</h5>
						<p style="color: black !important">Everyone can save lives by
							donating blood.</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="7000">
					<img src="/lifelineportal/images/impact.png" alt="pic2"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5 style="color: black !important">We need you</h5>
						<p style="color: black !important">Every unit of blood counts.</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="7000">
					<img src="/lifelineportal/images/giftoflife.jpg" alt="pic3"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5 style="color: black !important">World Blood Donor Day</h5>
						<p style="color: black !important">Help someone today, God
							will help you tomorrow!</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>


	<!-- events -->

	<%
	String sql = "select * from event";
	ArrayList<EventBean> eventlist = CommonTask.viewEvents(sql);
	%>
	<br>
	<div class="container-fluid">
		<marquee onmouseover="this.stop()" onmouseout="this.start()">
			<ul style="list-style-type: none;">
				<%
				for (int i = 0; i < eventlist.size(); i++) //size() will count total number of objects in the arraylist
				{
					EventBean eb = eventlist.get(i); //it is used to fetch data(object) from a given index
				%>
				<li style="display: inline; color:red"><%=eb.getEvent_name()%> &nbsp;&nbsp; <%=eb.getVenue()%>
					&nbsp;&nbsp;<%=eb.getDate()%>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<%
				}
				%>
			</ul>
		</marquee>
	</div>



	<!-- Cards -->
	<div class="container mt-4">
		<div class="row mx-auto">
			<div class="col-3">
				<div class="card" style="width: 18rem;">
					<img src="/lifelineportal/images/donate.jpg" class="card-img-top"
						alt="donate.jpg" id="img1"
						onmouseover="changeImage('img1', 'set2Sticker1.png')"
						onmouseout="changeAgain('img1', 'donate.jpg')">
					<div class="card-body">
						<h5 class="card-title">Donate blood, save lives.</h5>
						<p class="card-text">Did you know! Donating 1 unit of blood
							can get you a full day leave at your workplace.</p>
						<a href="/lifelineportal/jsp/registration.jsp"
							class="btn btn-primary">Let's Donate!</a>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" style="width: 18rem;">
					<img src="/lifelineportal/images/requirement.png"
						class="card-img-top" alt="requirement.png" id="img2"
						onmouseover="changeImage('img2', 'set2Sticker3.png')"
						onmouseout="changeAgain('img2', 'requirement.png')">
					<div class="card-body">
						<h5 class="card-title">Requirement vs. Supply</h5>
						<p class="card-text">Every year our nation requires about 5
							Crore units of blood, out of which only half is available.</p>
						<a href="/lifelineportal/jsp/registration.jsp"
							class="btn btn-primary">Let's Donate!</a>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" style="width: 18rem;">
					<img src="/lifelineportal/images/giveandsave.png"
						class="card-img-top" alt="giveandsave.png" id="img3"
						onmouseover="changeImage('img3', 'set2Sticker5.png')"
						onmouseout="changeAgain('img3', 'giveandsave.png')">
					<div class="card-body">
						<h5 class="card-title">A chance to give</h5>
						<p class="card-text">Blood cannot be manufactured, it can only
							come from donors. So step forward to save a life.</p>
						<a href="/lifelineportal/jsp/registration.jsp"
							class="btn btn-primary">Let's Donate!</a>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" style="width: 18rem;">
					<img src="/lifelineportal/images/thanks.png" class="card-img-top"
						alt="thanks.png" id="img4"
						onmouseover="changeImage('img4', 'set2Sticker6.png')"
						onmouseout="changeAgain('img4', 'thanks.png')">
					<div class="card-body">
						<h5 class="card-title">Vote of thanks.</h5>
						<p class="card-text">A heartfelt thanks to all of you generous
							donors. Thanks for saving our lives.</p>
						<a href="/lifelineportal/jsp/registration.jsp"
							class="btn btn-primary">Let's Donate!</a>
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
</body>
</html>