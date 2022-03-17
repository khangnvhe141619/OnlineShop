<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/resources/admin/plugins/images/icon.png">
<title>Company Admin | List products</title>
<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- morris CSS -->
<link
	href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet">
<!-- animation CSS -->
<link
	href="<%=request.getContextPath()%>/resources/admin/css/animate.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
<!-- color CSS -->
<link
	href="<%=request.getContextPath()%>/resources/admin/css/colors/blue.css"
	id="theme" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- Navigation -->
		<jsp:include page="components/A-Header.jsp"></jsp:include>
		<!-- Navigation end-->
		<!-- Left navbar-header -->
		<jsp:include page="components/A-Left.jsp"></jsp:include>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title"></h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<ol class="breadcrumb">
							<li><a href="<%=request.getContextPath()%>/aHomeController">Dashboard</a></li>
							<li class="active">Coupon</li>
						</ol>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- row -->
				<div class="row">
					<!-- Left sidebar -->
					<div class="col-md-12">
						<div class="white-box">
							<!-- row -->
							<div class="row">
								<h4>
									List Of Coupons (<b style="color: orange;">
										${count }</b>)
								</h4>

								<div class="col-lg-12 col-md-9 col-sm-12 col-xs-12 mail_listing">
									<p style="color: red; margin-left: 40px">
										<%=request.getAttribute("mess") != null ? request.getAttribute("mess") : ""%></p>
									<div class="inbox-center">
										<table class="table table-hover">
											<thead>
												<tr>
													<th style="width: 10%;">No.</th>
													<th>CODE</th>
													<th>DESCRIPTION</th>
													<th>PERCENT</th>
													<th>QUANTITY</th>
													<th>ACTION</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${listp }" var="i">
													<tr>

														<td class="max-texts">${i.stt }</td>
														<td class="max-texts">${i.couponId }</td>
														<td class="max-texts">${i.discountDesc }</td>
														<td class="max-texts">${i.discountPercent }</td>
														<td class="max-texts">${i.quantity }</td>


														<td class="">  <a href="<%=request.getContextPath() %>/AEditCoupon?index=${i.couponId}" ><i class="fa fa-edit" aria-hidden="true"></i></a> 
																<a style="margin-left: 5%;" href="<%=request.getContextPath() %>/ADeleteCouponControler?index=${i.couponId}" onclick="return testConfirmDialog()"><i style="color: red;" class="fa fa-trash" aria-hidden="true"></i></a> 
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="row">
										<div class="col-xs-7 m-t-20">
											Showing <a>${tag }</a> - <a>${endpage }</a>
										</div>
										<div class="col-xs-5 m-t-20">
											<div class="btn-group pull-right">
												<form class="form" role="form"
													action="<%=request.getContextPath()%>/AlistCoupon?index=${tag-1==0?1:tag-1}"
													method="post">
													<button type="submit" class="btn btn-default waves-effect">
														<i class="fa fa-chevron-left"></i>
													</button>
												</form>
												<form class="form" role="form"
													action="<%=request.getContextPath()%>/AlistCoupon?index=${tag==endPage?tag:tag+1}"
													method="post">
													<button type="submit" class="btn btn-default waves-effect">
														<i class="fa fa-chevron-right"></i>
													</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>
				<!-- /.row -->
				<!-- .right-sidebar -->
				<div class="right-sidebar">
					<div class="slimscrollright">
						<div class="rpanel-title">
							Service Panel <span><i class="ti-close right-side-toggle"></i></span>
						</div>
						<div class="r-panel-body">
							<ul>
								<li><b>Layout Options</b></li>
								<li>
									<div class="checkbox checkbox-info">
										<input id="checkbox1" type="checkbox" class="fxhdr"> <label
											for="checkbox1"> Fix Header </label>
									</div>
								</li>
								<li>
									<div class="checkbox checkbox-warning">
										<input id="checkbox2" type="checkbox" checked="" class="fxsdr">
										<label for="checkbox2"> Fix Sidebar </label>
									</div>
								</li>
								<li>
									<div class="checkbox checkbox-success">
										<input id="checkbox4" type="checkbox" class="open-close">
										<label for="checkbox4"> Toggle Sidebar </label>
									</div>
								</li>
							</ul>
							<ul id="themecolors" class="m-t-20">
								<li><b>With Light sidebar</b></li>
								<li><a href="javascript:void(0)" theme="default"
									class="default-theme">1</a></li>
								<li><a href="javascript:void(0)" theme="green"
									class="green-theme">2</a></li>
								<li><a href="javascript:void(0)" theme="gray"
									class="yellow-theme">3</a></li>
								<li><a href="javascript:void(0)" theme="blue"
									class="blue-theme working">4</a></li>
								<li><a href="javascript:void(0)" theme="purple"
									class="purple-theme">5</a></li>
								<li><a href="javascript:void(0)" theme="megna"
									class="megna-theme">6</a></li>
								<li><b>With Dark sidebar</b></li>
								<br />
								<li><a href="javascript:void(0)" theme="default-dark"
									class="default-dark-theme">7</a></li>
								<li><a href="javascript:void(0)" theme="green-dark"
									class="green-dark-theme">8</a></li>
								<li><a href="javascript:void(0)" theme="gray-dark"
									class="yellow-dark-theme">9</a></li>
								<li><a href="javascript:void(0)" theme="blue-dark"
									class="blue-dark-theme">10</a></li>
								<li><a href="javascript:void(0)" theme="purple-dark"
									class="purple-dark-theme">11</a></li>
								<li><a href="javascript:void(0)" theme="megna-dark"
									class="megna-dark-theme">12</a></li>
							</ul>

						</div>
					</div>
				</div>
				<!-- /.right-sidebar -->
			</div>
			<!-- /.container-fluid -->
			<jsp:include page="components/A-Footer.jsp"></jsp:include>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/js/tether.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/resources/admin/js/waves.js"></script>
	<!-- Custom Theme JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/js/custom.min.js"></script>
	<!--Style Switcher -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
	<script type="text/javascript">
		function testConfirmDialog() {

			var result = confirm("Do you want to continue?");

			if (result) {
				return true;
			} else {
				return false;
			}
		}
	</script>

</body>

</html>