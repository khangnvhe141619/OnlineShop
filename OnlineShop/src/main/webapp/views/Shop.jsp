<%@page import="java.text.NumberFormat"%>
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
        <title>Shop </title>
        <!--  lalala
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
        <script src="<%=request.getContextPath()%>/resources/common/js/script.js" type="text/javascript"></script>
        <!--  
        Stylesheets
        =============================================
        //ke 1 ty
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
        <link href="<%=request.getContextPath()%>/resources/common/assets/css/style3.css" rel="stylesheet">
        <link id="color-scheme" href="<%=request.getContextPath()%>/resources/common/assets/css/colors/default.css" rel="stylesheet">
        
    </head>
    <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<%
	NumberFormat nf = NumberFormat.getInstance();
	nf.setMinimumFractionDigits(0);
	%>
	<main>
            <div class="page-loader">
                <div class="loader">Loading...</div>
            </div>
		<!-- header -->
		<jsp:include page="components/header.jsp"></jsp:include>
		<!-- end header -->
		<div class="main">
                <section class="module bg-dark-60 shop-page-header" data-background="<%=request.getContextPath()%>/resources/common/images/sale.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">Shop Products</h2>
                                <div class="module-subtitle font-serif">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="module-small">
                    <div class="container">
                        <form name="myform" class="row" action="<%=request.getContextPath()%>/search" method="GET" onsubmit="return validate()">
                            <div class="col-sm-3 mb-sm-20">
                                <input class="form-control" type="text" name="name" placeholder="Find Product Name" value="${param.name}"/>
                            </div>
                            <div class="col-sm-3 mb-sm-20">
                                <select class="form-control" name="category">
                                    <option selected="selected" value="-1">All Type</option>
                                    <c:forEach items="${lsct}" var="t">
                                        <option ${cateid == t.categoryID ? "selected":"" } value="${t.categoryID}">${t.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-3 mb-sm-20">
                                <div class="col-sm-5 mb-sm-20">
                                <input class="form-control" type="text" name="to" placeholder="to" value="${param.to}"/>
                           		 </div>
                           		 <div class="col-sm-5 mb-sm-20">
                                <input class="form-control" type="text" name="end" placeholder="end" value="${param.end}"/>
                           		 </div>
                            </div>
                            <div class="col-sm-3">
                                <button class="btn btn-block btn-round btn-g" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                </section>
                <hr class="divider-w">
			
			<section class="module-small"> 
			<c:if test="${mess != null}">
				<p style="color: red; margin-left: 8%;">
					<%=request.getAttribute("mess")%></p>
			</c:if>                    
                    <div class="container">
                        <div class="row multi-columns-row">
                            <c:forEach items="${listp}" var="p">
                                <div class="col-sm-6 col-md-4 col-lg-4">
                                    <div class="shop-item">
                                        <div class="shop-item-image"><img style="width: 100%;height: 350px;" src="<%=request.getContextPath()%>/resources/common/images/products/${p.image}" alt="anh product"/>
                                            <div class="shop-item-detail"><a href="<%=request.getContextPath()%>/details?id=${p.productID}" class="btn btn-round btn-b"><span class="icon-basket">View Detail Product</span></a></div>
                                        </div>
                                        <h4 class="shop-item-title font-alt"><a href="#">${p.productName}</a></h4>
                                       
                                        <h5> <fmt:formatNumber type = "number" maxIntegerDigits = "10" value = "${p.price}" /> VND
                                        </h5>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="pagination font-alt " id="pagger">
                                  <a href="<%=request.getContextPath()%>/search?index=${tag-1==0?1:tag-1}&&category=${cate}&&name=${name}&&to=${to}&&end=${end}"><i class="fa fa-angle-left"></i></a>
                                   <c:forEach begin="1" end="${endpage }" var="i">
                                   		<a class="${tag == i ? "active" :"" }"  href="<%=request.getContextPath()%>/search?index=${i}&&category=${cate}&&name=${name}&&to=${to}&&end=${end}" >${i }</a>
                                   </c:forEach>
                                    <a href="<%=request.getContextPath()%>/search?index=${tag+1>endpage?tag:tag+1}&&category=${cate}&&name=${name}&&to=${to}&&end=${end}"><i class="fa fa-angle-right"></i></a>
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
        <script>
            pagger(${requestScope.pageindex},${requestScope.totalpage}, 2, "pagger","${param.name}", "${param.typeid}","${param.manuid}");

        </script>
        <script>
    	function validate() {
       	 var numto = document.myform.to.value;
       	 var numend = document.myform.end.value;
       	
        if (isNaN(numto) || isNaN(numend)) {
        	alert("please enter the number!!! ");
            return false;
        } else if(numto > numend) {
        	alert("please enter end > to ");
        	 return false;
        }else{
        	return true;
        }
    }
</script>
    </body>
</html>