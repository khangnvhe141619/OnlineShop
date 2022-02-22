<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Shop | Product</title>

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
<!-- !Important notice -->
<!-- Only for product page body tag have to added .productPage class -->
<body class="productPage">
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
	<header id="aa-header">
		<!-- start header top  -->
		<div class="aa-header-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="aa-header-top-area">
							<!-- start header top left -->
							<div class="aa-header-top-left">
								<!-- start language -->
								<div class="aa-language">
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="#" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true"> <img
											src="<%=request.getContextPath()%>/resources/img/flag/english.jpg"
											alt="english flag">ENGLISH <span class="caret"></span>
										</a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/flag/french.jpg"
													alt="">FRENCH</a></li>
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/flag/english.jpg"
													alt="">ENGLISH</a></li>
										</ul>
									</div>
								</div>
								<!-- / language -->

								<!-- start currency -->
								<div class="aa-currency">
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="#" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true"> <i
											class="fa fa-usd"></i>USD <span class="caret"></span>
										</a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
											<li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
										</ul>
									</div>
								</div>
								<!-- / currency -->
								<!-- start cellphone -->
								<div class="cellphone hidden-xs">
									<p>
										<span class="fa fa-phone"></span>00-62-658-658
									</p>
								</div>
								<!-- / cellphone -->
							</div>
							<!-- / header top left -->
							<div class="aa-header-top-right">
								<ul class="aa-head-top-nav-right">
									<li><a href="Account-detail.jsp">My Account</a></li>
									<li class="hidden-xs"><a href="Wishlist.jsp">Wishlist</a></li>
									<li class="hidden-xs"><a href="Cart.jsp">My Cart</a></li>
									<li class="hidden-xs"><a href="Checkout.jsp">Checkout</a></li>
									<li><a href="" data-toggle="modal"
										data-target="#login-modal">Login</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- / header top  -->

		<!-- start header bottom  -->
		<div class="aa-header-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="aa-header-bottom-area">
							<!-- logo  -->
							<div class="aa-logo">
								<!-- Text based logo -->
								<a href="Index.jsp"> <span class="fa fa-shopping-cart"></span>
									<p>
										daily<strong>Shop</strong> <span>Your Shopping Partner</span>
									</p>
								</a>
								<!-- img based logo -->
								<!-- <a href="index.html"><img src="img/logo.jpg" alt="logo img"></a> -->
							</div>
							<!-- / logo  -->
							<!-- cart box -->
							<div class="aa-cartbox">
								<a class="aa-cart-link" href="#"> <span
									class="fa fa-shopping-basket"></span> <span
									class="aa-cart-title">SHOPPING CART</span> <span
									class="aa-cart-notify">2</span>
								</a>
								<div class="aa-cartbox-summary">
									<ul>
										<li><a class="aa-cartbox-img" href="#"><img
												src="<%=request.getContextPath()%>/resources/img/woman-small-2.jpg"
												alt="img"></a>
											<div class="aa-cartbox-info">
												<h4>
													<a href="#">Product Name</a>
												</h4>
												<p>1 x $250</p>
											</div> <a class="aa-remove-product" href="#"><span
												class="fa fa-times"></span></a></li>
										<li><a class="aa-cartbox-img" href="#"><img
												src="<%=request.getContextPath()%>/resources/img/woman-small-1.jpg"
												alt="img"></a>
											<div class="aa-cartbox-info">
												<h4>
													<a href="#">Product Name</a>
												</h4>
												<p>1 x $250</p>
											</div> <a class="aa-remove-product" href="#"><span
												class="fa fa-times"></span></a></li>
										<li><span class="aa-cartbox-total-title"> Total </span> <span
											class="aa-cartbox-total-price"> $500 </span></li>
									</ul>
									<a class="aa-cartbox-checkout aa-primary-btn" href="#">Checkout</a>
								</div>
							</div>
							<!-- / cart box -->
							<!-- search box -->
							<div class="aa-search-box">
								<form action="">
									<input type="text" name="" id=""
										placeholder="Search here ex. 'man' ">
									<button type="submit">
										<span class="fa fa-search"></span>
									</button>
								</form>
							</div>
							<!-- / search box -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- / header bottom  -->
	</header>
	>>>>>>> dungha
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
					<h2>Fashion</h2>
					<ol class="breadcrumb">
						<li><a href="Index.jsp">Home</a></li>
						<li class="active">Women</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->

	<!-- product category -->
	<section id="aa-product-category">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
					<div class="aa-product-catg-content">
						<div class="aa-product-catg-head">
							<div class="aa-product-catg-head-left">
								<form action="" class="aa-sort-form">
									<label for="">Sort by</label> <select name="">
										<option value="1" selected="Default">Default</option>
										<option value="2">Name</option>
										<option value="3">Price</option>
										<option value="4">Date</option>
									</select>
								</form>
								<form action="" class="aa-show-form">
									<label for="">Show</label> <select name="">
										<option value="1" selected="12">12</option>
										<option value="2">24</option>
										<option value="3">36</option>
									</select>
								</form>
							</div>
							<div class="aa-product-catg-head-right">
								<a id="grid-catg" href="#"><span class="fa fa-th"></span></a> <a
									id="list-catg" href="#"><span class="fa fa-list"></span></a>
							</div>
						</div>
						<div class="aa-product-catg-body">
							<ul class="aa-product-catg">
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-1.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">This is Title</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-2.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-sold-out"
									href="#">Sold Out!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-3.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-4.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-hot" href="#">HOT!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-5.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-6.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-7.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-1.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-sold-out"
									href="#">Sold Out!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-1.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">This is Title</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-2.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-sold-out"
									href="#">Sold Out!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-3.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-4.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div> <!-- product badge --> <span class="aa-badge aa-hot" href="#">HOT!</span>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-5.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>

									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div>
								</li>
								<!-- start single product item -->
								<li>
									<figure>
										<a class="aa-product-img" href="#"><img
											src="<%=request.getContextPath()%>/resources/img/women/girl-6.png"
											alt="polo shirt img"></a>
										<a class="aa-add-card-btn" href="#"><span
											class="fa fa-shopping-cart"></span>Add To Cart</a>
										<figcaption>
											<h4 class="aa-product-title">
												<a href="#">Lorem ipsum doller</a>
											</h4>
											<span class="aa-product-price">$45.50</span><span
												class="aa-product-price"><del>$65.50</del></span>
											<p class="aa-product-descrip">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit. Numquam accusamus facere
												iusto, autem soluta amet sapiente ratione inventore nesciunt
												a, maxime quasi consectetur, rerum illum.</p>
										</figcaption>
									</figure>
									<div class="aa-product-hvr-content">
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
										<a href="#" data-toggle="tooltip" data-placement="top"
											title="Compare"><span class="fa fa-exchange"></span></a> <a
											href="#" data-toggle2="tooltip" data-placement="top"
											title="Quick View" data-toggle="modal"
											data-target="#quick-view-modal"><span
											class="fa fa-search"></span></a>
									</div>
								</li>
							</ul>
							<!-- quick view modal -->
							<div class="modal fade" id="quick-view-modal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<div class="row">
												<!-- Modal view slider -->
												<div class="col-md-6 col-sm-6 col-xs-12">
													<div class="aa-product-view-slider">
														<div class="simpleLens-gallery-container" id="demo-1">
															<div class="simpleLens-container">
																<div class="simpleLens-big-image-container">
																	<a class="simpleLens-lens-image"
																		data-lens-image="<%=request.getContextPath()%>/resources/img/view-slider/large/polo-shirt-1.png">
																		<img
																		src="<%=request.getContextPath()%>/resources/img/view-slider/medium/polo-shirt-1.png"
																		class="simpleLens-big-image">
																	</a>
																</div>
															</div>
															<div class="simpleLens-thumbnails-container">
																<a href="#" class="simpleLens-thumbnail-wrapper"
																	data-lens-image="<%=request.getContextPath()%>/resources/img/view-slider/large/polo-shirt-1.png"
																	data-big-image="<%=request.getContextPath()%>/resources/img/view-slider/medium/polo-shirt-1.png">
																	<img
																	src="<%=request.getContextPath()%>/resources/img/view-slider/thumbnail/polo-shirt-1.png">
																</a> <a href="#" class="simpleLens-thumbnail-wrapper"
																	data-lens-image="<%=request.getContextPath()%>/resources/img/view-slider/large/polo-shirt-3.png"
																	data-big-image="<%=request.getContextPath()%>/resources/img/view-slider/medium/polo-shirt-3.png">
																	<img
																	src="<%=request.getContextPath()%>/resources/img/view-slider/thumbnail/polo-shirt-3.png">
																</a> <a href="#" class="simpleLens-thumbnail-wrapper"
																	data-lens-image="<%=request.getContextPath()%>/resources/img/view-slider/large/polo-shirt-4.png"
																	data-big-image="<%=request.getContextPath()%>/resources/img/view-slider/medium/polo-shirt-4.png">
																	<img
																	src="<%=request.getContextPath()%>/resources/img/view-slider/thumbnail/polo-shirt-4.png">
																</a>
															</div>
														</div>
													</div>
												</div>
												<!-- Modal view content -->
												<div class="col-md-6 col-sm-6 col-xs-12">
													<div class="aa-product-view-content">
														<h3>T-Shirt</h3>
														<div class="aa-price-block">
															<span class="aa-product-view-price">$34.99</span>
															<p class="aa-product-avilability">
																Avilability: <span>In stock</span>
															</p>
														</div>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit. Officiis animi, veritatis quae repudiandae quod
															nulla porro quidem, itaque quis quaerat!</p>
														<h4>Size</h4>
														<div class="aa-prod-view-size">
															<a href="#">S</a> <a href="#">M</a> <a href="#">L</a> <a
																href="#">XL</a>
														</div>
														<div class="aa-prod-quantity">
															<form action="">
																<select name="" id="">
																	<option value="0" selected="1">1</option>
																	<option value="1">2</option>
																	<option value="2">3</option>
																	<option value="3">4</option>
																	<option value="4">5</option>
																	<option value="5">6</option>
																</select>
															</form>
															<p class="aa-prod-category">
																Category: <a href="#">Polo T-Shirt</a>
															</p>
														</div>
														<div class="aa-prod-view-bottom">
															<a href="#" class="aa-add-to-cart-btn"><span
																class="fa fa-shopping-cart"></span>Add To Cart</a> <a
																href="#" class="aa-add-to-cart-btn">View Details</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- / quick view modal -->
						</div>
						<div class="aa-product-catg-pagination">
							<nav>
								<ul class="pagination">
									<li><a href="#" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<!-- category -->
				<jsp:include page="components/left.jsp"></jsp:include>
				<!--  -->
			</div>
		</div>
	</section>
	<!-- / product category -->


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
