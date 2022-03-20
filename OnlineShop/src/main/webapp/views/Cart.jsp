<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Cart </title>

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
        kiem commit
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
            <div class="main">
                <section class="module">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h1 class="module-title font-alt">Checkout</h1>
                            </div>
                        </div>
                        <hr class="divider-w pt-20">
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-striped table-border checkout-table">
                                    <!--<tbody>-->
                                    <tr>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Remove</th>
                                    </tr>
                                    <c:forEach items="${sessionScope.items}" var="i">
                                        <tr>
                                            <td><a href="#"><img src="<%=request.getContextPath()%>/resources/common/images/products/${i.product.image}"/></a></td>
                                            <td>
                                                <h5 class="product-title font-alt"><a href="<%=request.getContextPath()%>/details?id=${i.product.productID}">${i.product.productName}</a></h5>
                                            </td>
                                            <td class="hidden-xs">
                                                <h5 class="product-title font-alt"><fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${i.product.price}" /> VND</h5>
                                            </td>
                                            <td>
                                                <!--<input type="button" value=" - " onclick="remove(${i.product.productID})" />-->
                                                <a style="border: ridge  1px; padding: 5px" href="<%=request.getContextPath()%>/addCart?id=${i.product.productID}&quantity=-1" >-</a>
                                                <input  type="text" disabled="true" name="" value="${i.quantity}" style="width: 60px"/>
                                                <a style="border: ridge  1px; padding: 5px" href="<%=request.getContextPath()%>/addCart?id=${i.product.productID}&quantity=1" >+</a>
                                                <!--<input  type="button" value=" + " onclick="updown(${i.product.productID},1)"  />-->
                                            </td>
                                            <td>
                                                <h5 class="product-title font-alt"> <fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${i.quantity * i.product.price}" /> VND</h5>
                                            </td>
                                            <td class="pr-remove"><a href="<%=request.getContextPath()%>/addCart?id=${i.product.productID}&quantity=${0-i.quantity}" title="Remove"><i class="fa fa-times"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                    <!--</tbody>-->
                                </table>
                            </div>
                        </div>
					<div class="row">
					<form action="<%=request.getContextPath()%>/applyCouponController" method="POST">
					<div class="col-sm-3">
							<div class="form-group">
								<input class="form-control" type="text" id="" name="couponCode" value="${cCode}"
									placeholder="Coupon code" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<c:if test="${sessionScope.items == null}">
							<button class="btn btn-round btn-g" type="submit" disabled="disabled">Apply</button>
							</c:if>
							<c:if test="${sessionScope.items != null}">
							<button class="btn btn-round btn-g" type="submit">Apply</button>
							</c:if>
								
							</div>
						</div>
					</form>					
						<div class="col-sm-3 col-sm-offset-3">
							<div class="form-group">
								<input class="btn btn-block btn-round btn-g pull-right" value="${mess}"
									type="text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<hr class="divider-w">
                        <div class="row mt-70">
                            <div class="col-sm-5 col-sm-offset-7">
                                <div class="shop-Cart-totalbox">
                                    <h4 class="font-alt">Cart Total</h4>
                                    <table class="table table-striped table-border checkout-table">
                                        <tbody>
                                            <tr>
                                                <th>Cart Subtotal :</th>
                                                <td><fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${sessionScope.total}" /> VND</td>
                                            </tr>
                                            <c:if test="${coupon == null}">
                                            <tr>
                                                <th>VAT (10%) :</th>
                                                <td><fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${sessionScope.total  * 0.1}" /> VND</td>
                                            </tr>
                                            <tr class="shop-Cart-totalprice">
                                                <th>Total :</th>
                                                <td> <fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${sessionScope.total * 0.1 + sessionScope.total}" /> VND</td>
                                            </tr>
                                            </c:if> 
                                            <c:if test="${coupon != null}">
                                            <tr>
                                            	<th>Discount :</th>
                                                <td><fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${coupon.discountPercent}" /> % 
                                               <a href="<%=request.getContextPath()%>/removeCouponController"><button style="margin-left: 50%; color: red;" class=" btn-g" type="submit" >X</button></a> </td>
                                                
                                            </tr>
                                            <tr>
                                                <th>Subtotal :</th>
                                                <td><fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${sessionScope.total - (sessionScope.total * coupon.discountPercent / 100)}" /> VND</td>
                                            </tr>
                                            <tr>
                                                <th>VAT (10%) :</th>
                                                <td><fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${(sessionScope.total - (sessionScope.total * coupon.discountPercent / 100)) * 0.1}" /> VND</td>
                                            </tr>
                                            <tr class="shop-Cart-totalprice">
                                                <th>Total :</th>
                                                <td> <fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${(sessionScope.total - (sessionScope.total * coupon.discountPercent / 100)) + ((sessionScope.total - (sessionScope.total * coupon.discountPercent / 100)) * 0.1)}" /> VND</td>
                                            </tr> 
                                            </c:if>                                                                                                                                                                     
                                        </tbody>
                                    </table>
                                    <c:if test="${requestScope.error != null}" >
                                        <h5 style="color:red">${requestScope.error}</h5>
                                    </c:if>
								<c:if
									test="${sessionScope.items == null or sessionScope.acc.role != 2}">	
										<input class="btn btn-lg btn-block btn-round btn-b" type="submit" value="Proceed to
										Checkout" disabled="disabled"/>
								</c:if>
								<c:if
									test="${sessionScope.items != null and sessionScope.acc.role == 2}">
									<a href="<%=request.getContextPath()%>/checkOutController"
										class="btn btn-lg btn-block btn-round btn-d">Proceed to
										Checkout</a>

								</c:if>
							</div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- footer -->
                <jsp:include page="components/footer.jsp"></jsp:include>
                <!-- end footer -->
            </div>
            <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
        </main>
        <style>
            .pl{
                border: 1px;
            }
        </style>
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
        <script src="<%=request.getContextPath()%>/resources/common/assets/js/plugins.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/js/main.js"></script>
    </body>
</html>