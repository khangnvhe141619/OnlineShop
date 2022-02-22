<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Shop | Contact</title>

<!-- Font awesome -->
<link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.css"
	rel="stylesheet">
<!-- SmartMenus jQuery Bootstrap Addon CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/jquery.smartmenus.bootstrap.css"
	rel="stylesheet">
<!-- Product view slider -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/jquery.simpleLens.css">
<!-- slick slider -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/slick.css">
<!-- price picker slider -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/nouislider.css">
<!-- Theme color -->
<link id="switcher"
	href="<%=request.getContextPath()%>/resources/css/theme-color/default-theme.css"
	rel="stylesheet">
<!-- Top Slider CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/sequence-theme.modern-slide-in.css"
	rel="stylesheet" media="all">

<!-- Main style sheet -->
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">

<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- wpf loader Two -->
	<div id="wpf-loader-two">
		<div class="wpf-loader-two-inner">
			<span>Loading</span>
		</div>
	</div>
	<!-- / wpf loader Two -->
	<!-- SCROLL TOP BUTTON -->
	<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
	<!-- END SCROLL TOP BUTTON -->


	<!-- Start header section -->
	<jsp:include page="components/header.jsp"></jsp:include>
	<!-- / header section -->
	<!-- menu -->
	<jsp:include page="components/menu.jsp"></jsp:include>
	<!-- / menu -->

	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img
			src="<%=request.getContextPath()%>/resources/img/fashion/fashion-header-bg-8.jpg"
			alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>Contact</h2>
					<ol class="breadcrumb">
						<li><a href="Index.jsp">Home</a></li>
						<li class="active">Contact</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->
	<!-- start contact section -->
	<section id="aa-contact">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-contact-area">
						<div class="aa-contact-top">
							<h2>We are wating to assist you..</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Quasi, quos.</p>
						</div>
						<!-- contact map -->
						<div class="aa-contact-map">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.336017750673!2d105.52189931440721!3d21.019236993480487!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1f84f39598892f4f!2zMjHCsDAxJzA5LjIiTiAxMDXCsDMxJzI2LjciRQ!5e0!3m2!1sen!2s!4v1644810897514!5m2!1sen!2s"
								width="100%" height="450" style="border: 0;" allowfullscreen=""
								loading="lazy"></iframe>
						</div>
						<!-- Contact address -->
						<div class="aa-contact-address">
							<div class="row">
								<div class="col-md-8">
									<div class="aa-contact-address-left">
										<form class="comments-form contact-form" action="">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" placeholder="Your Name"
															class="form-control">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<input type="email" placeholder="Email"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" placeholder="Subject"
															class="form-control">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" placeholder="Company"
															class="form-control">
													</div>
												</div>
											</div>

											<div class="form-group">
												<textarea class="form-control" rows="3"
													placeholder="Message"></textarea>
											</div>
											<button class="aa-secondary-btn">Send</button>
										</form>
									</div>
								</div>
								<div class="col-md-4">
									<div class="aa-contact-address-right">
										<address>
											<h4>DailyShop</h4>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Rerum modi dolor facilis! Nihil error, eius.</p>
											<p>
												<span class="fa fa-home"></span>Huntsville, AL 35813, USA
											</p>
											<p>
												<span class="fa fa-phone"></span>+ 021.343.7575
											</p>
											<p>
												<span class="fa fa-envelope"></span>Email:
												support@dailyshop.com
											</p>
										</address>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Subscribe section -->
	<jsp:include page="components/subcribe.jsp"></jsp:include>
	<!-- / Subscribe section -->

	<!-- footer -->
	<jsp:include page="components/footer.jsp"></jsp:include>
	<!-- / footer -->
	<!-- Login Modal -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<jsp:include page="components/loginPopup.jsp"></jsp:include>
	</div>


	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<!-- SmartMenus jQuery plugin -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.smartmenus.js"></script>
	<!-- SmartMenus jQuery Bootstrap Addon -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.smartmenus.bootstrap.js"></script>
	<!-- To Slider JS -->
	<script src="<%=request.getContextPath()%>/resources/js/sequence.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/sequence-theme.modern-slide-in.js"></script>
	<!-- Product view slider -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.simpleGallery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.simpleLens.js"></script>
	<!-- slick slider -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/slick.js"></script>
	<!-- Price picker slider -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/nouislider.js"></script>
	<!-- Custom js -->
	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>


</body>
</html>