<%@page import="java.sql.SQLException"%>
<%@page import="com.shop.model.Contact"%>
<%@page import="com.shop.dao.impl.ContactDAOImpl"%>
<%@page import="com.shop.dao.ContactDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="module-small bg-dark">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="widget">
					<%
					ContactDAO cd = new ContactDAOImpl();
					Contact c = cd.getInformation();
					%>
					<h5 class="widget-title font-alt">About <%=c.getName()%></h5>
						<p><%=c.getDesc()%>.</p>						
						<p>Email: <%=c.getEmail()%></p>
						<p>Phone: <%=c.getPhone()%></p>
						Address: <%=c.getAddress()%>				
					</div>
				</div>
				<div class="col-sm-3">
					<div class="widget">
						<h5 class="widget-title font-alt">Group 4</h5>
						<ul class="icon-list">
							<li>Nguyễn Văn Khang</li>
							<li>Nguyễn Sỹ Đồng</li>
							<li>Nguyễn Văn Sỹ </li>
							<li>Lê Đức Anh </li>
							<li>Hà Anh Dũng </li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="widget">
						<h5 class="widget-title font-alt">Our Expertises</h5>
						<ul class="icon-list">
							<li>Photography</li>
							<li>Web Design</li>
							<li>Illustration</li>
							<li>Marketing</li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="widget">
						<h5 class="widget-title font-alt">Learning</h5>
						<ul class="widget-posts">						
							<li class="clearfix">
							<a>" Learning  never  exhausted the mind.	"
									
									 Leonardo da Vinci ~</a>
								<div class="widget-posts-image ">
									
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
					<p class="copyright font-alt">
						&copy; 2022&nbsp;<a href="<%=request.getContextPath()%>/views/Home.jsp"><%=c.getName()%></a>, All Rights
						Reserved
					</p>
				</div>
				<div class="col-sm-6">
					<div class="footer-social-links">
						<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
							class="fa fa-twitter"></i></a><a href="#"><i
							class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>