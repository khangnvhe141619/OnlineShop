<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/common/fonts/material-icon/css/material-design-iconic-font.min.css">
<!--comment-->
<!-- Main css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/common/css/style1.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
						<form action="<%=request.getContextPath()%>/registerController"
							method="POST" class="register-form" id="register-form">
							<c:if test="${failedRegister}">
								<div style="color: red;">Register failed</div>
							</c:if>
							<c:if test="${errorSQL}">
								<div style="color: red;">Connect SQL Server fail</div>
							</c:if>
							<c:if test="${errorUsername}">
								<div style="color: red;">Username already exists</div>
							</c:if>
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account-circle"></i></label>
								<input type="text" name="username" required="required" id="name"
									placeholder="Username" value="${param.username}" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" required="required" id="pass"
									placeholder="Password" value="${param.pass}" />
							</div>
							<div style="color: red;">${requestScope.error}</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="repass" required="required"
									id="re_password" placeholder="Repeat your password"
									value="${param.repass}">
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img
								src="<%=request.getContextPath()%>/resources/common/images/signup-image.jpg"
								alt="sing up image">
						</figure>
						<a href="<%=request.getContextPath()%>/views/Login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script
		src="<%=request.getContextPath()%>/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/common/js/main.js"></script>
</body>
</html>