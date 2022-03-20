<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
        Document Title
        =============================================
        -->
<title>Change Password</title>
<!--  lalala
        Favicons
        =============================================
        -->
<link rel="apple-touch-icon" sizes="57x57"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="<%=request.getContextPath()%>/resources/common/assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<script
	src="<%=request.getContextPath()%>/resources/common/js/script.js"
	type="text/javascript"></script>
<!--  
        Stylesheets
        =============================================
        
        -->
<!-- Default stylesheets-->
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/animate.css/animate.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/flexslider/flexslider.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/common/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link
	href="<%=request.getContextPath()%>/resources/common/assets/css/style.css"
	rel="stylesheet">
<link id="color-scheme"
	href="<%=request.getContextPath()%>/resources/common/assets/css/colors/default.css"
	rel="stylesheet">

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<jsp:include page="components/header.jsp"></jsp:include>
	<div class="main">
		<section class="module bg-dark-30 about-page-header">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h1 class="module-title font-alt mb-0">Change Password</h1>
					</div>
				</div>
			</div>
		</section>
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt mb-0">Change Password</h4>
						<hr class="divider-w mt-10 mb-20">
						<c:if test="${failedRegister}">
							<div style="color: red;">Change failed</div>
						</c:if>
						<c:if test="${errorSQL}">
							<div style="color: red;">Connect SQL Server fail</div>
						</c:if>
						<c:if test="${success}">
							<div style="color: green; font-size: 15px;">Change password successfully !!!</div>
							<br>
						</c:if>
						<form class="form" role="form" id="myChange" 
							action="<%=request.getContextPath()%>/changePassword" method="post" onsubmit="return checkPassword();">
							<c:if test="${PasswordIncorrect}">
								<div style="color: red;">Password incorrect !!!</div>
							</c:if>
							<div class="form-group">
								<input class="form-control input-lg" type="password"
									name="currentpass" id="currentpass" value="${currentpass}"
									placeholder="CURRENT PASSWORD" required>
							</div>
							<div class="form-group">
								<input class="form-control input-lg" type="password" name="newpass" pattern="[a-zA-Z0-9]{6, 15}" 
									id="newpass" value="${newpass}" placeholder="NEW PASSWORD"
									required>
							</div>							
							<div class="form-group">
								<input class="form-control input-lg" type="password" name="repass" pattern="[a-zA-Z0-9]{6, 15}" 
									id="repass" value="${repass}" placeholder="RE-PASSWORD" required>
							</div>
							<div class="form-group ">
								<input class="btn btn-lg btn-block btn-round btn-b"
									type="submit" value="Update" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!--  
        JavaScripts
        =============================================
        -->
        <script
		src="<%=request.getContextPath()%>/resources/common/js/EditProfile.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/js/ChangePassword.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/jquery/dist/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/wow/dist/wow.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/smoothscroll.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/js/plugins.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/common/assets/js/main.js"></script>
</body>
</html>

