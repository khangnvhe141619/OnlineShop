<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
                            <li><a href="A-Settings.jsp"><i class="ti-settings"></i> Account Setting</a></li>
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
                            <li><a href="<%=request.getContextPath() %>/listDepartmentController">List Departments</a></li>
                            <li><a href="<%=request.getContextPath() %>/addDepartment">Create Department</a></li>

                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="" class="fa fa-user"></i> <span
                                class="hide-menu">User<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="<%=request.getContextPath() %>/listUserController">List Users</a></li>
                            <li><a href="<%=request.getContextPath() %>/listUserBlockController">List Users Blocked</a></li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;" class="fa fa-life-ring"></i> <span
                                class="hide-menu">Category<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="<%=request.getContextPath() %>/CategoryController">List Product Categories</a></li>
                            <li><a href="A-New-category.jsp">Create Category</a></li>

                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon=";" class="linea-icon linea-basic fa-fw"></i>
                            <span class="hide-menu">Product<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="<%=request.getContextPath() %>/ListProdtuct">List Products</a></li>
                            <li><a href="A-New-product.jsp">Create Product</a></li>
                            
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">Blog<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="A-List-post.jsp">All Posts</a></li>
                            <li><a href="A-New-post.jsp">Create Post</a></li>
                            <li><a href="A-Comment.jsp" class="waves-effect">Comments</a>
                            </li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon fa fa-truck"></i> <span class="hide-menu">Shipper<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="A-List-shipper.jsp">List Shippers</a></li>
                            <li><a href="A-New-shipper.jsp">Create Shipper</a></li>

                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon fa fa-cart-plus"></i> <span class="hide-menu">Order<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="<%=request.getContextPath() %>/listOrderController">List Orders</a></li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="&#xe00b;"
                                class="linea-icon fa fa-cart-plus"></i> <span class="hide-menu">Coupon<span
                                    class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="A-List-coupon.jsp">List Coupons</a></li>
                            <li><a href="A-New-coupon.jsp">Create Coupon</a></li>
                        </ul>
                    </li>
                    <li><a href="A-List-subscriber.jsp" class="waves-effect"><i data-icon="n"
                                class="linea-icon fa fa-thumbs-o-up"></i> <span class="hide-menu">Subscribers</span></a>
                    </li>

                    <li class="nav-small-cap">--- Other</li>

                    <li> <a href="#" class="waves-effect"><i data-icon="H" class="linea-icon linea-basic fa-fw"></i>
                            <span class="hide-menu">Access<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="#">Administrators</a></li>
                            <li><a href="A-New-user.jsp">Create Admin</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/logoutController" class="waves-effect"><i class="icon-logout fa-fw"></i> <span
                                class="hide-menu">Log out</span></a></li>
                </ul>
            </div>
        </div>
</body>
</html>