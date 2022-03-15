<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/admin/plugins/images/icon.png">
    <title>Website Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/colors/blue.css" id="theme" rel="stylesheet"> 
</head>
<!--check home jsp-->
<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <jsp:include page="components/A-Header.jsp"></jsp:include>
        <!-- Navigation end-->        
		<!-- Left navbar-header -->
		<jsp:include page="components/A-Left.jsp"></jsp:include>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title"></h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="<%=request.getContextPath()%>/aHomeController">Dashboard</a></li>
                            <li class="active">Home</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="white-box">
                            <div class="row row-in">
                                <div class="col-lg-3 col-sm-6 row-in-br">
                                    <div class="col-in row">
                                        <div class="col-md-6 col-sm-6 col-xs-6"> <i data-icon="E"
                                                class="linea-icon linea-basic"></i>
                                            <h5 class="text-muted vb">Company Blog Posts</h5>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h3 class="counter text-right m-t-15 text-danger"></h3>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-danger" role="progressbar"
                                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 40%"> <span class="sr-only">40% Complete
                                                        (success)</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6 row-in-br  b-r-none">
                                    <div class="col-in row">
                                        <div class="col-md-6 col-sm-6 col-xs-6"> <i class="linea-icon linea-basic"
                                                data-icon="&#xe01b;"></i>
                                            <h5 class="text-muted vb">Blog Comments</h5>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h3 class="counter text-right m-t-15 text-megna"></h3>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-megna" role="progressbar"
                                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 40%"> <span class="sr-only">40% Complete
                                                        (success)</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6 row-in-br">
                                    <div class="col-in row">
                                        <div class="col-md-6 col-sm-6 col-xs-6"> <i class="linea-icon linea-basic"
                                                data-icon="&#xe00b;"></i>
                                            <h5 class="text-muted vb">Contact Messages</h5>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h3 class="counter text-right m-t-15 text-primary"></h3>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-primary" role="progressbar"
                                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 40%"> <span class="sr-only">40% Complete
                                                        (success)</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6  b-0">
                                    <div class="col-in row">
                                        <div class="col-md-6 col-sm-6 col-xs-6"> <i class="linea-icon linea-basic"
                                                data-icon="&#xe016;"></i>
                                            <h5 class="text-muted vb">Company Subscribers</h5>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h3 class="counter text-right m-t-15 text-success"></h3>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success" role="progressbar"
                                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 40%"> <span class="sr-only">40% Complete
                                                        (success)</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--row -->

                <div class="row">
                    <div class="col-md-12 col-lg-6 col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">Product</h3>
                            <div class="comment-center">
                                <div class="comment-body">
                                    <div class="mail-contnet">

                                        <hr>
                                        <a href="<%=request.getContextPath()%>/ListProdtuct"
                                            class="btn btn-info btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">View
                                            All Products</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-lg-6 col-sm-12">
                        <div class="white-box">
                           
                            <div class="row sales-report">
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h2>Company 2022</h2>
                                    <p>Blog Posts</p>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 ">
                                    <h1 class="text-right text-success m-t-20"></h1>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>AUTHOR</th>
                                            <th>DATE</th>
                                            <th>TITLE</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${lstPost}" var="p">
                                    <tbody>
                                        <tr>
                                            <td class="txt-oflo">${p.authorName}</td>
                                            <td class="txt-oflo">${p.createdDate.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss"))}</td>
                                            <td><span class="text-success">${p.title}</span></td>
                                        </tr>
                                    </tbody>
                                    </c:forEach>
                                    
                                </table>
                                <a href="<%=request.getContextPath()%>/aListPostController "
                                    class="btn btn-info btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">View
                                    All Posts</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span>
                        </div>
                        <div class="r-panel-body">
                            <ul>
                                <li><b>Layout Options</b></li>
                                <li>
                                    <div class="checkbox checkbox-info">
                                        <input id="checkbox1" type="checkbox" class="fxhdr">
                                        <label for="checkbox1"> Fix Header </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="checkbox checkbox-warning">
                                        <input id="checkbox2" type="checkbox" class="fxsdr">
                                        <label for="checkbox2"> Fix Sidebar </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="checkbox checkbox-success">
                                        <input id="checkbox4" type="checkbox" class="open-close">
                                        <label for="checkbox4"> Toggle Side bar </label>
                                    </div>
                                </li>
                            </ul>
                            <ul id="themecolors" class="m-t-20">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" theme="gray" class="yellow-theme">3</a></li>
                                <li><a href="javascript:void(0)" theme="blue" class="blue-theme working">4</a></li>
                                <li><a href="javascript:void(0)" theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" theme="megna" class="megna-theme">6</a></li>
                                <li><b>With Dark sidebar</b></li>
                                <br />
                                <li><a href="javascript:void(0)" theme="default-dark" class="default-dark-theme">7</a>
                                </li>
                                <li><a href="javascript:void(0)" theme="green-dark" class="green-dark-theme">8</a></li>
                                <li><a href="javascript:void(0)" theme="gray-dark" class="yellow-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" theme="blue-dark" class="blue-dark-theme">10</a></li>
                                <li><a href="javascript:void(0)" theme="purple-dark" class="purple-dark-theme">11</a>
                                </li>
                                <li><a href="javascript:void(0)" theme="megna-dark" class="megna-dark-theme">12</a></li>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- /.right-sidebar -->
            </div>
            <!-- /.container-fluid -->
            <jsp:include page="components/A-Footer.jsp"></jsp:include>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/js/tether.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/waves.js"></script>
    <!--Counter js -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
    <!--Morris JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/raphael/raphael-min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/morrisjs/morris.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/js/dashboard1.js"></script>
    <!-- Sparkline chart JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/jquery-sparkline/jquery.charts-sparkline.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/toast-master/js/jquery.toast.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.toast({
                heading: 'Welcome to Company admin',
                text: 'view, edit and upload new posts to keep your users engaged.',
                position: 'top-right',
                loaderBg: '#ff6849',
                icon: 'info',
                hideAfter: 3700,
                stack: 6
            })
        });
    </script>
    <!--Style Switcher -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>