<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                  <c:forEach items="${lstTop5Post}" var="pst">
                  <ul class="widget-posts">                                           
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="<%=request.getContextPath()%>/resources/common/assets/images/rp-4.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="<%=request.getContextPath()%>/viewDetailsPost?pId=${pst.postId}">${pst.title}</a></div>
                        <div class="widget-posts-meta">${pst.authorName}</div>
                      </div>
                    </li>                   
                  </ul>
                  </c:forEach>
                </div>
							<div class="widget">
								<h5 class="widget-title font-alt">Tag</h5>
								<div class="tags font-serif">
								<c:forEach items="${lstTag}" var="tag">
									<a href="<%=request.getContextPath()%>/listPostByTag?name=${tag.tagName}&page=1" rel="tag">${tag.tagName}</a>
										</c:forEach>
								</div>
							</div>
				</div>
</body>
</html>