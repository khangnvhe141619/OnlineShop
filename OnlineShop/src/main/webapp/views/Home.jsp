<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Home</title>
        <!--  home
        Favicons
        =============================================
        -->
        <link rel="apple-touch-icon" sizes="57x57" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/common/assets/images/favicons/favicon-16x16.png">
        <link rel="manifest" href="/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="<%=request.getContextPath()%>/resources/common/assets/images/favicons/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <!--  
        Stylesheets
        =============================================
        
        -->
        <!-- Default stylesheets-->
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Template specific stylesheets-->
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/animate.css/animate.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/flexslider/flexslider.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/common/assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
        <!-- Main stylesheet and color file-->
        <link href="<%=request.getContextPath()%>/resources/common/assets/css/style.css" rel="stylesheet">
        <link id="color-scheme" href="<%=request.getContextPath()%>/resources/common/assets/css/colors/default.css" rel="stylesheet">
    </head>
    <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<!-- header -->
		<jsp:include page="components/header.jsp"></jsp:include>
		<!-- end header -->
		<section class="home-section bg-dark-30" id="home"
			data-background="<%=request.getContextPath()%>/resources/common/assets/images/finance/finance_header_bg.png">
			<div class="video-player"
				data-property="{videoURL:'https://www.youtube.com/watch?v=oj8_wufhE28&list=RDvsi1ivi03sE&index=2', containment:'.home-section', startAt:30, mute:true, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:25}"></div>
			<div class="video-controls-box">
				<div class="container">
					<div class="video-controls">
						<a class="fa fa-volume-up" id="video-volume" href="#">&nbsp;</a><a
							class="fa fa-pause" id="video-play" href="#">&nbsp;</a>
					</div>
				</div>
			</div>
			<div class="titan-caption">
				<div class="caption-content">
					<div class="font-alt mb-30 titan-title-size-1">Hello &amp;
						welcome</div>
					<div class="font-alt mb-40 titan-title-size-4">We are Tomee
						Shop</div>
					<a class="section-scroll btn btn-border-w btn-round" href="<%=request.getContextPath()%>/list">Shopping
						Now</a>
				</div>
			</div>
		</section>
		<div class="main">
			<section class="module-extra-small bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-md-8 col-lg-6 col-lg-offset-2">
							<div class="callout-text font-alt">
								<h4 style="margin-top: 0px;">looking for a first-class
									business consultant?</h4>
								<p style="margin-bottom: 0px;">We are always here for you</p>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-2">
							<div class="callout-btn-box">
								<a class="btn btn-w btn-round" href="#">Get a quote</a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="module pt-0 pb-0">
				<div class="row position-relative m-0">
					<div class="col-xs-12 col-md-6 side-image"
						data-background="<%=request.getContextPath()%>/resources/common/images/home_img.jpg"></div>
					<div class="col-xs-12 col-md-6 col-md-offset-6">
						<div class="row finance-image-content">
							<div class="col-md-10 col-md-offset-1">
								<h2 class="module-title font-alt align-left">Practice Areas</h2>
								<div class="row multi-columns-row">
									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="alt-features-item">
											<div class="alt-features-icon">
												<span class="icon-briefcase"></span>
											</div>
											<h3 class="alt-features-title font-alt">Business
												consulting</h3>
											A wonderful serenity has taken possession of my entire soul
											like these sweet mornings.
										</div>
										<div class="alt-features-item">
											<div class="alt-features-icon">
												<span class="icon-puzzle"></span>
											</div>
											<h3 class="alt-features-title font-alt">Marketing
												Strategy</h3>
											A wonderful serenity has taken possession of my entire soul
											like these sweet mornings.
										</div>
										<div class="alt-features-item">
											<div class="alt-features-icon">
												<span class="icon-pricetags"></span>
											</div>
											<h3 class="alt-features-title font-alt">Taxes Advisory</h3>
											A wonderful serenity has taken possession of my entire soul
											like these sweet mornings.
										</div>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="alt-features-item">
											<div class="alt-features-icon">
												<span class="icon-wallet"></span>
											</div>
											<h3 class="alt-features-title font-alt">Investment
												planning</h3>
											A wonderful serenity has taken possession of my entire soul
											like these sweet mornings.
										</div>
										<div class="alt-features-item">
											<div class="alt-features-icon">
												<span class="icon-laptop"></span>
											</div>
											<h3 class="alt-features-title font-alt">IT management</h3>
											A wonderful serenity has taken possession of my entire soul
											like these sweet mornings.
										</div>
										<div class="alt-features-item">
											<div class="alt-features-icon">
												<span class="icon-linegraph"></span>
											</div>
											<h3 class="alt-features-title font-alt">Data Analytics</h3>
											A wonderful serenity has taken possession of my entire soul
											like these sweet mornings.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="module sliding-portfolio">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">Our Product</h2>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="owl-carousel text-center" data-items="4"
							data-pagination="false" data-navigation="false">

							<div class="owl-item">
								<div class="col-sm-12">
									<div class="work-item">
										<a href="<%=request.getContextPath()%>/search?name=&category=1&to=&end=">
											<div class="work-image">
												<img
													src="<%=request.getContextPath()%>/resources/common/images/literature.jpg"
													alt="" />
											</div>
											<div class="work-caption font-alt">
												<h3 class="work-title">Literature</h3>
												<!--<div class="work-descr">Illustration</div>-->
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="work-item">
										<a href="<%=request.getContextPath()%>/search?name=&category=2&to=&end=">
											<div class="work-image">
												<img
													src="<%=request.getContextPath()%>/resources/common/images/economic.png"  alt=""/>
											</div>
											<div class="work-caption font-alt">
												<h3 class="work-title">Economic</h3>
												<!--<div class="work-descr">Illustration</div>-->
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="work-item">
										<a href="<%=request.getContextPath()%>/search?name=&category=3&to=&end=">
											<div class="work-image">
												<img
													src="<%=request.getContextPath()%>/resources/common/images/dictionary.jpg"
													alt="" />
											</div>
											<div class="work-caption font-alt">
												<h3 class="work-title">Dictionary </h3>
												<!--<div class="work-descr">Illustration</div>-->
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="work-item">
										<a href="<%=request.getContextPath()%>/search?name=&category=4&to=&end=">
											<div class="work-image">
												<img
													src="<%=request.getContextPath()%>/resources/common/images/education.jpg"
													alt="" />
											</div>
											<div class="work-caption font-alt">
												<h3 class="work-title">Education - Teaching</h3>
												<!--<div class="work-descr">Illustration</div>-->
											</div>
										</a>
									</div>
								</div>
							</div>							
						</div>
						<div class="col-sm-12">
							<div class="text-center">
								<a class="btn btn-border-d btn-circle mt-50" href="<%=request.getContextPath()%>/list">View
									All</a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="module pt-0 pb-0" id="contact">
				<div class="row position-relative m-0">
					<div class="col-xs-12 col-md-6">
						<div class="row finance-image-content" style="border: none;">
							<div class="col-md-10 col-md-offset-1">
								<h2 class="module-title font-alt align-left">Subscribe</h2>
								<form method="post"
									action="<%=request.getContextPath()%>/subscribeController">
									<div class="form-group">
										<label class="sr-only" for="name">Name</label> <input
											class="form-control" type="text" id="name" name="name"
											placeholder="Your Name*" required="required"
											data-validation-required-message="Please enter your name." />
										<p class="help-block text-danger"></p>
									</div>
									<div class="form-group">
										<label class="sr-only" for="email">Email</label> <input
											class="form-control" type="email" id="email" name="email"
											placeholder="Your Email*" required="required"
											data-validation-required-message="Please enter your email address." />
										<p class="help-block text-danger"></p>
									</div>

									<div class="text-center">
										<button class="btn btn-block btn-round btn-d" type="submit">Subscribe</button>
									</div>
								</form>
								<div class="ajax-response font-alt" id="contactFormResponse"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
                <h4 class="font-alt mb-30">Our Expertises</h4>
                <h6 class="font-alt"><span class="icon-tools-2"></span> Development
                </h6>
                <div class="progress">
                  <div class="progress-bar pb-dark" aria-valuenow="60" role="progressbar" aria-valuemin="0" aria-valuemax="100"><span class="font-alt"></span></div>
                </div>
                <h6 class="font-alt"><span class="icon-strategy"></span> Branding
                </h6>
                <div class="progress">
                  <div class="progress-bar pb-dark" aria-valuenow="80" role="progressbar" aria-valuemin="0" aria-valuemax="100"><span class="font-alt"></span></div>
                </div>
                <h6 class="font-alt"><span class="icon-camera"></span> Photography
                </h6>
                <div class="progress">
                  <div class="progress-bar pb-dark" aria-valuenow="90" role="progressbar" aria-valuemin="0" aria-valuemax="100"><span class="font-alt"></span></div>
                </div>
                <h6 class="font-alt"><span class="icon-pencil"></span> Designing
                </h6>
                <div class="progress">
                  <div class="progress-bar pb-dark" aria-valuenow="70" role="progressbar" aria-valuemin="0" aria-valuemax="100"><span class="font-alt"></span></div>
                </div>
              </div>
				</div>
			</section>
			<!-- footer -->
			<jsp:include page="components/footer.jsp"></jsp:include>
			<!-- end footer -->
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
        JavaScripts
        =============================================
        -->
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/jquery/dist/jquery.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/wow/dist/wow.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/isotope/dist/isotope.pkgd.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/flexslider/jquery.flexslider.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/smoothscroll.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
        <script async="" defer="" src="<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1593.090492593102!2d105.5270643288268!3d21.01324996114719!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e1!3m2!1svi!2s!4v1646020727057!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/js/plugins.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/js/main.js"></script>
    </body>
</html>