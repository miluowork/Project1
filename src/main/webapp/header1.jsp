<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>  
		<meta charset="utf-8"/>
		<title></title>
		<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/header.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/homepage.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/enter.css"/>
		
</head>
<body>		
	<div class="header1">
					<div class="header1-cont">
						
						<div class="left onlyLeft">
							欢迎您来到鲜生购,&nbsp;
							<a class="a1 log-a1">请登录</a>&nbsp;<span>
							<a href="${pageContext.request.contextPath}/regist.jsp" class="a2 log-a2" >免费注册</a></span>
						</div>
						<div class="right onlyRight">
							<ul>
								<li><a href="${pageContext.request.contextPath}/Orders/uOrderList">我的订单<em></em></a></li>
								<li><a href="${pageContext.request.contextPath}/ShopCar/carList?user_id=${sessionScope.user.id}">购物车<em></em></a></li>
								<li><a href="${pageContext.request.contextPath}/Orders/uOrderList">会员中心<em></em></a></li>
							</ul>
							<div class="clear">
								
							</div>
							
						</div>
						
					</div>
					<div class="clear">
						
					</div>
					
				</div>
		</body>
	</html>