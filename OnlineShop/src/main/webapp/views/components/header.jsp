<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#custom-collapse">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/views/Home.jsp">Tomee</a>
			</div>
			<div class="collapse navbar-collapse" id="custom-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=request.getContextPath()%>/views/Home.jsp">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						href="<%=request.getContextPath()%>/list" data-toggle="dropdown">Shop</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=request.getContextPath()%>/list">Book</a></li>
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/contactController">Contact</a></li>
					<li><a href="<%=request.getContextPath()%>/listPostController">Blog</a></li>
					<li><a href="<%=request.getContextPath()%>/views/FAQ.jsp">FAQ</a></li>
					<c:if test="${sessionScope.email == null}">
						<li><a href="<%=request.getContextPath()%>/views/Login.jsp">Login</a></li>
					</c:if>
					<c:if test="${sessionScope.email != null}">
					<li><a href="<%=request.getContextPath()%>/viewCart">View
							Cart[ <c:if test="${sessionScope.size == null}">
                                        0
                                    </c:if> <c:if
								test="${sessionScope.size != null}">
                                        ${sessionScope.size}
                                    </c:if> ]
					</a></li>
						<li class="dropdown"><a style="color: red;"
							class="dropdown-toggle"
							href="<%=request.getContextPath()%>/update"
							data-toggle="dropdown">${sessionScope.username}</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<%=request.getContextPath()%>/update">User
										Information</a></li>
								<li><a href="<%=request.getContextPath()%>/changePassword">Change
										Password</a></li>
								<li><a href="<%=request.getContextPath()%>/viewOrdered"> My purchase order</a></li>
								<c:if test="${sessionScope.role != 2}">
								<li><a
									href="<%=request.getContextPath()%>/aHomeController">Management Page
										</a></li>
								</c:if>
								<li><a
									href="<%=request.getContextPath()%>/logoutController">Sign
										Out</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>