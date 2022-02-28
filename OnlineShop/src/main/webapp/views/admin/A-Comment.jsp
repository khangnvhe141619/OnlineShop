<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/admin/plugins/images/icon.png">
    <title>Company Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

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
                        <h4 class="page-title">Emal?</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.html">Dashboard</a></li>
                            <li class="active">Comments</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- row -->
                <div class="row">
                    <!-- Left sidebar -->
                    <div class="col-md-12">
                        <div class="white-box">
                            <!-- row -->
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mail_listing">
                                    <div class="inbox-center">
                                        <div class="alert alert-warning">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                                            <strong>DELETED!! </strong>
                                            <p> The comment has been successfully deleted.</p>
                                        </div>

                                        <div class="alert alert-danger">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                                            <strong>ERROR!! </strong>
                                            <p> There was an error during deleting this record. Please try again.</p>
                                        </div>

                                        <h4>Recent Posts Comments (<b style="color: orange;">11</b>)</h4>

                                        <i style='color:brown;'>No Comments Yet :( </i> 


                                        <div class="comment-center">

                                            <div class="comment-body">
                                                <div class="mail-contnet">
                                                    <b>11</b>
                                                    <h5>Blog Title : 22</h5>
                                                    <span class="mail-desc">
                                                        22
                                                    </span><a href="javacript:void(0)" class="action"
                                                        data-toggle="modal" data-target="#responsive-modal'.$row["
                                                        id"].'"><i class="ti-close text-danger"></i></a> <span
                                                        class="time pull-right">'.$row["date"].'</span>
                                                </div>
                                            </div>

                                            <!-- /.modal -->
                                            <div id="responsive-modal'.$row[" id"].'" class="modal fade" tabindex="-1"
                                                role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
                                                style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">×</button>
                                                            <h4 class="modal-title">Are you sure you want to delete this
                                                                comment?</h4>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <form action="" method="post">
                                                                <input type="hidden" name="id" value="" />
                                                                <button type="button"
                                                                    class="btn btn-default waves-effect"
                                                                    data-dismiss="modal">Close</button>
                                                                <button type="submit"
                                                                    class="btn btn-danger waves-effect waves-light">Delete</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Modal -->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-7 m-t-20"> Showing 1 - 111 </div>
                                        <div class="col-xs-5 m-t-20">
                                            <div class="btn-group pull-right">
                                                <button type="button" class="btn btn-default waves-effect"><i
                                                        class="fa fa-chevron-left"></i></button>
                                                <button type="button" class="btn btn-default waves-effect"><i
                                                        class="fa fa-chevron-right"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
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
                                        <input id="checkbox2" type="checkbox" checked="" class="fxsdr">
                                        <label for="checkbox2"> Fix Sidebar </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="checkbox checkbox-success">
                                        <input id="checkbox4" type="checkbox" class="open-close">
                                        <label for="checkbox4"> Toggle Sidebar </label>
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
            <footer class="footer text-center"> 2018 &copy; Company Admin </footer>
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
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/custom.min.js"></script>
    <!--Style Switcher -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>