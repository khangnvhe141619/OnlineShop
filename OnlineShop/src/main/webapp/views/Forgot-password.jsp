<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot password</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/fonts/material-icon/css/material-design-iconic-font.min.css">
<!--xin comment-->
    <!-- Main css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/css/style1.css">
</head>
<body>
    
    <div class="main">
        
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Forgot password</h2>
                        <form action="<%=request.getContextPath()%>/forgotPasswordController" method="POST">
                        <c:if test="${emailError}">
								<div style="color: red">Email does not exist !!!</div>
							</c:if>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" value=""/>
                            </div>                                                                      
                            <div class="form-group form-button">
                                <input type="submit" name="signup" class="form-submit" value="Reset my password"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="<%=request.getContextPath()%>/resources/common/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="views/Login.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- JS -->
    <script src="<%=request.getContextPath()%>/resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/common/js/main.js"></script>
</body>
</html>