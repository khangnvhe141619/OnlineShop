<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

            body {
                background-color: #eeeeee;
                font-family: 'Open Sans', serif;
                font-size: 14px
            }

            .container-fluid {
                margin-top: 70px
            }

            .card-body {
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1.40rem
            }

            .img-sm {
                width: 80px;
                height: 80px
            }

            .itemside .info {
                padding-left: 15px;
                padding-right: 7px
            }

            .table-shopping-cart .price-wrap {
                line-height: 1.2
            }

            .table-shopping-cart .price {
                font-weight: bold;
                margin-right: 5px;
                display: block
            }

            .text-muted {
                color: #969696 !important
            }

            a {
                text-decoration: none !important
            }

            .card {
                position: relative;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, .125);
                border-radius: 0px
            }

            .itemside {
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                width: 100%
            }

            .dlist-align {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex
            }

            [class*="dlist-"] {
                margin-bottom: 5px
            }

            .coupon {
                border-radius: 1px
            }

            .price {
                font-weight: 600;
                color: #212529
            }

            .btn.btn-out {
                outline: 1px solid #fff;
                outline-offset: -5px
            }

            .btn-main {
                border-radius: 2px;
                text-transform: capitalize;
                font-size: 15px;
                padding: 10px 19px;
                cursor: pointer;
                color: #fff;
                width: 100%
            }

            .btn-light {
                color: #ffffff;
                background-color: #F44336;
                border-color: #f8f9fa;
                font-size: 12px
            }

            .btn-light:hover {
                color: #ffffff;
                background-color: #F44336;
                border-color: #F44336
            }

            .btn-apply {
                font-size: 11px
            }	
        </style>
    </head>
    <body style="background: #030303">
        <!--begin of menu-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark" style="background: url('images/car6.jpg')">
            <div class="container">
                <a class="navbar-brand" href="home"><img src="images/car.png" style="width: 140px; height: 50px " alt=""/></a>
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
        <div class="container-fluid">
            <div class="row">
                <aside class="col-lg-9">
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table table-borderless table-shopping-cart">
                                <thead class="text-muted">
                                    <tr class="small text-uppercase">
                                        <th scope="col">ID</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col" width="120">Price</th>
                                        <th scope="col" class="text-right d-none d-md-block" width="200"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="o" items="${listO}">
                                        <tr>
                                            <td class="align-middle">
                                                <var class="id" ${oid = o.id}>${o.id}</var>
                                            </td>
                                            <td>
                                                <figure class="itemside align-items-center">
                                                    <div class="aside"><img src="${o.image}" class="img-sm"  style="width: 150px; height: 100px"></div>
                                                    <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true">${o.name}</a>

                                                    </figcaption>
                                                </figure>
                                            </td>
                                            <td class="align-middle">
                                                <var class="price" style="font-size: 25px">${o.price}</var>
                                            </td>
                                            <td class="align-middle"> <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-light" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a> <a href="cart?deleid=${o.id}" class="btn btn-light" data-abc="true"> Remove</a> </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </aside>
                <aside class="col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <dl class="dlist-align">
                                <dt>Total price:</dt>
                                <c:forEach var="o" items="${total}$">
                                    <dd class="text-right ml-3">${o}</dd>                                    
                                </c:forEach>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Discount:</dt>
                                <dd class="text-right text-danger ml-3">-10000.0$</dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Total:</dt>
                                <dd class="text-right text-dark b ml-3"><strong>${subtotal}$</strong></dd>
                            </dl>
                            <hr> 
                            <a href="#addEmployeeModal" class="btn btn-out btn-primary btn-square btn-main" data-abc="true" data-toggle="modal"> Make Purchase </a> 
                            <a href="home" class="btn btn-out btn-success btn-square btn-main mt-2" data-abc="true">Continue Shopping</a>
                        </div>
                    </div>
                </aside>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addPayOrder" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title"></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">	
                                <div class="form-group">
                                    <c:forEach items="${listO}" var="o">
                                        <label>Product</label> :
                                        <var class="id" ${oid = o.id}>${o.id}</var> : 
                                        <var class="name" ${pname = o.name}>${o.name}</var></br>
                                        <var class="id" ${sellid = o.sell_id}></var>
                                    </c:forEach>
                                </div>
                                <div class="form-group">
                                    <label>First name</label>
                                    <input name="Fname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input name="Lname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input name="email" type="email" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input name="phone" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Delivery Address</label>
                                    <textarea name="address" class="form-control" required></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Put">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
        </div>
    </body>
</html>