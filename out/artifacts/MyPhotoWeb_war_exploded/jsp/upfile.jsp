<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件上传</title>
  </head>
  
  <body>
<!--   一般的界面格式   --> 
  <form action="<%=request.getContextPath()%>/servlet/MyFileUp" method="post" enctype="multipart/form-data">
  	上传文件<input type="file" name="file"/><br/>
  	文件名<input type="text" name="desc"/>
  	<input type="submit" value="上传"/>
  	</form>
  	
  </body>
</html>
