<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>  
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/header.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/Detail page.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<link rel="stylesheet" href="/MarksWeb/lib/css/font-awesome.min.css" />
		<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	    <script src="/MarksWeb/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	    <script src="/MarksWeb/lib/js/jquery.jqzoom.js" type="text/javascript" charset="utf-8"></script>
	    <script src="/MarksWeb/lib/js/base.js" type="text/javascript" charset="utf-8"></script>
	    <script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
	    <script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
	    <!-- <script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script> -->
	   
<script type="text/javascript">
      function numChange(o){
    	  var a=$(".number3").val();
    	  if($(o).is('.jia')){
    		  $(".number3").val(parseInt(a)+1);
    	  }else{
    		  if(parseInt(a)>1){
    			  $(".number3").val(parseInt(a)-1); 
    		  }else{
    			  $(".number3").val(1);
    		  }
    	  }
      };
      $(document).on("click",".goumai2",function(){
    	  var product_id=${requestScope.infos.id};
    	  var user_id=${sessionScope.user.id};
    	  var count=parseInt($(".number3").val());
    	  var jsons={
    			  product_id:product_id,
    			  user_id:user_id,
    	          count:count,
    	            };
    	  $.ajax({
              type:'POST',  //提交方法是POST
              url:'../ShopCar/shopCarPdt', //请求的路径
              data:JSON.stringify(jsons), //表单序列化         //以JSON字符串形式把 user 传到后台
              contentType: "application/json; charset=utf-8",
              dataType:"text", //后台返回的数据类型是html文本
              timeout:3000,  //请求超时时间，毫秒
              error:function(){  //请求失败的回调方法
            	  layer.msg('请求失败',{icon:1,time:1000});
              },
              success:function(result){//请求成功的回调方法
                  if(result!="" && result == "success"){
                	  layer.msg('添加成功!'+"",{icon:1,time:1000});
                  }
              }
          });
    	  
      });
      

