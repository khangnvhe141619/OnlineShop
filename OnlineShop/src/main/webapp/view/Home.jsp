<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Default stylesheets-->
        <link href="assets2/lib/flexslider/flexslider.css" rel="stylesheet">
        <link href="assets2/css3/style.css" rel="stylesheet">

    </head>
    <body style="background: #030303">
        <!--begin of menu-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark" style="background: url('images/car6.jpg')">
            <div class="container">
                <a class="navbar-brand" href="home"><img src="images/car.png" style="width: 140px; height: 50px "alt=""/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto" style="font-size: 17px">
                        <li class="nav-item">
                            <a class="nav-link" href="home" style="color:white">Home</a>    
                        </li>
                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="managerAccount">Manager Account</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="managerProduct">Manager Product</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.isSell == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="managerProduct">Manager Product</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="InfoAccount.jsp">Hello ${sessionScope.acc.user}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Login.jsp" style="color:white">Login</a>
                            </li>
                        </c:if>

                    </ul>

                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3"  href="cart">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge badge-light">3</span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <section class="home-section home-fade home-full-height" id="home" >
            <div class="hero-slider">
                <ul class="slides">
                    <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;images/car10.jpg&quot;);">
                        <div class="titan-caption">
                            <div class="caption-content">
                                <div class="font-alt mb-30 titan-title-size-1">WELCOME</div>
                                <div class="font-alt mb-30 titan-title-size-4">VIATO STORE</div>
                            </div>
                        </div>
                    </li>
                    <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;images/car11.jpg&quot;);">
                        <div class="titan-caption">
                            <div class="caption-content">
                                <div class="font-alt mb-30 titan-title-size-1">WELCOME</div>
                                <div class="font-alt mb-30 titan-title-size-4"> VIATO STORE</div>
                                <div class="font-alt mb-40 titan-title-size-1">YOUR ONLINE LUXURY CAR DESTINATION</div><a class="section-scroll btn btn-border-w btn-round" href="http://localhost:8080/Project_banhang/detail?pid=12">Learn More</a>
                            </div>
                        </div>
                    </li>
                    <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;images/car12.jpg&quot;);">
                        <div class="titan-caption">
                            <div class="caption-content">
                                <div class="font-alt mb-30 titan-title-size-1">WELCOME</div>
                                <div class="font-alt mb-30 titan-title-size-4"> VIATO STORE</div>
                                <div class="font-alt mb-40 titan-title-size-1">YOUR ONLINE LUXURY CAR DESTINATION</div><a class="section-scroll btn btn-border-w btn-round" href="http://localhost:8080/Project_banhang/detail?pid=7">Learn More</a>
                            </div>
                        </div>
                    </li>
                    <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;images/car13.jpg&quot;);">
                        <div class="titan-caption">
                            <div class="caption-content">
                                <div class="font-alt mb-30 titan-title-size-1">WELCOME</div>
                                <div class="font-alt mb-30 titan-title-size-4"> VIATO STORE</div>
                                <div class="font-alt mb-40 titan-title-size-1">YOUR ONLINE LUXURY CAR DESTINATION</div><a class="section-scroll btn btn-border-w btn-round" href="http://localhost:8080/Project_banhang/detail?pid=4">Learn More</a>
                            </div>
                        </div>
                    </li>
                    <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;images/car14.jpg&quot;);">
                        <div class="titan-caption">
                            <div class="caption-content">
                                <div class="font-alt mb-30 titan-title-size-1"> This is Titan</div>
                                <div class="font-alt mb-40 titan-title-size-4">Exclusive products</div><a class="section-scroll btn btn-border-w btn-round" href="http://localhost:8080/Project_banhang/detail?pid=9">Learn More</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!--end of menu-->
        <div class="container" style="background: #030303">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="http://localhost:8080/Project_banhang/category?cid=1">Category</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container" style="background: #030303">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCC}" var="o">
                                <li class="list-group-item text-white ${tag == o.cid ? "active" : ""}"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div  class="card-header bg-success text-white text-uppercase" >New product</div>
                        <div class="card-body" style="">
                            <img class="img-fluid" src="${p.image}" />
                            <h5 class="card-title">${p.name}</h5>
                            <p class="card-text">${p.title}</p>
                            <div class="ratings" style="color: yellow">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                            </div>
                            <p class="bloc_left_price">$${p.price} </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-9" >
                    <div class="row" >
                        <c:forEach items="${listPT}" var="o">
                            <div class="col-12 col-md-6 col-lg-4" >
                                <div class="card">
                                    <img class="card-img-top" style="height: 170px"src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="ratings" style="color: yellow">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </div>
                                        <div class="product-meta-data">
                                            <div class="line"></div>
                                            <p class="product-price" style="font-size: 25px; color: #843534">$${o.price}</p>
                                        </div>
                                        <div class="cart">
                                            <a href="cart?cid=${o.id}" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="images/cart.png" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>  
            </div>
            <div class="clearfix">
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${endPage}">
                        <li class="page-item  ${i == PTid ? "active":"" }"><a href="home?PTid=${i}" class="page-link">${i}</a></li>    
                        </c:forEach>
                </ul>
            </div>
            <div class="clearfix">
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${endPageSearch}">
                        <li class="page-item  ${i == PTidSearch ? "active":"" }"><a href="search?PTidSearch=${i}&txt=${txtS}" class="page-link">${i}</a></li>    
                        </c:forEach>
                </ul>
            </div>
            <div class="clearfix">
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${endPageCate}">
                        <li class="page-item  ${i == PTidCate ? "active":"" }"><a href="category?PTidCate=${i}&cid=${cateID}" class="page-link">${i}</a></li>    
                        </c:forEach>
                </ul>
            </div>
        </div>
        <div class="module-small bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="widget">
                            <h5 class="widget-title font-alt">About Titan</h5>
                            <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                            <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                            <p>Email:<a href="#">somecompany@example.com</a></p>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="widget">
                            <h5 class="widget-title font-alt">Recent Comments</h5>
                            <ul class="icon-list">
                                <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                                <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                                <li>Andy on <a href="#">Eco bag Mockup</a></li>
                                <li>Jack on <a href="#">Bottle Mockup</a></li>
                                <li>Mark on <a href="#">Our trip to the Alps</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="widget">
                            <h5 class="widget-title font-alt">Blog Categories</h5>
                            <ul class="icon-list">
                                <li><a href="#">Photography - 7</a></li>
                                <li><a href="#">Web Design - 3</a></li>
                                <li><a href="#">Illustration - 12</a></li>
                                <li><a href="#">Marketing - 1</a></li>
                                <li><a href="#">Wordpress - 16</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="widget">
                            <h5 class="widget-title font-alt">Popular Posts</h5>
                            <ul class="widget-posts">
                                <li class="clearfix">
                                    <div class="widget-posts-image"><a href="#"><img src="images/car8.jpg" alt="Post Thumbnail"/></a></div>
                                    <div class="widget-posts-body">
                                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                                        <div class="widget-posts-meta">23 january</div>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="widget-posts-image"><a href="#"><img src="images/car11.jpg" alt="Post Thumbnail"/></a></div>
                                    <div class="widget-posts-body">
                                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                                        <div class="widget-posts-meta">15 February</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
                    </div>
                    <div class="col-sm-6">
                        <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="assets2/lib/wow/dist/wow.js"></script>
        <script src="assets2/lib/flexslider/jquery.flexslider.js"></script>
        <script src="assets2/js/main.js"></script>
    </body>
</html>

