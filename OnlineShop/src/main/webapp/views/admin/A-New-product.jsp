<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/admin/plugins/images/icon.png">
    <title>Company Admin | Create New Product</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/animate.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
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
                        <h4 class="page-title"></h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="<%=request.getContextPath()%>/aHomeController">Dashboard</a></li>
                            <li><a href="<%=request.getContextPath()%>/ListProdtuct">Product</a></li>
                            <li class="active">New</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!--.row-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                            <h3 class="box-title m-b-0">Creating A New Product</h3>
                            <p class="text-muted m-b-30 font-13"> Fill in the form below: </p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="<%=request.getContextPath()%>/AddProductController" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="inputCategory">Category</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-life-ring"></i>
                                                </div>                                  
                                                    <select name="category" id="" class="form-control">
                                                    <c:forEach items="${listCategory }" var="i">
                                                        <option ${categoryID == o.categoryID ? "selected":"" }  value="${i.categoryID }">${i.categoryName }</option>
                                                       </c:forEach>
                                                      </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputDepartmentName">Product Name</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                                <input type="text" name="productName" class="form-control"
                                                    id="" placeholder="Enter department name" required="">
                                                    
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputImage">Image</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-upload"></i></div>
                                                <input type="file" name="productImage"
                                                    class="form-control" id=""
                                                    placeholder="Enter image">
                                            </div>
                                        </div>  
                                        <div class="form-group">
                                            <label for="inputProductDesc">Description</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="text" name="productDesc"
                                                    class="form-control" id=""
                                                    placeholder="Enter product description">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Issuing Company</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="text" name="issuingCompany"
                                                    class="form-control" id=""
                                                    placeholder="">
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label for="">Publication Date</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="date" name="publicationDate"
                                                    class="" id=""
                                                    placeholder="" ">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for=""> Cover Type</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <select name="coverType" id="" class="form-control">
                                                <c:forEach items="${listBK }" var="i">
                                                    <option value="${i.bookCoverId }">${i.bookCoverName }</option>
                                                   </c:forEach>
                                                  </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Publishing Company</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="text" name="publishingCompany"
                                                    class="form-control" id=""
                                                    placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Quantity</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="number" name="quantity"
                                                    class="form-control" id=""
                                                    placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Price</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="number" name="price"
                                                    class="form-control" id=""
                                                    placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Number of page</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-pencil-square-o"></i></div>
                                                <input type="number" name="numberOfPage"
                                                    class="form-control" id=""
                                                    placeholder="">
                                            </div>
                                        </div>                                       
                                        <button type="submit" name="submit"
                                            class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--./row-->
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
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/js/jasny-bootstrap.js"></script>
    <!--Style Switcher -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>

    <!-- CHECK IF PASSWORDS MATCH -->
    <script>
        $(document).ready(function () {
            $("#ConfirmPassword").keyup(function () {
                if ($("#Password").val() != $("#ConfirmPassword").val()) {
                    $("#msg").html("Password do not match").css("color", "red");
                } else {
                    $("#msg").html("Password matched").css("color", "green");
                }
            });
        });
    </script>
    <!--END CHECK IF PASSWORDS MATCH -->
</body>

</html>