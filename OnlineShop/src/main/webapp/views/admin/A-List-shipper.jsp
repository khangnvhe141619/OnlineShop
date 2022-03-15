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
    <title>Company Admin | List Shippers</title>
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
                            <li><a href="<%=request.getContextPath()%>/aListShipperController">Shipper</a></li>
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
                                <h4>List Of Shippers (<b style="color: orange;">${totalShipper}</b>)
                                </h4>                        
                                <div class="col-lg-12 col-md-9 col-sm-12 col-xs-12 mail_listing">
                                    <div class="inbox-center">
                                    <c:if test="${cSuccess}">
                                    <div class="alert alert-warning">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                                            <strong>CREATED!!! </strong>
                                            <p> The Post has been created successfully.</p>
                                        </div> 
                                    </c:if>                              
                                    <c:if test="${dSuccess}">
                                    <div class="alert alert-warning">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                                            <strong>DELETED!!! </strong>
                                            <p> The Shipper has been deleted successfully.</p>
                                        </div> 
                                    </c:if>
                                    <c:if test="${sError}">
                                        <div class="alert alert-danger">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                                            <strong>ERROR!! </strong>
                                            <p> There was an error during deleting this record. Please try again.</p>
                                        </div>
                                        </c:if>   
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10%;">No.</th>
                                                    <th>FULLNAME</th>
                                                    <th>EMAIl</th>
                                                    <th>PHONE</th>
                                                    <th>ACTION</th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${lstShipper}"  var="shipper">
                                            <tbody>
                                                <tr>
                                                    <td class="max-texts"> ${shipper.shipperID}</td>
                                                    <td class="max-texts">${shipper.shipperName}</td>
                                                    <td class="max-texts"> ${shipper.email} </td>
                                                    <td class="max-texts">${shipper.phone}</td>
                                                    <td class="">
                                                        <a href="<%=request.getContextPath()%>/aEditShipperController?sId=${shipper.shipperID}"><i style="color: blue;" class="fa fa-edit" aria-hidden="true"></i></a>
                                                        <a style="margin-left: 5%;" href="<%=request.getContextPath()%>/aDeleteShipperController?sId=${shipper.shipperID}" onclick="return deleteShipper();"><i style="color: red;" class="fa fa-trash"
                                                                aria-hidden="true"></i> </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            </c:forEach>
                                        </table>
                                    </div>
                                    <div class="row">
                            <div class="pagination font-alt">							
							<c:if test="${check == 0}">
								<div class="pagination">
									<c:if test="${tag == 1}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/aListShipperController?page=1">&laquo;Pre</a>
										</li>
									</c:if>
									<c:if test="${tag != 1}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/aListShipperController?page=${tag-1}">&laquo;Pre</a>
										</li>
									</c:if>
									<c:forEach begin="1" end="${total}" var="i">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/aListShipperController?page=${i}"
											class="nar-item ${tag == i? ' active ' : ''}">${i}</a></li>
									</c:forEach>
									<c:if test="${tag != total}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/aListShipperController?page=${tag+1}">Next
												&raquo;</a></li>
									</c:if>
									<c:if test="${tag == total}">
										<li class="page-item"><a class="page-link"
											href="<%=request.getContextPath()%>/aListShipperController?page=${total}">Next
												&raquo;</a>
									</c:if>
								</div>
							</c:if>						
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
        <script src="<%=request.getContextPath()%>/resources/admin/js/myJS.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/custom.min.js"></script>
    <!--Style Switcher -->
    <script src="<%=request.getContextPath()%>/resources/admin/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>