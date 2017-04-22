<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<title>Contact - Catalog by templatemo</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
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
						<li><a href="index.jsp">主页</a></li>
						<li><a href="AllPersonPic.jsp">人物图片</a></li>
						<li><a href="AllSightPic.jsp">风景图片</a></li>
						<li><a href="AllCartoonPic.jsp">卡通图片</a></li>
						<li class="active"><a href="contact.jsp">图片上传</a></li>
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
		
		<section class="container">
			<h3>图片上传</h3>
			<p>请选择本地图片进行上传。</p>
			<form role="form" enctype="multipart/form-data" method="post" action="UploadPic">
				<div class="row">
					<div class="col-md-5">
						<div class="form-group">
							<input name="pic_name" type="text" class="form-control" id="pic_name" placeholder="图片名称">
						</div>
						<div class="form-group">
							<select name="pic_ext" type="text" class="form-control" id="pic_ext" placeholder="图片类型">
								<option>卡通图片</option>
								<option>风景图片</option>
								<option>人物图片</option>
							</select>
						</div>
						<div class="form-group">
							<input type="file" name="pic_data" id="pic_data" class="form-control"/>

						</div>
					</div> 
					<div class="col-md-7">
						<div class="form-group">
						  	<textarea name="pic_info" rows="6" class="form-control" id="pic_info" placeholder="图片描述信息..."></textarea><br>

							<button type="submit" class="btn btn-primary">确认上传</button>

						</div>
					</div>


				</div> <!-- row -->
			</form>




			<hr class="featurette-divider">

		</section>







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
	</body>
</html>




