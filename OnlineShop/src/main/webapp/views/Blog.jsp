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
    <title>Blog</title>
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
        <section class="module bg-dark-60 blog-page-header" data-background="<%=request.getContextPath()%>/resources/common/assets/images/blog_bg.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Blog Standard</h2>
                <div class="module-subtitle font-serif">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module">      
          <div class="container">
					<c:if test="${error}">
						<div style="margin-bottom: 3%; font-size: 20px; color: red;">Please
							select the topic you want to search for :v</div>
					</c:if>
					<c:if test="${result == 0}">
						<div style="margin-bottom: 3%; font-size: 20px; color: red;">No
							result :v</div>
					</c:if>
					<c:if test="${result > 0 && isPaging == 0}">
						<div style="margin-bottom: 3%; font-size: 20px; color: red;">There
							are ${result} results related to "${search}"</div>
					</c:if>
					<div class="row">                       
              <div class="col-sm-8">                                   
                   <c:forEach items="${lstPost}" var="pst">
							<div class="post">								
									<div class="post-images-slider">
										<ul class="slides">
											<li><img
												src="<%=request.getContextPath()%>/resources/common/assets/images/post-1.jpg"
												alt="Blog Slider Image" /></li>
											<li><img
												src="<%=request.getContextPath()%>/resources/common/assets/images/post-3.jpg"
												alt="Blog Slider Image" /></li>
										</ul>
									</div>

									<div class="post-header font-alt">
										<h2 class="post-title">
											<a href="#">${pst.title}</a>
										</h2>
										<div class="post-meta">
											By&nbsp;<a href="#">${pst.authorName}</a>| ${pst.createdDate} | 3
											Comments | <a href="#">Marketing, </a><a href="#">Web
												Design</a>
										</div>
									</div>
									<div class="post-entry">
										<p>${pst.shortDesc}</p>
									</div>
									<div class="post-more">
										<a class="more-link" href="#">Read more</a>
									</div>								
							</div>
							</c:forEach>
						<c:if test="${result > 0}">
							<div class="pagination font-alt">							
							<c:if test="${check == 0}">
								<div class="pagination">
									<c:if test="${tag == 1}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/listPostController?page=1">&laquo;Pre</a>
										</li>
									</c:if>
									<c:if test="${tag != 1}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/listPostController?page=${tag-1}">&laquo;Pre</a>
										</li>
									</c:if>
									<c:forEach begin="1" end="${total}" var="i">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/listPostController?page=${i}"
											class="nar-item ${tag == i? ' active ' : ''}">${i}</a></li>
									</c:forEach>
									<c:if test="${tag != total}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/listPostController?page=${tag+1}">Next
												&raquo;</a></li>
									</c:if>
									<c:if test="${tag == total}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/listPostController?page=${total}">Next
												&raquo;</a>
									</c:if>
								</div>
							</c:if>
							<c:if test="${check == 1}">
								<div class="pagination">
									<c:if test="${tag == 1}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/searchPostController?page=1">&laquo;Pre</a>
										</li>
									</c:if>
									<c:if test="${tag != 1}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/searchPostController?page=${tag - 1}">&laquo;Pre</a>
										</li>
									</c:if>
									<c:forEach begin="1" end="${total}" var="i">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/searchPostController?page=${i}"
											class="${tag == i? "active":""}">${i}</a></li>
									</c:forEach>
									<c:if test="${tag != total}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/searchPostController?page=${tag + 1}">Next
												&raquo;</a></li>
									</c:if>
									<c:if test="${tag == total}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/searchPostController?page=${total}">Next
												&raquo;</a>
									</c:if>
								</div>
							</c:if>
							</div>
						</c:if>
							
						</div>
						
              <!-- Right side bar -->
              <div class="col-sm-4 col-md-3 col-md-offset-1 sidebar">
                <div class="widget">
								<form role="form" action="<%=request.getContextPath()%>/searchPostController" method="POST">
									<div class="">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fa fa-filter"
												aria-hidden="true"> Filter By</i></span>
										</div>
										<select style="margin-bottom: 5%;" class="form-control" name="select">
											<option value="pChoose" selected="selected">------ Choose ------</option>
											<option value="pTitle">Title</option>
											<option value="pAuthor">Author</option>
											<option value="pTag">Tag</option>
										</select>
									</div>

									<div class="search-box">
										<input class="form-control" type="text" name=search value="${search}" 
											placeholder="Search..." />
										<button class="search-btn" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</form>
							</div>               
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <c:forEach items="${lstPost}" var="pst">
                  <ul class="widget-posts">                                           
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="<%=request.getContextPath()%>/resources/common/assets/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">${pst.title}</a></div>
                        <div class="widget-posts-meta">${pst.authorName}</div>
                      </div>
                    </li>                   
                  </ul>
                  </c:forEach>
                </div>
							<div class="widget">
								<h5 class="widget-title font-alt">Tag</h5>
								<div class="tags font-serif">
									<a href="#" rel="tag">Blog</a><a href="#" rel="tag">Photo</a><a
										href="#" rel="tag">Video</a><a href="#" rel="tag">Image</a><a
										href="#" rel="tag">Minimal</a><a href="#" rel="tag">Post</a><a
										href="#" rel="tag">Theme</a><a href="#" rel="tag">Ideas</a><a
										href="#" rel="tag">Tags</a><a href="#" rel="tag">Bootstrap</a><a
										href="#" rel="tag">Popular</a><a href="#" rel="tag">English</a>
								</div>
							</div>
				</div>
              <!-- Right side bar end -->
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
  </body>
</html>