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
		<script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/header.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/homepage.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/enter.css"/>
		<style type="text/css">
			.header3 .header3-cont ul .l3{
	               color: #D63A3B;
	               }
	               
	        dl dd a {
			    font-family: "微软雅黑";
			    font-size: 14px !important;
			    color: #948F88;
			    line-height: 20px;
			    margin-right: 6px;
                 }
            dl dt a {
			    font-family: "微软雅黑";
			    font-size: 16px;
			    color: #ffffff;
			    line-height: 20px;
			    margin-right: 6px;
                }
	        .sub{
	        width:80px!important;
	        height: 28px!important;
	        text-align: center!important;
	        padding-left:0px!important;
	            } 
	        
	        

		</style>
		<script type="text/javascript">
		$(document).ready(function(){
			  if(${requestScope.list1==null}){
			    location.href='../Products/picsList';
			    return;
			   };  
			   
			   if(${sessionScope.user.email!=null}){
				   $(".log-a1").remove();
				   $(".log-a2").remove();
				   $(".onlyLeft").append("<a style='color:red;' href='${pageContext.request.contextPath}/Orders/uOrderList' class='user' >${sessionScope.user.email}</a></span>");
				   $(".onlyLeft").append("<a style='color:red;margin-left:50px' href='#' class='exit' >退出登录</a></span>");
			   };
		});
		   
		</script>
		
	</head>
	<body>
	<!-- 登录弹出框 -->
	<jsp:include page="tanchu.jsp"></jsp:include>
		<div class="box">
			<div class="header">
			<!-- 登录导航条 -->
			<jsp:include page="header1.jsp"></jsp:include>
				<div class="header2">
					<div class="header2-cont">
						<a href="../Products/picsList"><img src="/MarksWeb/lib/img/images/gengduo_03.png"/></a>  <!--172*62-->
						<div class="sousuo">
								<form action="fullnamelist" method="post">
								   <div class="sousuo-up">
		                                <input type="text" name="fullname"  id=""  placeholder="泰国榴莲" />
										<em></em>
										<input type="submit" class="sub" name="txt" value="搜索" />
                                   </div>
							    </form>
							<div class="sousuo-down">
								<div class="clear">
									
								</div>
							</div>
							
						</div>
						<div class="gouwuche">
							<a href="../ShopCar/carList?user_id=${sessionScope.user.id}"><em></em></a><span>购物车</span>
						</div>
					</div>
					<div class="clear">
						
					</div>
					
				</div>
				<div class="header3">
					<div class="header3-cont">
						<ul>
							<li class="l1">全部分类</li>
							<div class="all">
							<c:forEach items="${requestScope.list}" var="r">
							   <dl>
							        <c:if test="${r.parentid==0}">
									<dt><a href="javascript:;">${r.typename}</a></dt>
									</c:if>
									<dd> 
									<c:forEach items="${requestScope.list}" var="rr" >
									<c:if test="${rr.parentid==r.id}">
										<a href="moreList?txt=${rr.id}" >${rr.typename}</a>
										&nbsp;
									</c:if>
									</c:forEach>
									</dd>
							  </dl>
							</c:forEach>
								<a class="more" href="../productsList.jsp" >
									更多<em></em>
								</a>
							</div>
							<li class="l2 l3">首页</li>
							<li class="l2">主厨先生</li>
							<li class="l2">每日推荐</li>
							<li class="l2">会员专享</li>
							<li class="l2">品质保障</li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
		</div>
		<div class="banner">
			<img src="/MarksWeb/lib/img/banner.png"/>
			<img src="/MarksWeb/lib/img/images/badjksa_02.png"/>
			<img src="/MarksWeb/lib/img/images/badjksa_02.png"/>
			<ul>
					<li class="current"></li>
					<li></li>
					<li></li>
			</ul>
		</div>
		<script type="text/javascript">
				var n=0
		     function again(){
		     	$('.banner img').last().animate({'marginLeft':'-1349',opacity:'0'},1500,function(){
					$(this).css({opacity:'1','marginLeft':'0'});
					$('.banner').prepend($('.banner img').last())
					if(n<$('.banner ul li').length-1){
						n++;
						$('.banner ul li').eq(n).addClass('.banner ul current').siblings().removeClass('.banner ul current');
					}else{
						n=0;
						$('.banner ul li').eq(n).addClass('.banner ul current').siblings().removeClass('.banner ul current');
					}
				})
		     }
			setInterval(again,1800);
			</script>
		</div>
		<div class="box2">
			<div class="banner-small" style="margin-top:110px">
				<div class="every">
					<p><img src="/MarksWeb/lib/img/mr.png"/></p>
					<p>每日推荐</p>
				</div>
				<div class="s1">
					<a href="#"><img src="/MarksWeb/lib/img/jiulian.png"/></a>
				</div>
				<div class="s1">
					<a href="#"><img src="/MarksWeb/lib/img/s2.png"/></a>
				</div>
				<div class="s1">
					<a href="#"><img src="/MarksWeb/lib/img/s3.png"/></a>
				</div>
				<div class="s1">
					<a href="#"><img src="/MarksWeb/lib/img/xiaolongxia.png"/></a>
				</div>
		    </div>
		    <div class="clear">
		    </div>
		   
		   <!--  <script type="text/javascript">
		    $(function(){
		    	$('.header1-cont .left .a1').click(function(){
					$('.tanchu').css('display','block')
				});
				$('.close').click(function () {
					$('.tanchu').css('display','none')
				});
		    })
			    
				
				
			</script> -->
			
			
			    
		        <!--新品上市-->
		    <div class="xpss">
		    	<div class="xpss1">
		    		<p class="p1 ">新品上市</p>
		    		<p class="p2 "><a href="">更多<em></em></a></p>
		    	</div>
		    	
		    	<div class="clear"></div>
		    	
		    	<div class="xpss2">
		    		<a class="a1" href=""><img src="/MarksWeb/lib/img/xp1.png"/></a>
		    		<c:forEach items="${sessionScope.list1}" begin="0" end="4"  var="r" varStatus="v">
		    		   <a class="a2" href="infos?id=${r.id}">
		    			        <em></em>
				    			<p class="p1">
				    			<c:if test="${r.pic!=null}">
				                   <img src="${r.pic}" width="150" height="143"/>
				                </c:if>
				    			</p>
				    			<p class="p2" style="text-align: center;">${r.fullname}</p>
				    			<p class="p3">绿色农场采摘  健康有机</p>
				    			<p class="p4">￥${r.nowprice}</p>
				    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		   </a>
		    		</c:forEach>
		    	</div>
		    	
		    	<div class="clear">
		    		
		    	</div>
		    	
		    	
		    </div>
		    
		    <!--品牌专卖-->
		    <div class="xpss">
		    	<div class="xpss-pp">
		    		<p class="p1 ">品牌专卖</p>
		    		<p class="p2 "><a href="">更多<em></em></a></p>
		    	</div>
		    	<div class="clear"></div>
		    	<div class="xpss2">
		    		<a class="a1" href=""><img src="/MarksWeb/lib/img/pp1.png"/></a>
		    		<a href="fruit.html"><img src="/MarksWeb/lib/img/pp2.png"/></a>
		    		<c:forEach items="${requestScope.list1}"  begin="0" end="2" var="r" varStatus="v">
		    		  <a class="a2" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		
		    		
		    		
		    	</div>
		    	<div class="ppzm-3">
		    		<a href=""><img src="/MarksWeb/lib/img/pp8.png"/></a>
		    		<a  class=""><img src="/MarksWeb/lib/img/pp4.png"/></a>
		    		<c:forEach items="${requestScope.list2}" begin="0" end="1" var="r" varStatus="v">
		    		  <a class="a1" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		<c:forEach items="${requestScope.list2}"  begin="0" end="0" var="r" varStatus="v">
		    		  <a class="a1" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		
		    	</div>
		    	<div class="clear"></div>
		    	<div class="banner2">
		    		<img src="/MarksWeb/lib/img/banner2.png"/>
		    		
		    	</div>
		    </div>
		    <!--水果专场-->
		    <div class="fruit">
		    	<div class="title">
		    		<a href="fruit.html"><p class="p1">水果专场</p></a>
		    		<p class="p2 "><a href="">更多<em></em></a></p>
		    	</div>
		    	<div class="content1">
		    		<a href=""><img src="/MarksWeb/lib/img/gdi.png"/></a>
		    		<a href=""><img src="/MarksWeb/lib/img/sdhfg.png"/></a>
		    		
		    		<c:forEach items="${requestScope.list1}" begin="0" end="1" var="r" varStatus="v">
		    		  <a class="a1" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		
		    	</div>
		    	<div class="content2">
		    		<div class="left">
		    			<div class="up">
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    					<li><a href="">柚子</a></li>
		    					<li><a href="">芒果</a></li>
		    					<li><a href="">西瓜</a></li>
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    					<li><a href="">柚子</a></li>
		    					<li><a href="">芒果</a></li>
		    					<li><a href="">西瓜</a></li>
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    					<li><a href="">柚子</a></li>
		    					<li><a href="">芒果</a></li>
		    					<li><a href="">西瓜</a></li>
		    				</ul>
		    			</div>
		    			<div class="down">
		    				<p class="p1">今日鲜果快讯</p>
		    				<p class="p2"><span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、
								  亚酸性、甜性。 酸性水果: 葡萄柚、橘子、凤梨、奇异果、柠檬、
								  酸苹果、草莓、酸李 亚酸性水果:苹果、芒果、杏子、木瓜、
								  葡萄、桃子等。</p>
		    			</div>
		    			
		    		</div>
		    		<c:forEach items="${requestScope.list1}" begin="0" end="3"  var="r" varStatus="v">
		    		  <a class="a1" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		
		    	</div>
		    </div>
		    <!--蔬菜专场-->
		    <div class="vegetable">
		    	<div class="title">
		    		<p class="p1 ">蔬菜专场</p>
		    		<p class="p2 "><a href="">更多<em></em></a></p>
		    	</div>
		    	<div class="content1-v">
		    		<a href=""><img src="/MarksWeb/lib/img/gdiu.png"/></a>
		    		
		    		
		    		
		    		<a class="a1" href="infos?id=${requestScope.list2.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list2.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list2.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${requestScope.list2.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list2.get(0).salecount}</span>件</p>
		    		</a>
		    		<a  class="a2">
		    			<img src="/MarksWeb/lib/img/ijhfd.png"/>
		    		</a>
		    		<a class="a1" href="infos?id=${requestScope.list2.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list2.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list2.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${requestScope.list2.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list2.get(0).salecount}</span>件</p>
		    		</a>
		    		<a class="a1" href="infos?id=${requestScope.list2.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list2.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list2.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${requestScope.list2.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list2.get(0).salecount}</span>件</p>
		    		</a>
		    		
		    	</div>
		    	<div class="content2-v">
		    		<div class="left">
		    			<div class="up">
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    			</div>
		    			<div class="down">
		    				<p class="p1">今日鲜果快讯</p>
		    				<p class="p2"><span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、
								  亚酸性、甜性。 酸性水果: 葡萄柚、橘子、柠檬等。
								</p>
		    			</div>
		    		</div>
		    		<c:forEach items="${requestScope.list2}" var="r" varStatus="v">
		    		  <a class="a2" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		<c:forEach items="${requestScope.list2}" var="r" varStatus="v">
		    		  <a class="a2" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		
		    	    <a class="a2" href="infos?id=${requestScope.list2.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list2.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list2.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">绿色农场采摘  健康有机</p>
		    			<p class="p4">￥${requestScope.list2.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list2.get(0).salecount}</span>件</p>
		    		</a>
		    			
		    	</div>
		    	<div class="clear"></div>
		    </div>
		    <!--海鲜水产-->
		    <div class="fish">
		    	<div class="title">
		    		<p class="p1 ">海鲜水产</p>
		    		<p class="p2 "><a href="">更多<em></em></a></p>
		    	</div>
		    	<div class="content1-v">
		    		<a href=""><img src="/MarksWeb/lib/img/hdsjkf.png"/></a>
		    		
		    		<c:forEach items="${requestScope.list5}" begin="0" end="1"  var="r" varStatus="v">
		    		  <a class="a1" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		<a  class="a2">
		    			<img src="/MarksWeb/lib/img/gsjabfdf.png"/>
		    		</a>
		    		<a class="a1" href="infos?id=${requestScope.list5.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list5.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list5.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${requestScope.list5.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list5.get(0).salecount}</span>件</p>
		    		</a>
		    	</div>
		    	<div class="content2-v">
		    		<div class="left">
		    			<div class="up">
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    			</div>
<div class="down">
		    				<p class="p1">今日鲜果快讯</p>
		    				<p class="p2"><span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、
								  亚酸性、甜性。 酸性水果: 葡萄柚、橘子、柠檬等。
							</p>
		    			</div>
		    		</div>
		    		
		    		<c:forEach items="${requestScope.list5}" begin="0" end="5" var="r" varStatus="v">
		    		  <a class="a2" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="130px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		<a class="a2" href="infos?id=${requestScope.list5.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list5.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list5.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${requestScope.list5.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list5.get(0).salecount}</span>件</p>
		    		</a>
		    		
		    	</div>
		    	<div class="clear">
		    		
		    	</div>
		    	
		    </div>
		    
		      <!--猪牛羊肉-->
		    <div class="meat">
		    	<div class="title">
		    		<p	class="p1">猪牛羊肉</p>
		    		<p class="p2 "><a href="">更多<em></em></a></p>
		    	</div>
		    	<div class="content1-v">
		    		<a href=""><img src="/MarksWeb/lib/img/hdsgf.png"/></a>
		    		
		    		<c:forEach items="${requestScope.list6}" begin="0" end="4" var="r" varStatus="v">
		    		  <a class="a1" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="151px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		<a class="a1" href="infos?id=${requestScope.list5.get(0).id}">
		    			<p class="p1"><img src="${requestScope.list5.get(0).pic}" width="130px" height="120"/></p>
		    			<p class="p2">绿鲜知&nbsp;${requestScope.list5.get(0).fullname} &nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${requestScope.list5.get(0).nowprice}</p>
		    			<p class="p5">已售<span>${requestScope.list5.get(0).salecount}</span>件</p>
		    		</a>
		    		
		    		
		    		
		    	</div>
		    	<div class="content2-v">
		    		<div class="left">
		    			<div class="up">
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    					
		    					
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    					
		    					
		    				</ul>
		    				<ul>
		    					<li><a href="">草莓</a></li>
		    					<li><a href="">香蕉</a></li>
		    					<li><a href="">牛油果</a></li>
		    					<li><a href="">橙子</a></li>
		    				</ul>
		    			</div>
		    			<div class="down">
		    				<p class="p1">今日鲜果快讯</p>
		    				<p class="p2"><span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、
								  亚酸性、甜性。 酸性水果: 葡萄柚、橘子、柠檬等。
								</p>
		    			</div>
		    			
		    		</div>
		    		<c:forEach items="${requestScope.list6}" begin="0" end="2"  var="r" varStatus="v">
		    		  <a class="a2" href="infos?id=${r.id}">
		    			<p class="p1"><img src="${r.pic}" width="151px" height="120px"/></p>
		    			<p class="p2">绿鲜知  &nbsp;  ${r.fullname}&nbsp;500g</p>
		    			<p class="p3">深海捕捞 健康有机</p>
		    			<p class="p4">￥${r.nowprice}</p>
		    			<p class="p5">已售<span>${r.salecount}</span>件</p>
		    		  </a>
		    		</c:forEach>
		    		<a  class="a2">
		    			<img src="/MarksWeb/lib/img/sgsd.png"/>
		    		</a>
		    		
		    	</div>
		    	<div class="clear">
		    		
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
