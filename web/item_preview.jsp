<%@ page language="java" import="cn.hncu.Dao.PhotoInfoEntity" pageEncoding="utf-8" %>
<%@ page import="cn.hncu.Dao.QueryAllPhoto" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>Image Preview - Catalog by templatemo</title>
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
                <li class="active"><a href="index.jsp">主页</a></li>
                <li><a href="index.jsp#website_templates">人物图片</a></li>
                <li><a href="index.jsp#mini_templates">风景图片</a></li>
                <li><a href="index.jsp#flash_templates">卡通图片</a></li>
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
<div class="container">
    <div class="row" id="preview">
        <div class="row">
            <div class="col-md-12" id="img_preview">

                <h3><%=request.getParameter("realName")%>
                </h3>


                <a href="#" title="Click to see the original size">
                    <img src="<%=request.getParameter("dir")%>"
                         alt="templatemo 374 responsive" class="img-responsive" width="840" height="840">
                </a>

            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="preview_footer_container">

                    <div class="footer_item section_box">
                        <h4>图片详细描述信息</h4>
                        <p><b><%=request.getParameter("info")%><b></p>
                        <br>
                        <h5>图片类别</h5>
                        <p><b><%=request.getParameter("ext")%>
                        </b></p>

                    </div>

                    <div class="footer_item section_box">
                        <h4>其他信息</h4>

                        <br>
                        <h5>图片作者</h5>
                        <p><b><%=request.getParameter("ip")%>
                        </b></p>
                        <br>
                        <h5>发布时间</h5>
                        <p><b><%=request.getParameter("dt")%>
                        </b></p>
                    </div>

                    <div class="footer_item section_box">
                        <h4>图片操作</h4>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <a href="<%=request.getParameter("dir")%>" class="btn btn-primary" role="button">下载</a>
                        <%
                            String username = (String) session.getAttribute("username");
                            if (username != null && !username.equals("")) {
                        %>

                        <a href="DeletePic.action?filepath=<%=request.getParameter("dir")%>&id=<%=request.getParameter("id")%>"
                           class="btn btn-info" role="button">删除</a>
                        <%}%>

                    </div>

                </div> <!-- preview_footer_container -->
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <p class="row"><b>更多同类图片</b></p>
                <div class="item_container">

                    <% String category = request.getParameter("ext");
                        QueryAllPhoto query = new QueryAllPhoto();
                        ArrayList person_pic_list = query.QueryByExt(category);

                    %>

                    <%
                        for (int i = 0; i < person_pic_list.size() && i < 5; i++) {
                            PhotoInfoEntity tem = (PhotoInfoEntity) person_pic_list.get((int)(5000*Math.random())%person_pic_list.size());
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
                    %>

                </div> <!-- item container -->
            </div> <!-- col-md-12 -->
        </div>
    </div> <!-- row -->
</div> <!-- container -->
<footer class="container">
    <div class="credit">
        <p id="templatemo_cr_bar">
            Copyright © 2072 <a href="#">Your Company Name</a>
        </p>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
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
                "gutter": 10,
                isFitWidth: true
            });
        });

        var $fcontainer = $('.preview_footer_container');

        $fcontainer.masonry({
            itemSelector: '.footer_item',
            "gutter": 10,
            isFitWidth: true
        });
    }

</script>


</body>
</html>