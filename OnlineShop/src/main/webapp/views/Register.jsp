<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Register Page</title>
    
    <!-- Font awesome -->
    <link href="<%=request.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" type="text/css"> 
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="<%=request.getContextPath() %>/resources/css/jquery.smartmenus.bootstrap.css" rel="stylesheet" type="text/css">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="<%=request.getContextPath() %>/resources/css/theme-color/default-theme.css" rel="stylesheet">
    <!-- Top Slider CSS -->
    <link href="<%=request.getContextPath() %>/resources/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
  
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
 <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->


 <!-- Start header section -->
  <jsp:include page="components/header.jsp"></jsp:include>
  <!-- / header section -->
  <!-- menu -->
 <jsp:include page="components/menu.jsp"></jsp:include>
  <!-- / menu -->  
 
  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
    <img src="<%=request.getContextPath() %>/resources/img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Account Page</h2>
        <ol class="breadcrumb">
          <li><a href="index.html">Home</a></li>                   
          <li class="active">Account</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
   <div class="container">
     <div class="row">
        <div class="aa-myaccount-area">         
            <div class="row">
              <div style="margin: 0 auto; width: 50%">
                <div class="aa-myaccount-register">                 
                 <h4>Register</h4>
                 <form action="<%=request.getContextPath() %>/registerController" method="POST" class="aa-login-form" onsubmit="return Validate()" >
                 <c:if test="${failedRegister}">
			<div class="text-danger">Register failed</div>
		</c:if>
		<c:if test="${errorSQL}">  
   				<div class="text-danger" >Connect SQL Server fail</div>
		</c:if>
                    <label for="">Username<span>*</span></label>
                    <input id="username" type="text" placeholder="Username" name="username">
                    <c:if test="${errorUsername}">
				<div class="text-danger">Username already exists</div>
			</c:if>
                    <label for="">Password<span>*</span></label>
                    <input id="password" type="password" placeholder="Password" name="password">
                    <label for="">Email<span>*</span></label>
                    <input id="email" type="text" placeholder="Email" name="email">
                    <c:if test="${errorEmail}">
				<div class="text-danger">Email already exists</div>
			</c:if>
                    <label for="">Phone<span>*</span></label>
                    <input id="phone" type="text" placeholder="Phone" name="phone">
                    <button type="submit" class="aa-browse-btn">Register</button>  
                    <div class="rememberme">
              		Have an account?<a href="<%=request.getContextPath() %>/views/Login.jsp" style="color: red"> Login now!</a>
            		</div>
                  </form>
                </div>
              </div>
            </div>          
         </div>
       </div>
     </div>
 </section>
 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="components/footer.jsp"></jsp:include>
  <!-- / footer -->
  <!-- Login Modal -->  
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <jsp:include page="components/loginPopup.jsp"></jsp:include>
  </div>


    
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.smartmenus.bootstrap.js"></script>  
  <!-- To Slider JS -->
  <script src="<%=request.getContextPath() %>/resources/js/sequence.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/sequence-theme.modern-slide-in.js"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="<%=request.getContextPath() %>/resources/js/custom.js"></script> 
  <script src="<%=request.getContextPath() %>/resources/js/Register.js"></script>

  </body>
</html>