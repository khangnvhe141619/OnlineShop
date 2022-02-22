<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Shop | Wishlist Page</title>

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
					<h2>Wishlist Page</h2>
					<ol class="breadcrumb">
						<li><a href="Index.jsp">Home</a></li>
						<li class="active">Wishlist</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->

	<!-- Cart view section -->
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table aa-wishlist-table">
							<form action="">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th></th>
												<th>Product</th>
												<th>Price</th>
												<th>Stock Status</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a class="remove" href="#"><fa
															class="fa fa-close"></fa></a></td>
												<td><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/man/polo-shirt-1.png"
														alt="img"></a></td>
												<td><a class="aa-cart-title" href="#">Polo T-Shirt</a></td>
												<td>$250</td>
												<td>In Stock</td>
												<td><a href="#" class="aa-add-to-cart-btn">Add To
														Cart</a></td>
											</tr>
											<tr>
												<td><a class="remove" href="#"><fa
															class="fa fa-close"></fa></a></td>
												<td><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/man/polo-shirt-2.png"
														alt="img"></a></td>
												<td><a class="aa-cart-title" href="#">Polo T-Shirt</a></td>
												<td>$150</td>
												<td>In Stock</td>
												<td><a href="#" class="aa-add-to-cart-btn">Add To
														Cart</a></td>
											</tr>
											<tr>
												<td><a class="remove" href="#"><fa
															class="fa fa-close"></fa></a></td>
												<td><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/man/polo-shirt-3.png"
														alt="img"></a></td>
												<td><a class="aa-cart-title" href="#">Polo T-Shirt</a></td>
												<td>$50</td>
												<td>In Stock</td>
												<td><a href="#" class="aa-add-to-cart-btn">Add To
														Cart</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / Cart view section -->


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