</script>
<style type="text/css">
   .jia,.jian{
    display: inline-block;
    width: auto;
    height: auto;
    border: 1px solid #bfbfbf;
    background: #f5f2f8;
    font-size: 12px;
    color: #4a4a4a;
    font-family:glyphicons halflings;
    line-height: 20px;
    text-align: center;
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
</script>
<script type="text/javascript">


$(function(){
	$('.header1-cont .left .a1').click(function(){
		$('.tanchu').css('display','block')
	});
	$('.close').click(function () {
		$('.tanchu').css('display','none')
	});
})
</script>

	</head>
	<body>
	<div class="tanchu" style="display:none">
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
	<%-- <jsp:include page="tanchu.jsp"></jsp:include> --%>
		<div class="box">
			<div class="header">
				<%-- <jsp:include page="header1.jsp"></jsp:include> --%>
				<div class="header1">
					<div class="header1-cont">
						
						<div class="left">
							欢迎您来到鲜生购,&nbsp;
							<a class="a1 log-a1">请登录</a>&nbsp;<span>
							<a href="${pageContext.request.contextPath}/regist.jsp" class="a2 log-a2" >免费注册</a></span>
						</div>
						<div class="right">
							<ul>
								<li>我的订单<em></em></li>
								<li><a href="${pageContext.request.contextPath}/ShopCar/carList?user_id=${sessionScope.user.id}">购物车<em></em></a></li>
								<li><a href="${pageContext.request.contextPath}/user.jsp">会员中心<em></em></li></a>
							</ul>
							<div class="clear">
								
							</div>
							
						</div>
						
					</div>
					<div class="clear">
						
					</div>
					
				</div>
				<div class="header2">
					<div class="header2-cont">
						<a href="../Products/picsList"><img src="/MarksWeb/lib/img/images/gengduo_03.png"/></a>   <!--172*62-->
						<div class="sousuo">
							<div class="sousuo-up">
							</div>
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
			
		</div>
		<div class="cont">
			<div class="banner">
				<img src="/MarksWeb/lib/img/sha.png"/>
			</div>
			<div class="buy">
				<p class="p1">您现在的位置：<span class="s1">首页<em></em>新鲜水果专场<em>></em></span><span class="s2">榴莲</span></p>
			</div>
		</div>
		<!--图片展示-->
		<div class="container boxs">
			<div class="top fl">
				<div class="overflow" >
					<div id="preview" class="spec-preview"> <span class="jqzoom"><img  width="521px" height="507px" jqimg="${requestScope.infos.pic}" src="${requestScope.infos.pic}" /></span> </div>
				</div>
				<!--缩图开始-->
				<div class="spec-scroll">
					<div class="re">
						<div class="prev"><img src="/MarksWeb/lib/img/images/ajdhfk_03.png"/></div>
					<div class="next"><img src="/MarksWeb/lib/img/images/gdsfjg_03.png"/></div>
						<div class="items">
						<ul>
						   <c:forEach var="i" begin="0" end="3" step="1">
						   <li><img width="102px" height="102px" alt="" bimg="/MarksWeb/lib/img/gshaf.png" src="${requestScope.infos.piclist[i]}" onmousemove="preview(this);"></li>
						   </c:forEach>
						</ul>
					</div>
					</div>
					
				</div>
			</div>
			<!--详细介绍-->
			<div class="goods fl">
				<div class="heard">
					珍享  ${requestScope.infos.fullname} 一个装  约2kg  顺丰包邮
				</div>
				<div class="hui">
					<div class="money">
						<div class="price">价&nbsp;格:</div>
						<span class="price1">￥${requestScope.infos.nowprice}</span>
						<span class="price2"> <del>￥${requestScope.infos.price}</del> </span>
					</div>
					<div class="lingquan">
						<div class="quan">领&nbsp;券:</div>
						<span><img src="/MarksWeb/lib/img/quan.png"/></span>   <!--82*25-->
						<span class="huodong">活动截止到  6.30</span>
				     </div>
				     <!-- <div class="song">
				     	<div class="songzhi">送&nbsp;至：</div>
				     	<span class="address">青岛 &nbsp;城阳区</span><span class="sanjiao"></span>
				     	<p>由&nbsp;<span class="zhenxiang">珍享旗舰店</span>&nbsp;从海南发货&nbsp;并提供售后服务 <span class="lianxi"></span ><span class="red">联系商家</span></p>
				     </div> -->
				</div>
				<br>
				<div class="else">
					<div class="guige">
						<div class="guige2">
							规&nbsp;格：
						</div>
						<span class="guige3">2kg*1个装</span><span class="guige3">2.5kg*1个装</span><span class="guige3">3kg*1个装</span>
					</div>
					<div class="number">
						<div class="number2">
							数&nbsp;量：
						</div>
						<button class="jian glyphicon glyphicon-minus" onclick="numChange(this)"></button>
						&nbsp;
						<input class="number3" value="1"/>
						
						<button class="jia glyphicon glyphicon-plus" onclick="numChange(this)"></button>
						<p class="goumai"><button class="goumai1">立即购买</button><button class="goumai2">加入购物车</button></p>
					</div>
					<div class="fenqi">
						<div class="fenqi2">
							分&nbsp;期：
						</div>
						<span class="fenqi3">
							2期免息
						</span>
						<span class="fenqi4"></span>  <!--17-->
					</div>
					<div class="tese">
						<div class="tese2">
							特&nbsp;色：
						</div>
						<span class="tese3">顺丰包邮</span>
						<p class="tese4">生鲜类产品不支持7天无理由退换货</p>
					</div>
				</div>
				
			</div>
			<div class="clear"></div>
	</div>
	<!--商品详情开始-->
    <div class="box2">
    	<div class="box21 fl">
    		<div class="shangjia">
    			<div class="logo-shangjia"></div>
    			<div class="shangjia1">商&nbsp;家:<span class="shangjia12">珍享旗舰店</span></div>
    			<div class="shangjia2">联&nbsp;系：<span class="shangjia21"></span><span class="shangjia22">联系客服</span></div>
    			<div class="shangjia3">商&nbsp;家:<span class="shangjia32">400-888-5555</span></div>
    			<div class="line-shangjia"></div>
    			<ul class="Three">
    				<li class="one fl"><p class="p1">商品</p><p class="p2">5.52 <span class="jiantou1"></span></p></li>
    				<li class="two fl"><p class="p1">服务</p><p class="p2">5.67 <span class="jiantou2"></span></p></li>
    				<li class="three fl"><p class="p1">物流</p><p class="p2">4.83 <span class="jiantou3"></span></p></li>
    			</ul>
    			
    			<div class="clear"></div>
    			<div class="enterstore">
    				<span class="enter1">进入店铺</span><span class="enter2">收藏店铺</span>
    			</div>
    		</div>
    		<!-- <div class="search">
    			<div class="search-box">
    				<input type="text" name="" id="" value="搜索店内商品" /><span class="fangdajing"></span>
    				<p><span class="span1">热门：</span ><span class="span1">车厘子</span ><span class="span2">牛油果</span><span class="span1">西柚</span><span class="span1">橙子</span><span class="span1">榴莲</span><span class="span2">蓝莓</span></p>
    			</div>
    		</div> -->
    		<!--猜你喜欢-->
    		<div class="like">
    			<div class="title-like">
    				<span class="line"></span><span class="center">猜你喜欢</span><span class="line"></span>
    			</div>
    			<!--猜你喜欢商品-->
    			<c:forEach items="${sessionScope.list1}" var="r" varStatus="v" begin="0" end="3">
    			<div class="likeone">
    				<span class="tu"><img width="68px" height="67px" src="${r.pic}"/></span>
    				<span class="wen"><p class="p1">${r.fullname}700g*1个*1袋</p><p class="p2">口感绵密&nbsp;留香满口</p><p class="p3">￥${r.nowprice}</p></span>
    			</div>
    			</c:forEach>
    			<div class="list">
    			
    				<div class="title-list">
    					<span class="logo-list"></span><span class="wenzi">进口生鲜排行榜</span>
    				</div>
    				<div class="select">
    					<span class="one">同品牌</span><span class="two">同类别</span><span class="three">同产地</span>
    				</div>
    				
    				<c:forEach items="${sessionScope.list5}" var="r" varStatus="v" begin="0" end="3">
    			        <div class="listone">
	    					<span class="tu"><img width="68px" height="67px" src="${r.pic}"/></span>
	    					<span class="wen">
	    						<p class="p1">${r.fullname}</p><p class="p2">500g</p><p class="p3">￥${r.nowprice}</p>
	    					</span>
    				    </div>
    			    </c:forEach>
    				
    				
    			</div>
    		</div>
    	</div>
    	<!--商品详情右下部分-->
    	<div class="box22 fl">
    		<div class="title-thing">
    			<ul>
    				<li class="l1">商品详情</li>
    				<!-- <li class="l2">包装及产品参数</li>
    				<li class="l2">累计评价<span>(199)</span></li>
    				<li class="l2">咨询<span>(10)</span></li>
    				<li class="l2">售后服务</li> -->
    			</ul>
    			<div class="clear"></div>
    		</div>
    		<div class="form">
    			<div class="form1">
    				产品参数
    			</div>
    			<div class="form2">
    				<ul>
    					<li><p>品&nbsp;牌：珍享</p><p>类&nbsp;别:${requestScope.infos.typename }</p><p>包&nbsp;装：其他</p></li>
    					<li><p>国产/进口：越南进口</p><p>储存方法：冷藏/常温</p></li>
    					<li><p>规&nbsp;格：2kg*1&nbsp;2.5kg*1&nbsp;3kg*1</p></li><li><p>保质期： 30天</p></li>
    					
    				</ul>
    				
    			</div>
    			
    		</div>
    		${requestScope.infos.info}
    		
    	</div>
    </div>
    <div class="clear"></div>
    <footer>
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
