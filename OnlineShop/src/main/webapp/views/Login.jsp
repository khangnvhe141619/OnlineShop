<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/common/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/common/css/style1.css">

</head>
<body>
	<div class="main">
		<!-- Login  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img
								src="<%=request.getContextPath()%>/resources/common/images/login-img.jpg"
								alt="sing up image">
						</figure>
						<a href="<%=request.getContextPath()%>/views/Signup.jsp" class="signup-image-link"
							style="text-decoration: none;">Create an account</a>
					</div>
					<div class="signin-form">
						<h2 class="form-title">Login</h2>
						<form action="<%=request.getContextPath()%>/loginController" method="POST" class="register-form" id="login-form">
							<c:if test="${errorLogin}">
								<div style="color: red">Login fail</div>
							</c:if>
							<c:if test="${failedLogin}">
								<div style="color: red">Username or Password is incorrect</div>
							</c:if>
							<c:if test="${block}">
								<div style="color: red">The account has been blocked</div>
							</c:if>
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="your_name"
									placeholder="Your Name" value="${email}" />
							</div>
							<div class="form-group">
								<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="your_pass"
									placeholder="Password" value="${pass}" />
							</div>
							<c:if test="${requestScope.error != null}">
								<p style="color: red">${requestScope.error}</p>
							</c:if>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="" style="margin: 10% 0 5%;">
							<span class=""><a href="<%=request.getContextPath()%>/forgotPasswordController"
								style="text-decoration: none; color: black">Forgot your
									password?</a></span>
						</div>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="http://www.Facebook.com/"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="http://www.twiter.com"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="http://www.google.com"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
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
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>