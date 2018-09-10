<%@ page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="/MarksWeb/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/MarksWeb/lib/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/MarksWeb/lib/css/shopping.css" />
<link rel="stylesheet" type="text/css"
	href="/MarksWeb/lib/css/footer.css" />
<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="/MarksWeb/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
<script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script>
<style type="text/css">
   .cont-shopping .thing .down1 .l6 span {
    display: inline-block;
    border: 1px solid #eeeeee;
    width: 20px;
    height: 20px;
    text-align: center;
    font-family:glyphicons halflings;
    font-size: 14px;
    color: #666666; 
    }
    li{
    margin-right: 8px;
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
	function changercount(id,count) {
		  /* var jsons={
				id:id,
				count:count,
		        } */
		 $.ajax({
		        type: "POST",
		        url: "../ShopCar/shopCarNum",
		        //contentType: "application/json; charset=utf-8",
		        data:{
		        	id:id,
					count:count,
		        },
		        dataType:"text",
		        success: function (result) {
						alert(result);
		        }
		    });
	};
	function del(id){
		
		 $.ajax({
		        type: "POST",
		        url: "../ShopCar/delete",
		        //contentType: "application/json; charset=utf-8",
		        data:{
		        	id:id
		        },
		        dataType:"text",
		        success: function () {
		        }
		    });
	}
	
	
	function finalSubmit() {
		var data=[];
		$(".down1").each(function(){
			if($(this).find(".chk").prop("checked")){
				var id=parseInt($(this).attr("myid"));
				var count=parseInt($(this).find(".n2").text());
				var price=$(this).find(".l5").text();
				var nowAmount=parseFloat(price.substring(1))*parseInt(count);
			    var amount=nowAmount*2;
				var row={id:id};
				data.push(row);
			}
			});
		
		console.log(data);
		
		 $.ajax({
		        type:"POST",
		        url: "${pageContext.request.contextPath}/ShopCar/payList",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify(data),
		        dataType: "text",
		        success: function (result) {
		        	if(result="success"){
		        		alert(result);
		        		location.href="../Address/toPay";
		        	}
		        	
		        }
		    });
	};
	function alljs() {
		var all=0;
		$(".chk").each(function(){
			if($(this).prop("checked")){
				var parent = $(this).parents(".down1");
				var amount = parent.find(".l7").text();
				amount=parseFloat(amount.substring(1));
				all +=amount;
			}
		});
		$(".s7").text("￥" +all);
	};
	
	$(function() {
		$(".del").on("click",function(){
			var id=$(this).parents(".down1").attr("myid");
			alert(id);
			del(id);
			$(event.target).parents(".down1").remove();
			alljs();
		});
		
		$(".chk").on("click",function(){
			alljs();
		});
		
		
		$(".n1").on("click", function() {
			var count = parseInt($(event.target).next().text());
			alert(count);
			if (count > 1)
				$(event.target).next().text("" + (--count));
			var parent = $(event.target).parents(".down1");
			var id = parent.attr("myid");
			alert(id);
			var price = parent.find(".l5").text();
			price = parseFloat(price.substring(1));
			parent.find(".l7").text("￥" + (count * price).toFixed(2));
			changercount(id, count);
			alljs();
		});
		$(".n3").on("click", function() {
			var count = parseInt($(event.target).prev().text());
			var parent = $(event.target).parents(".down1");
			$(event.target).prev().text("" + (++count));
			var id = parent.attr("myid");
			var price = parent.find(".l5").text();
			price = parseFloat(price.substring(1));
			parent.find(".l7").text("￥" + (count * price).toFixed(2));
			changercount(id, count);
			alljs();
		});
		
	});
</script>
</head>
<body>
<jsp:include page="tanchu.jsp"></jsp:include>
	<div class="box">
		<!--头部-->
		<div class="header">
			<jsp:include page="header1.jsp"></jsp:include>
			<div class="header2">
				<div class="header2-cont">
					<a href="../Products/picsList"><img src="/MarksWeb/lib/img/images/gengduo_03.png" /></a>
					<!--172*62-->
					<div class="sousuo">
						<div class="sousuo-up">
							<input type="text" name="" id="" value="" placeholder="泰国榴莲" />
							<em></em>
							<p>搜索</p>
						</div>
					</div>
					<div class="gouwuche">
						<em></em><a href="${pageContext.request.contextPath}/ShopCar/carList?user_id=${sessionScope.user.id}">购物车</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header3">
				<div class="header3-cont">
					<ul>
						<li class="l1">全部分类</li>
						<li class="l2" onclick="location='../Products/picsList'">首页</li>
						<li class="l2">主厨先生</li>
						<li class="l2">每日推荐</li>
						<li class="l2">会员专享</li>
						<li class="l2">品质保障</li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!--导航横线-->
		<div class="line"></div>
		<div class="cont-shopping">
			<div class="all">
				<input type="checkbox" name="" id="" value="" /><span class="s1">全选</span><span
					class="s2">商品信息</span><span class="s3">规格</span> <span class="s4">单价(元)</span><span
					class="s5">数量</span><span class="s6">小计</span><span class="s7">操作</span>
			</div>
			<!--天天新鲜-->
			<div class="store">
				<input type="checkbox" name="" id="" value="" /> <span>天天新鲜</span>
				<div class="thing">
					<div class="up">
						<p></p>
						<span>满399减100</span>
					</div>
					<c:forEach items="${requestScope.shopCarList}" var="r" varStatus="v">
					<ul class="down1" myid="${r.id}">
						<li class="l1"><input type="checkbox" class="chk" name="" id="" value="" /></li>
						<li class="l2"><img src="${r.pic}" width="89px" height="80px"/></li>
						<li class="l3">
							<p>天天新鲜&nbsp;${r.fullname}</p>
							<p>清甜可口&nbsp;营养丰富</p>
							<p>建议冷藏</p>
						</li>
						<li class="l4">260g*盒</li>
						<li class="l5">￥${r.nowprice}</li>
						<li class="l6"><span class="n1 glyphicon glyphicon-minus"></span> <span class="n2">${r.count}</span>
							<span class="n3 glyphicon glyphicon-plus"></span></li>
						<li class="l7">￥${r.nowprice*r.count}</li>
						<li class="l8">
							<!-- <p>移入收藏夹</p> -->
							<p class="del">删除</p>
						</li>

					</ul>
					</c:forEach>
					
				</div>
				<div class="all2">
					<input type="checkbox" name="" id="" value="" /><span class="s1">全选</span><span
						class="s2">删除选中商品</span><span class="s3">已选中商品</span> <span
						class="s4">3</span><span class="s5">件</span><span class="s6">总价(元)：</span><span
						class="s7">￥0</span><span class="s8" onclick="finalSubmit()">结算</span>
				</div>
			</div>

			<!--footer-->
			<footer>
				<div class="up">
					<ul class="cont">
						<li class="l1"><a href=""><span class="s1"></span><i
								class="i1">顺丰包邮</i></a></li>
						<li class="l1"><a href=""><span class="s2"></span><i
								class="i1">同城次日到达</i></a></li>
						<li class="l1"><a href=""><span class="s3"></span><i
								class="i1">7天无理由退换货</i></a></li>
						<li class="l1"><a href=""><span class="s4"></span><i
								class="i1">线下体验店</i></a></li>
						<li class="l2">
							<p class="p1">24小时全国服务热线</p>
							<p class="p2">400-888-8888</p>
							<p class="p3">
								<a href=""><span class="s5"></span><i class="i2">联系客服</i></a>
							</p>
						</li>

					</ul>
					<div class="clear"></div>
				</div>
				<div class="down">
					<div class="one">
						<ol>
							<dt>
								<a href="">购物指南</a>
							</dt>
							<dd>
								<a href="">购物流程</a>
							</dd>
							<dd>
								<a href="">支付方式</a>
							</dd>
						</ol>
						<ol>
							<dt>
								<a href="">购物指南</a>
							</dt>
							<dd>
								<a href="">购物流程</a>
							</dd>
							<dd>
								<a href="">支付方式</a>
							</dd>
						</ol>
						<ol>
							<dt>
								<a href="">购物指南</a>
							</dt>
							<dd>
								<a href="">购物流程</a>
							</dd>
							<dd>
								<a href="">支付方式</a>
							</dd>
						</ol>
						<ol>
							<dt>
								<a href="">购物指南</a>
							</dt>
							<dd>
								<a href="">购物流程</a>
							</dd>
							<dd>
								<a href="">支付方式</a>
							</dd>
						</ol>
						<ol>
							<dt>
								<a href="">购物指南</a>
							</dt>
							<dd>
								<a href="">购物流程</a>
							</dd>
							<dd>
								<a href="">支付方式</a>
							</dd>
						</ol>

						<div class="ew1">
							<p>
								<img src="/MarksWeb/lib/img/er.png" />
							</p>
							<p>鲜生购公众号</p>

						</div>
						<div class="ew2">
							<p>
								<img src="/MarksWeb/lib/img/er.png" />
							</p>
							<p>鲜生购APP</p>
						</div>
					</div>
					<div class="clear"></div>
					<div class="two"></div>
					<div class="three">
						<span>网络文化经营许可证：19333520156</span> <span>鲁公网安备：25854651152</span>
						<span>违法和不良信息举报电话：110</span> <span>消费者维权电话：12305</span>
						<p>Copyright&nbsp;©&nbsp;2010-2020&nbsp;xianshenggou.com&nbsp;版权所有</p>
					</div>
			</footer>
		</div>
</body>
</html>