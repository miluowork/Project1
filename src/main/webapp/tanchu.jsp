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
<div class="tanchu">
			<div class="denglu">
				<div class="denglu-cont">
				<form action="" class="loginForm" >
					<p class="p1"><span class="s1">账号登录</span><span class="s2">扫码登录</span></p>
					<div class="name">
						<input  name="email" class="uEmail" type="text" value=""  placeholder="用户名/邮箱"/>
					</div>
					<div class="name">
						<input  name="password" class="uPassword"  type="password"  value="" placeholder="请输入密码"/>
					</div>
					<p class="p2">忘记密码？</p>
					<button type="button" class="loginBtn">立即登录</button>
					</form>
					<div class="else">
					<ul class="weixin">
						<li>
							<em class="e1"></em>&nbsp;微信
						</li>
						<li>
							<em class="e2"></em>&nbsp;微博
						</li>
						<li>
							<em class="e3"></em>&nbsp;QQ
						</li>
						
					</ul>
					<div class="clear"></div>
					
				</div>
				</div>
				<a class="close">
					
				</a>
				
			</div>
		</div>
</body>		
</html>