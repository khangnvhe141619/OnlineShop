<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createAccount
    Created on : Mar 22, 2021, 1:54:38 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <title>Bootstrap Sign up Form Horizontal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #999;
                background: #f3f3f3;
                font-family: 'Roboto', sans-serif;
            }
            .form-control {
                border-color: #eee;
                min-height: 41px;
                box-shadow: none !important;
            }
            .form-control:focus {
                border-color: #5cd3b4;
            }
            .form-control, .btn {        
                border-radius: 3px;
            }
            .signup-form {
                width: 500px;
                margin: 0 auto;
                padding: 30px 0;
            }
            .signup-form h2 {
                color: #333;
                margin: 0 0 30px 0;
                display: inline-block;
                padding: 0 30px 10px 0;
                border-bottom: 3px solid #5cd3b4;
            }
            .signup-form form {
                color: #999;
                border-radius: 3px;
                margin-bottom: 15px;
                background: #fff;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .signup-form .form-group row {
                margin-bottom: 20px;
            }
            .signup-form label {
                font-weight: normal;
                font-size: 14px;
                line-height: 2;
            }
            .signup-form input[type="checkbox"] {
                position: relative;
                top: 1px;
            }
            .signup-form .btn {        
                font-size: 16px;
                font-weight: bold;
                background: #5cd3b4;
                border: none;
                margin-top: 20px;
                min-width: 140px;
            }
            .signup-form .btn:hover, .signup-form .btn:focus {
                background: #41cba9;
                outline: none !important;
            }
            .signup-form a {
                color: #5cd3b4;
                text-decoration: underline;
            }
            .signup-form a:hover {
                text-decoration: none;
            }
            .signup-form form a {
                color: #5cd3b4;
                text-decoration: none;
            }	
            .signup-form form a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body style="background: url('images/car15.jpg')">
        <!--begin of menu-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark" style="background: url('images/car6.jpg')">
            <div class="container">
                <a class="navbar-brand" href="home"><img src="images/car.png" style="width: 140px; height: 50px "alt=""/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto" style="font-size: 17px">
                        <li class="nav-item">
                            <a class="nav-link" href="home" style="color:white">Home</a>    
                        </li>    
                    </ul>
                </div>
            </div>
        </nav>
        <!--end of menu-->
        <div class="signup-form">
            <form action="createacc" method="post" class="form-horizontal" style="color: black">
                <div class="row">
                    <div class="col-8 offset-4">
                        <h2>Sign Up</h2>
                    </div>
                    <p class="text-danger">${mess} </p>
                </div>			
                <div class="form-group row">
                    <label class="col-form-label col-4">Username</label>
                    <div class="col-8">
                        <input type="text" class="form-control" name="username" required="required" style="border-color: black">
                    </div>        	
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Email Address</label>
                    <div class="col-8">
                        <input type="email" class="form-control" name="email" required="required" style="border-color: black">
                    </div>        	
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Phone number</label>
                    <div class="col-8">
                        <input type="phone" class="form-control" name="phone" required="required" style="border-color: black">
                    </div>        	
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Password</label>
                    <div class="col-8">
                        <input type="password" class="form-control" name="password" required="required" style="border-color: black">
                    </div>        	
                </div>
                <div>
                    <select name="seller">
                        <option value="0">User</option>
                        <option value="1">Seller</option>
                    </select>
                </div>
                <div class="form-group row">
                    <div class="col-8 offset-4">
                        <p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
                        <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                    </div>  
                </div>		      
            </form>
            <div style="color: white" class="text-center">Already have an account? <a href="Login.jsp">Login here</a></div>
        </div>
    </body>
</html>