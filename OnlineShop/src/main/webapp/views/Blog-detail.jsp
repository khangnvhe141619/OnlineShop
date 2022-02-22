<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Blog Single</title>
    
    <!-- Font awesome -->
    <link href="<%=request.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="<%=request.getContextPath()%>/resources/css/theme-color/default-theme.css" rel="stylesheet">
    <!-- Top Slider CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">    

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
   <img src="<%=request.getContextPath()%>/resources/img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Blog Details</h2>
        <ol class="breadcrumb">
          <li><a href="Index.jsp">Home</a></li>         
          <li class="active">Blog Details</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

  <!-- Blog Archive -->
  <section id="aa-blog-archive">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-blog-archive-area">
            <div class="row">
              <div class="col-md-9">
                <!-- Blog details -->
                <div class="aa-blog-content aa-blog-details">
                  <article class="aa-blog-content-single">                        
                    <h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem, praesentium?</a></h2>
                     <div class="aa-article-bottom">
                      <div class="aa-post-author">
                        Posted By <a href="#">Jackson</a>
                      </div>
                      <div class="aa-post-date">
                        March 26th 2016
                      </div>
                    </div>
                    <figure class="aa-blog-img">
                      <a href="#"><img src="<%=request.getContextPath()%>/resources/img/fashion/3.jpg" alt="fashion img"></a>
                    </figure>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates voluptatum accusamus dolorum ipsam adipisci laudantium laborum ipsa excepturi soluta, dolore similique, velit id, rerum repudiandae enim modi! Quo, debitis, in.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, laudantium error nisi, fuga odio sint dignissimos similique maiores nihil amet, impedit atque saepe distinctio, in repudiandae quia. Hic numquam laborum, aliquam eligendi quo inventore aperiam quae error commodi voluptatum dolorum tempore, atque, ratione molestiae, nostrum perferendis. Similique voluptatum error quaerat?</p>
                    <blockquote>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum facere tempora rerum qui illum, repellat adipisci ad suscipit, quis accusamus commodi nemo deserunt optio nobis fugit cumque, delectus repellendus quo.
                    </blockquote>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor omnis ipsam, nisi voluptate reprehenderit consectetur, illum possimus asperiores. Sed ad natus saepe, distinctio veniam? Error natus, dolore rem beatae, dolorum, aliquid sapiente ipsa voluptatum impedit vel maiores nobis totam! Ad dicta obcaecati dolore natus deleniti qui, hic animi, nobis cumque fuga non sapiente neque voluptatum nisi perspiciatis, molestiae vero distinctio officia, laboriosam. Veritatis assumenda nam est fuga rem asperiores repellat veniam magnam, molestias iusto quas facilis, et eaque. Est magni voluptas quibusdam saepe quis laudantium atque maxime itaque optio ipsam qui voluptates beatae, perspiciatis fugiat tempora maiores, odio, sed non!</p>
                    <ul>
                      <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum deserunt earum qui nobis veritatis! Reprehenderit.</li>
                      <li>Rerum nesciunt laboriosam, excepturi, officiis, delectus cum facere aperiam aliquam numquam, modi amet asperiores repudiandae!</li>
                      <li>Dicta recusandae eveniet ducimus rerum, maxime provident suscipit cupiditate natus at necessitatibus, consequuntur iste magnam.</li>
                      <li>Voluptate sunt tempora culpa et veritatis ex quo non tenetur similique blanditiis! Debitis, assumenda, provident.</li>
                      <li>Eligendi sunt ratione praesentium, tempore esse, iure ut dolor consequuntur eum ducimus commodi sequi beatae.</li>
                    </ul>
                    <h1>Heading 1</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias nihil nobis libero magni fuga ratione ipsam ipsa laboriosam quod, reprehenderit, error iusto, delectus eius. Iste.</p>
                    <h2>Heading 2</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias nihil nobis libero magni fuga ratione ipsam ipsa laboriosam quod, reprehenderit, error iusto, delectus eius. Iste.</p>
                    <h3>Heading 3</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est asperiores voluptatem officia, nulla, nihil tempore illum esse sunt in quos!</p>
                    <h4>Heading 4</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus odit nostrum magnam, quas quos id!</p>
                    <div class="blog-single-bottom">
                      <div class="row">
                        <div class="col-md-8 col-sm-6 col-xs-12">
                          <div class="blog-single-tag">
                            <span>Tags:</span>
                            <a href="#">Fashion,</a>
                            <a href="#">Beauty,</a>
                            <a href="#">Lifestyle</a>
                          </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                          <div class="blog-single-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                   
                  </article>
                  <!-- blog navigation -->
                  <div class="aa-blog-navigation">
                    <a class="aa-blog-prev" href="#"><span class="fa fa-arrow-left"></span>Prev Post</a>
                    <a class="aa-blog-next" href="#">Next Post<span class="fa fa-arrow-right"></span></a>
                  </div>
                  <!-- Blog Comment threats -->
                  <div class="aa-blog-comment-threat">
                    <h3>Comments (4)</h3>
                    <div class="comments">
                      <ul class="commentlist">
                        <li>
                          <div class="media">
                            <div class="media-left">    
                                <img class="media-object news-img" src="<%=request.getContextPath()%>/resources/img/testimonial-img-3.jpg" alt="img">      
                            </div>
                            <div class="media-body">
                             <h4 class="author-name">Charlie Balley</h4>
                             <span class="comments-date"> March 26th 2016</span>
                             <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English</p>
                             <a href="#" class="reply-btn">Reply</a>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="media">
                            <div class="media-left">    
                                <img class="media-object news-img" src="<%=request.getContextPath()%>/resources/img/testimonial-img-2.jpg" alt="img">      
                            </div>
                            <div class="media-body">
                             <h4 class="author-name">Charlie Balley</h4>
                             <span class="comments-date"> March 26th 2016</span>
                             <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English</p>
                             <a href="#" class="reply-btn">Reply</a>
                            </div>
                          </div>
                        </li>
                        <ul class="children">
                          <li class="author-comments">
                            <div class="media">
                              <div class="media-left">    
                                  <img class="media-object news-img" src="<%=request.getContextPath()%>/resources/img/testimonial-img-3.jpg" alt="img">      
                              </div>
                              <div class="media-body">
                               <h4 class="author-name">Admin</h4>
                               <span class="comments-date"> March 26th 2016</span>
                               <span class="author-tag">Author</span>
                               <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English</p>
                               <a href="#" class="reply-btn">Reply</a>
                              </div>
                            </div>
                          </li>
                          <ul class="children">
                            <li>
                              <div class="media">
                                <div class="media-left">    
                                    <img class="media-object news-img" src="<%=request.getContextPath()%>/resources/img/testimonial-img-2.jpg" alt="img">      
                                </div>
                                <div class="media-body">
                                 <h4 class="author-name">Charlie Balley</h4>
                                 <span class="comments-date"> March 26th 2016</span>
                                 <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English</p>
                                 <a href="#" class="reply-btn">Reply</a>
                                </div>
                              </div>
                            </li>
                          </ul>
                        </ul>
                        <li>
                          <div class="media">
                            <div class="media-left">    
                                <img class="media-object news-img" src="<%=request.getContextPath()%>/resources/img/testimonial-img-2.jpg" alt="img">      
                            </div>
                            <div class="media-body">
                             <h4 class="author-name">Charlie Balley</h4>
                             <span class="comments-date"> March 26th 2016</span>
                             <p>Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English</p>
                             <a href="#" class="reply-btn">Reply</a>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <div class="aa-blog-archive-pagination">
                      <nav>
                        <ul class="pagination">
                          <li>
                            <a href="#" aria-label="Previous">
                              <span aria-hidden="true">«</span>
                            </a>
                          </li>
                          <li><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="#">5</a></li>
                          <li>
                            <a href="#" aria-label="Next">
                              <span aria-hidden="true">»</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                  <!-- blog comments form -->
                  <div id="respond">
                    <h3 class="reply-title">Leave a Comment</h3>
                    <form id="commentform">
                      <p class="comment-notes">
                        Your email address will not be published. Required fields are marked <span class="required">*</span>
                      </p>
                      <p class="comment-form-author">
                        <label for="author">Name <span class="required">*</span></label>
                        <input type="text" name="author" value="" size="30" required="required">
                      </p>
                      <p class="comment-form-email">
                        <label for="email">Email <span class="required">*</span></label>
                        <input type="email" name="email" value="" aria-required="true" required="required">
                      </p>
                      <p class="comment-form-url">
                        <label for="url">Website</label>
                        <input type="url" name="url" value="">
                      </p>
                      <p class="comment-form-comment">
                        <label for="comment">Comment</label>
                        <textarea name="comment" cols="45" rows="8" aria-required="true" required="required"></textarea>
                      </p>
                      <p class="form-allowed-tags">
                        You may use these <abbr title="HyperText Markup Language">HTML</abbr> tags and attributes:  <code>&lt;a href="" title=""&gt; &lt;abbr title=""&gt; &lt;acronym title=""&gt; &lt;b&gt; &lt;blockquote cite=""&gt; &lt;cite&gt; &lt;code&gt; &lt;del datetime=""&gt; &lt;em&gt; &lt;i&gt; &lt;q cite=""&gt; &lt;s&gt; &lt;strike&gt; &lt;strong&gt; </code>
                      </p>
                      <p class="form-submit">
                        <input type="submit" name="submit" class="aa-browse-btn" value="Post Comment">
                      </p>        
                    </form>
                  </div>
                </div>
              </div>

              <!-- blog sidebar -->
              <div class="col-md-3">
                <aside class="aa-blog-sidebar">
                  <div class="aa-sidebar-widget">
                    <h3>Category</h3>
                    <ul class="aa-catg-nav">
                      <li><a href="#">Men</a></li>
                      <li><a href="">Women</a></li>
                      <li><a href="">Kids</a></li>
                      <li><a href="">Electornics</a></li>
                      <li><a href="">Sports</a></li>
                    </ul>
                  </div>
                  <div class="aa-sidebar-widget">
                    <h3>Tags</h3>
                    <div class="tag-cloud">
                      <a href="#">Fashion</a>
                      <a href="#">Ecommerce</a>
                      <a href="#">Shop</a>
                      <a href="#">Hand Bag</a>
                      <a href="#">Laptop</a>
                      <a href="#">Head Phone</a>
                      <a href="#">Pen Drive</a>
                    </div>
                  </div>
                  <div class="aa-sidebar-widget">
                    <h3>Recent Post</h3>
                    <div class="aa-recently-views">
                      <ul>
                        <li>
                          <a class="aa-cartbox-img" href="#"><img src="<%=request.getContextPath()%>/resources/img/woman-small-2.jpg" alt="img"></a>
                          <div class="aa-cartbox-info">
                            <h4><a href="#">Lorem ipsum dolor sit amet.</a></h4>
                            <p>March 26th 2016</p>
                          </div>                    
                        </li>
                        <li>
                          <a class="aa-cartbox-img" href="#"><img src="<%=request.getContextPath()%>/resources/img/woman-small-1.jpg" alt="img"></a>
                          <div class="aa-cartbox-info">
                            <h4><a href="#">Lorem ipsum dolor.</a></h4>
                            <p>March 26th 2016</p>
                          </div>                    
                        </li>
                         <li>
                          <a class="aa-cartbox-img" href="#"><img src="<%=request.getContextPath()%>/resources/img/woman-small-2.jpg" alt="img"></a>
                          <div class="aa-cartbox-info">
                            <h4><a href="#">Lorem ipsum dolor.</a></h4>
                            <p>March 26th 2016</p>
                          </div>                    
                        </li>                                      
                      </ul>
                    </div>                            
                  </div>
                </aside>
              </div>
            </div>           
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Blog Archive -->


  <!-- Subscribe section -->
  <jsp:include page="components/subcribe.jsp"></jsp:include>
  <!-- / Subscribe section -->

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
  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.smartmenus.bootstrap.js"></script>  
  <!-- To Slider JS -->
  <script src="<%=request.getContextPath()%>/resources/js/sequence.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/sequence-theme.modern-slide-in.js"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script> 

  </body>
</html>