<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <title>Product Detail</title>
        <!--  
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
        <link href="<%=request.getContextPath()%>/resources/common/css/starability-all.min.css" rel="stylesheet" type="text/css"/>
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
                <section class="module" style="padding-top: 0px">
                    <div class="container">
                        <div class="row">
                             <div class="shop-item-detail"><a href="<%=request.getContextPath()%>/details?id=${p.productID}" class="btn btn-round btn-b"><span class="icon-basket">View Detail Product</span></a></div>
                                
                            </div>
                            <div class="col-sm-6" style="padding-top: 100px">
                                <div class="row">
                                    <div class="col-sm-12">

                                        <h1 class="product-title font-alt" >${p.productName}</h1>
                                    </div>
                                </div>
                                    <div class="starability-result" data-rating="${p.price}"> </div>
                                <div class="row mb-20">
                                    <div class="col-sm-12">
                                        <div class="price font-alt"><span class="amount">${p.price}</span></div>
                                    </div>
                                </div>
                                <div class="row mb-20">
                                    <div class="col-sm-12">
                                        <div class="description">
                                            <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-20">
                                    <form action="addcart" method="POST">
                                        <div class="col-sm-4 mb-sm-20">
                                            <input class="form-control input-lg" type="number" name="quantity" value="1" max="40" min="1" required="required"/>
                                        </div>
                                        <div class="col-sm-8">
                                            <input type="hidden" name="id" value="${p.productID}"/>
                                            <input class="btn btn-lg btn-block btn-round btn-b" type="submit" value="Add To Cart"/>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                        <div class="row mt-70">
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs font-alt" role="tablist">
                                    <li class="active"><a href="#reviews" data-toggle="tab"><span class="icon-tools-2"></span>Reviews </a></li>
                                    <li><a href="#description" data-toggle="tab"><span class="icon-tools-2"></span>Description</a></li>
                                    <li><a href="#data-sheet" data-toggle="tab"><span class="icon-tools-2"></span>Data sheet</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="reviews">
                                        <div class="comments reviews">
                                            <c:forEach items="" var="r">
                                                <div class="comment clearfix">
                                                    <div class="comment-avatar"><img src="" /></div>
                                                    <div class="comment-content clearfix">
                                                        <div class="comment-author font-alt"><a href=""> </a></div>
                                                        <div class="comment-body">
                                                           
                                                        </div>
                                                        <div class="starability-result" data-rating=""> </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="comment-form mt-30">
                                            <h4 class="comment-form-title font-alt">Add review</h4>
                                            <form method="GET" action="addreview">

                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <textarea class="form-control" id="" name="content" rows="4" placeholder="Review"> </textarea>
                                                        </div>
                                                    </div>
                                                    <c:if test="" >
                                                        <h5 style="color:red"></h5>
                                                    </c:if>
                                                    <div class="col-sm-12">
                                                        <fieldset class="starability-basic">
                                                            <h3>Your Rating:</h3>
                                                            <input type="radio" id="rate1" name="rating" value="1" />
                                                            <label for="rate1">1 star.</label>

                                                            <input type="radio" id="rate2" name="rating" value="2" />
                                                            <label for="rate2">2 stars.</label>

                                                            <input type="radio" id="rate3" name="rating" value="3" />
                                                            <label for="rate3">3 stars.</label>

                                                            <input type="radio" id="rate4" name="rating" value="4" />
                                                            <label for="rate4">4 stars.</label>

                                                            <input type="radio" checked="true" id="rate5" name="rating" value="5" />
                                                            <label for="rate5">5 stars.</label>

                                                            <span class="starability-focus-ring"></span>
                                                        </fieldset>
                                                        <br><br>
                                                        <input type="hidden" name="id" value=""/>
                                                        <input type="submit" class="btn btn-round btn-d" value="Submit Review" >
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="description">
                                        <p>${p.description }</p>
                                    </div>
                                    <div class="tab-pane" id="data-sheet">
                                        <table class="table table-striped ds-table table-responsive">
                                            <tbody>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Infor</th>
                                                </tr>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>${p.productName}</td>
                                                </tr>
                                                <tr>
                                                    <td>Isussing Company</td>
                                                    <td>${p.issuingCompany }</td>
                                                </tr>
                                                <tr>
                                                    <td>publishingCompany</td>
                                                    <td>${p.publishingCompany }</td>
                                                </tr>
                                                <tr>
                                                    <td>quantity</td>
                                                    <td>${p.quantity }</td>
                                                </tr>
                                                <tr>
                                                    <td>publicationDate</td>
                                                    <td>${p.publicationDate }</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <hr class="divider-w">
                 <!-- footer -->
                <jsp:include page="components/footer.jsp"></jsp:include>
                <!-- end footer -->
            </div>
            <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
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
        <script src="<%=request.getContextPath()%>/resources/common/assets/js/plugins.js"></script>
        <script src="<%=request.getContextPath()%>/resources/common/assets/js/main.js"></script>
    </body>
</html>