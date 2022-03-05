<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="<%=request.getContextPath()%>/resources/common/assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="<%=request.getContextPath()%>/resources/common/assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="<%=request.getContextPath()%>/resources/common/assets/images/rp-3.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Eco bag Mockup</a></div>
                        <div class="widget-posts-meta">21 February</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="<%=request.getContextPath()%>/resources/common/assets/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Bottle Mockup</a></div>
                        <div class="widget-posts-meta">2 March</div>
                      </div>
                    </li>
                  </ul>
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
</body>
</html>