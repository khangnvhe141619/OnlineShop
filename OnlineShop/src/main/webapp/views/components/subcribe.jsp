<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Subscribe section -->
	<section id="aa-subscribe">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-subscribe-area">
						<h3>Subscribe our website</h3>
						<p>If you like our products, please click the subscribe button
							below!</p>
						<form action="<%=request.getContextPath()%>/subscribeController"
							method="POST" class="aa-subscribe-form">
							<input type="email" name="email" id=""
								placeholder="Enter your email"> <input type="submit"
								value="Subscribe">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / Subscribe section -->
</body>
</html>