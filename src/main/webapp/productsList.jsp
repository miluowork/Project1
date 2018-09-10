<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head> 
		<meta charset="UTF-8">
		<title></title>
		<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/header.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/fruit.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<style type="text/css">
		       /*  .sousuo-up{
		        padding: 0px;
		        }
		        */ 
				.searchBtn{
				    text-align:center !important;
				    background-color: red;
				    color: #fff;
				    width:50px;
				    height:30px;
				    margin-right:205px;
				    padding:0px;
				    top: 80px!important;
				    line-height: 0px !important;
				}
				
				 em{
				top:45px !important;
				} 
				
		</style>
		<script type="text/javascript">
		$(document).ready(function(){
			   if(${sessionScope.user.email!=null}){
				   $(".log-a1").remove();
				   $(".log-a2").remove();
				   $(".left").append("<a style='color:red;' href='${pageContext.request.contextPath}/Orders/uOrderList' class='user' >${sessionScope.user.email}</a></span>");
				   $(".left").append("<a style='color:red;margin-left:50px' href='#' class='exit' >退出登录</a></span>");
			   };
		});
		
		$(function(){
			$(document).on("click",".searchBtn",function(){
				var name=$(".sousuo-up input[type=text]").val();
				location.href="moreList?txt="+name;
			})
		})
		   
		</script>
	</head>
	<body>
	<jsp:include page="tanchu.jsp"></jsp:include>
		<div class="box">
			<div class="header">
				<jsp:include page="header1.jsp"></jsp:include>
				<div class="header2">
					<div class="header2-cont">
					<a href="../Products/picsList"><img src="/MarksWeb/lib/img/images/gengduo_03.png"/></a>  <!--172*62-->
						<div class="sousuo">
							<div class="sousuo-up">
								<input type="text" name="searchText" id="" value=""placeholder="泰国榴莲" />
								<em></em>
								<button  class="searchBtn">搜索</button>
							</div>
							<div class="sousuo-down">
								<div class="clear"></div>
							</div>
						</div>
						<div class="gouwuche">
							<a href="../ShopCar/carList?user_id=${sessionScope.user.id}"><em></em></a><span>购物车</span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="header3">
					<div class="header3-cont">
						<ul>
							<li class="l1">全部分类</li>
							<li class="l2" onclick="location='../Products/picsList'">首页</li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
		</div>
		<!--导航横线-->
		<div class="line"></div>
		  <!--分类-->
		<div class="cont-xg">
			<div class="fenlei">
				<div class="bread">
					首页&nbsp;<em class="em1"></em>
					<!-- &nbsp;<span>水果&nbsp;<em></em>&nbsp;</span> -->
				</div>
				
			</div>
			<!--商品-->
			<div class="sp">
				<div class="title-sp">
				<span class="s1">综合排序</span><span class="s2">销量</span><span  class="s2">价格</span><span  class="s2">评价</span class="s2"><span class="s2">上架时间</span>
			   </div>
			   <script type="text/javascript">
			   	  $('.sp .title-sp span').mouseenter(function () {
			   	  	$(this).css({'background':'#d63a3b','color':'#fdfcfc'})
			   	  })
			   	  $('.sp .title-sp span').mouseleave(function () {
			   	  	$(this).css({'background':'#ffffff','color':'#3c3b3a'})
			   	  	$('.sp .title-sp .s1').css({'background':'#d63a3b','color':'#fdfcfc'})
			   	  })
			   </script>
			   <!--商品图片-->
			   <ul>
			   <c:if test="${requestScope.moreList!=null}">
			   <c:forEach items="${requestScope.moreList}" var="r" varStatus="v" >
			   	<li>
			   	<a class="a1" href="infos?id=${r.id}">
			   		<img src="${r.pic}" width="159px"  height="159px"/>
			   		<div class="wenzi">
			   			<p class="p1">珍享<span>${r.fullname}</span></p>
				   		<p class="p2">￥${r.nowprice}</p>
				   		<p class="p3">已售<span>${r.salecount}</span>件</p>
			   		</div>
			   	</a>	
			   	</li>
			   	</c:forEach>
			   	</c:if>
			   	
			   	<c:if test="${requestScope.moreList==null}">
			   	<li>
			   	<a class="a1" href="infos?id=${r.id}">
			   		<div class="wenzi">
			   		<p class="p1">抱歉,目前没有该商品~</p>
			   		</div>
			   	</a>	
			   	</li>
			   	</c:if>
			   </ul>
			   <script type="text/javascript">
			   	     $('.cont-xg .sp ul li').mouseenter(function () {
			   	     	$(this).css('border-color','#d63a3b')
			   	     })
			   	     $('.cont-xg .sp ul li').mouseleave(function () {
			   	     	$(this).css('border-color','#ffffff')
			   	     })
			   </script>
			   <div class="page">
			   	  <span class="s1">上一页</span>
			   	  <span class="s5">1</span>
			   	  <span class="s3">2</span>
			   	  <span class="s3">3</span>
			   	  <span class="s3">···</span>
			   	  <span class="s2">50</span>
			   	  <span class="s1">下一页</span>
			   	  <span class="s4">共50页</span>
			   	  <span class="s4">到第</span>
			   	  <span class="s2">2</span>
			   	  <span class="s4">页</span>
			   	  <span class="s1">确定</span>
			   </div>
			   <script type="text/javascript">
			   	  $('.page .s1').mouseenter(function(){
			   	  	$(this).css({'background':'#d63a3b','color':'#ffffff'})
			   	  })
			   	  $('.page .s1').mouseleave(function () {
			   	     	$(this).css({'background':'#eeeeee','color':'#2d2c2c'})
			   	     })
			   	  $('.page .s2').mouseenter(function(){
			   	  	$(this).css({'background':'#d63a3b','color':'#ffffff'})
			   	  })
			   	  $('.page .s2').mouseleave(function () {
			   	     	$(this).css({'background':'#eeeeee','color':'#2d2c2c'})
			   	     })
			   	  $('.page .s3').mouseenter(function(){
			   	  	$(this).css({'background':'#d63a3b','color':'#ffffff'})
			   	  })
			   	  $('.page .s3').mouseleave(function () {
			   	     	$(this).css({'background':'#none','color':'#2d2c2c'})
			   	     })
			   </script>
			</div>
			
		</div>
		<footer>
		<div class="up">
			<ul class="cont">
				<li class="l1"><a href=""><span class="s1"></span><i class="i1">顺丰包邮</i></a></li>
				<li class="l1"><a href=""><span class="s2"></span><i class="i1">同城次日到达</i></a></li>
				<li class="l1"><a href=""><span class="s3"></span><i class="i1">7天无理由退换货</i></a></li>
				<li class="l1"><a href=""><span class="s4"></span><i class="i1">线下体验店</i></a></li>
				<li class="l2">
					<p class="p1">24小时全国服务热线</p>
					<p class="p2">400-888-8888</p>
					<p class="p3"><a href=""><span class="s5"></span><i class="i2">联系客服</i></a></p>
				</li>
				
			</ul>
			<div class="clear"></div>
		</div>
		<div class="down">
			<div class="one">
				<ol>
					<dt><a href="">购物指南</a></dt>
					<dd><a href="">购物流程</a></dd>
					<dd><a href="">支付方式</a></dd>
				</ol>
				<ol>
					<dt><a href="">购物指南</a></dt>
					<dd><a href="">购物流程</a></dd>
					<dd><a href="">支付方式</a></dd>
				</ol>
				<ol>
					<dt><a href="">购物指南</a></dt>
					<dd><a href="">购物流程</a></dd>
					<dd><a href="">支付方式</a></dd>
				</ol>
				<ol>
					<dt><a href="">购物指南</a></dt>
					<dd><a href="">购物流程</a></dd>
					<dd><a href="">支付方式</a></dd>
				</ol>
				<ol>
					<dt><a href="">购物指南</a></dt>
					<dd><a href="">购物流程</a></dd>
					<dd><a href="">支付方式</a></dd>
				</ol>
				
				<div class="ew1">
					<p><img src="/MarksWeb/lib/img/er.png"/></p>
					<p>鲜生购公众号</p>
					
				</div>
				<div class="ew2">
					<p><img src="/MarksWeb/lib/img/er.png"/></p>
					<p>鲜生购APP</p>
				</div>
			</div>
			<div class="clear"></div>
			<div class="two"></div>
			<div class="three">
				<span>网络文化经营许可证：19333520156</span>
				<span>鲁公网安备：25854651152</span>
				<span>违法和不良信息举报电话：110</span>
				<span>消费者维权电话：12305</span>
				<p>Copyright&nbsp;©&nbsp;2010-2020&nbsp;xianshenggou.com&nbsp;版权所有</p>
			</div>
			
	</footer>	
		</div>
	</body>
</html>
