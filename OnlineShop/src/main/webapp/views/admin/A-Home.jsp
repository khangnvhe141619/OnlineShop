<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg "
                    href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i
                        class="ti-menu"></i></a>
                <div class="top-left-part"><a class="logo" href="A-Home.jsp"><b><img src="<%=request.getContextPath()%>/resources/admin/plugins/images/icon.png"
                                style="width: 30px; height: 30px;" alt="home" /></b><span
                            class="hidden-xs"><b>Company</b></span></a></div>
                <ul class="nav navbar-top-links navbar-left hidden-xs">
                    <li><a href="javascript:void(0)" class="open-close hidden-xs waves-effect waves-light"><i
                                class="icon-arrow-left-circle ti-menu"></i></a></li>
                    <li>
                        <form role="search" class="app-search hidden-xs">
                            <input type="text" placeholder="Search..." class="form-control"> <a href=""><i
                                    class="fa fa-search"></i></a>
                        </form>
                    </li>
                </ul>
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <!-- /.dropdown -->
                    <li class="right-side-toggle"> <a class="waves-effect waves-light" href="javascript:void(0)"><i
                                class="ti-settings"></i></a></li>
                    <!-- /.dropdown -->
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- Left navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search hidden-sm hidden-md hidden-lg">
                        <!-- input-group -->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search..."> <span
                                class="input-group-btn">
                                <button class="btn btn-default" type="button"> <i class="fa fa-search"></i> </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li class="user-pro">
                        <a href="#" class="waves-effect"><img src="<%=request.getContextPath()%>/resources/admin/plugins/images/user.jpg" alt="user-img"
                                class="img-circle"> <span class="hide-menu"> Account<span
                                    class="fa arrow"></span></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="settings.html"><i class="ti-settings"></i> Account Setting</a></li>
                            <li><a href="#"><i class="fa fa-power-off"></i> Logout</a></li>
                        </ul>
                    </li>
                    <li class="nav-small-cap m-t-10">--- Main Menu</li>
                    <li> <a href="A-Home.jsp" class="waves-effect active"><i class="linea-icon linea-basic fa-fw"
                                data-icon="v"></i> <span class="hide-menu"> Dashboard </span></span></a>
                    </li>

                    <li> <a href="#" class="waves-effect"><i data-icon=";" class="linea-icon fa fa-group"></i> <span
                                class="hide-menu">Department<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="list-department.html">List Departments</a></li>
                            <li><a href="new-department.html">Create Department</a></li>

                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="" class="fa fa-user"></i> <span
                                class="hide-menu">User<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="list-user.html">List Users</a></li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;" class="fa fa-life-ring"></i> <span
                                class="hide-menu">Category<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="list-category.html">List Product Categories</a></li>
                            <li><a href="new-category.html">Create Category</a></li>

                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon=";" class="linea-icon linea-basic fa-fw"></i>
                            <span class="hide-menu">Product<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="list-product.html">List Products</a></li>
                            <li><a href="new-product.html">Create Product</a></li>
                            
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">Blog<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="posts.html">All Posts</a></li>
                            <li><a href="new-post.html">Create Post</a></li>
                            <li><a href="comments.html" class="waves-effect">Comments</a>
                            </li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon fa fa-truck"></i> <span class="hide-menu">Shipper<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="list-shipper.html">List Shippers</a></li>
                            <li><a href="new-shipper.html">Create Shipper</a></li>

                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon fa fa-cart-plus"></i> <span class="hide-menu">Order<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="list-order.html">List Orders</a></li>
                        </ul>
                    </li>

                    <li><a href="subscribers.html" class="waves-effect"><i data-icon="n"
                                class="linea-icon fa fa-thumbs-o-up"></i> <span class="hide-menu">Subscribers</span></a>
                    </li>

                    <li class="nav-small-cap">--- Other</li>

                    <li> <a href="#" class="waves-effect"><i data-icon="H" class="linea-icon linea-basic fa-fw"></i>
                            <span class="hide-menu">Access<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="users.html">Administrators</a></li>
                            <li><a href="new-user.html">Create Admin</a></li>

                        </ul>
                    </li>

                    <li><a href="#" class="waves-effect"><i class="icon-logout fa-fw"></i> <span
                                class="hide-menu">Log out</span></a></li>

                </ul>
            </div>
        </div>
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
                            <li><a href="#">Dashboard</a></li>
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
                            <h3 class="box-title">Recent Comments</h3>
                            <div class="comment-center">
                                <div class="comment-body">
                                    <div class="mail-contnet">

                                        <hr>
                                        <a href="comments.html"
                                            class="btn btn-info btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">View
                                            All Comments</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-lg-6 col-sm-12">
                        <div class="white-box">
                            <!-- <h3 class="box-title">Recent Blog Posts
                              <div class="col-md-3 col-sm-4 col-xs-6 pull-right">
                                <select class="form-control pull-right row b-none">
                                  <option>March 2022</option>
                                  <option>April 2022</option>
                                  <option>May 2022</option>
                                  <option>June 2022</option>
                                  <option>July 2022</option>
                                </select>
                              </div>
                            </h3> -->
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
                                    <i style="color:brown;">No Posts Yet :( Upload Company's first blog post today! </i>
                                    <thead>
                                        <tr>
                                            <th>TITLE</th>
                                            <th>DATE</th>
                                            <th>COMMENTS</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="txt-oflo">title</td>
                                            <td class="txt-oflo">date</td>
                                            <td><span class="text-success">comment</span></td>
                                        </tr>
                                    </tbody>

                                </table>
                                <a href="posts.html"
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
            <footer class="footer text-center"> 2022 &copy; Company Admin </footer>
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