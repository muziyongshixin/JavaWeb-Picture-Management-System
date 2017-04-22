<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="cn.hncu.Dao.QueryAllPhoto" %>
<%@ page import="cn.hncu.Dao.PhotoInfoEntity" %>
<!-- templatemo 379 catalog -->
<!--
Catalog Template
http://www.templatemo.com/preview/templatemo_379_catalog
-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog Responsive Template by templatemo</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet"
          type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/offcanvas/offcanvas.css" rel="stylesheet">
    <link href="templatemo_style.css" rel="stylesheet" type="text/css">

    <!-- HTML 5 shim for IE backwards compatibility -->
    <!-- [if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js">
    </script>
    <![endif]-->
</head>
<body>
<header>
    <div class="container logo">
        <div class="row">
            <div class="col-md-12"><a href="#"><img src="images/templatemo_logo.png" alt="catalog"></a></div>
        </div>
    </div>
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li ><a href="index.jsp">主页</a></li>
                <li><a href="AllPersonPic.jsp">人物图片</a></li>
                <li><a href="AllSightPic.jsp">风景图片</a></li>
                <li class="active"><a href="AllCartoonPic.jsp">卡通图片</a></li>
                <li><a href="contact.jsp">图片上传</a></li>
            </ul>
            <form action="SearchResult.jsp" method="post" class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" name="keyword" id="keyword" placeholder="图片查询">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </nav>
</header>
<div class="container" id="home">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">

            <div class="sidebar-nav">

                <h4>JavaWeb图片管理</h4>
                <ul class="sidebar_menu">
                    <br>
                    <li><a href="#">图片分类浏览</a></li>
                    <li><a href="#">图片上传和下载</a></li>
                    <li><a href="#">图片模糊搜索</a></li>
                    <li><a href="#">图片详细信息查询</a></li>

                </ul>

                <hr>

                <h4><b>功能描述</b></h4>
                <p>通过本系统你能够分类浏览不同种类的图片，包括风景类图片、人物类图片、卡通类图片，每一类图片在首页默认最多展示8张，如果想查看更多图片可以点击“查看更多”按钮。
                    对于每一张图片可以点击图片进入相应的详情页，在详情页中可以看到图片的详细信息，发布者、发布时间、图片详细描述等。
                    同时你可以使用搜索框利用关键字对图片名称进行模糊搜索，所有满足要求的结果都会展示在结果页面。
                    同时你可以在上传图片页面上传你自己感兴趣的图片，将其分享给其他的用户。
                </p>

                <div class="cleaner h10"></div>


                <hr>

                <h4><b>注意事项</b></h4>
                <p>由于这是一个JavaEE的课程是实验项目，其可靠性有限，对于上传的图片不得超过2MB，否则将会报错。上传图片时请填写正确的图片类别，谢谢！
                    <cite><b>Designed by <a href="#"><span>李勇志</span></a></b></cite>
                <hr>

                <div class="social_buttons">
                    <a href="#" class="icon-button twitter"><i class="icon-twitter"></i><span></span></a>
                    <a href="#" class="icon-button facebook"><i class="icon-facebook"></i><span></span></a>
                    <a href="#" class="icon-button google-plus"><i class="icon-google-plus"></i><span></span></a>
                </div>

                <hr>

            </div>

        </div> <!-- col sidebar -->

        <div class="col col-xs-12 col-sm-9">
            <p class="pull-left visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>

            <section class="row" id="website_templates">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <h3>所有卡通图片</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="item_container">
                            <%  String category = "卡通图片";
                                QueryAllPhoto query = new QueryAllPhoto();
                                ArrayList pic_list = query.QueryByExt(category);

                            %>

                            <%
                                if (pic_list.size() == 0) {
                            %>
                            <div class="item">
                                <p><b>查询不到相关的图片。</b></p>
                            </div>
                            <% } else {

                                for (int i = 0; i < pic_list.size(); i++) {
                                    PhotoInfoEntity tem = (PhotoInfoEntity) pic_list.get(i);
                            %>
                            <div class="item">
                                <a href="item_preview.jsp?id=<%=tem.getId()%>&dir=<%=tem.getDir()%>&ext=<%=tem.getExt()%>&realName=<%=tem.getRelName()%>&ip=<%=tem.getIp()%>&dt=<%=tem.getDt()%>&info=<%=tem.getInfo()%>"
                                   class="thumbnail">
                                    <img src="<%=tem.getDir()%>" alt="377 blue tech">
                                    <p><%=tem.getRelName()%>
                                    </p>
                                </a>
                            </div>

                            <%
                                    }
                                }
                            %>
                            <!-- 一张图片的信息==========================================================================================================================-->


                        </div>
                    </div>
                </div>

            </section> <!-- website templates -->


        </div> <!-- col -->
    </div>  <!-- row -->
</div> <!-- container -->
<footer class="container">
    <div class="credit">
        <p id="templatemo_cr_bar">
            Copyright © 2017 <a href="#">木子勇士心</a>
        </p>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/offcanvas.js"></script>
<!--
http://masonry.desandro.com/
http://desandro.mit-license.org/
http://stackoverflow.com/questions/17767130/masonry-js-error-uncaught-typeerror-object-object-object-has-no-method-imag
Align items in center: https://github.com/desandro/isotope/issues/20
Hiding text overflow: http://stackoverflow.com/questions/15308061/how-to-avoid-text-overflow-in-twitter-bootstrap
-->
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script>

    $(document).ready(function () {
        init_masonry();
    });

    function init_masonry() {
        var $container = $('.item_container');
        $container.imagesLoaded(function () {
            $container.masonry({
                itemSelector: '.item',
                "gutter": 18,
                isFitWidth: true
            });
        });
    }

    $(function () {
        $('a[href*=#]:not([href=#])').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });

</script>
</body>
</html>