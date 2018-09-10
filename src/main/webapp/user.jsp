<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>  
<meta charset="utf-8">
<title>个人中心</title>
<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script>
		<script type="text/javascript" src="/MarksWeb/lib/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/bootstrap-3.3.7-dist/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/buttons.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/user.css">
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/header.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/homepage.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/enter.css"/>
		<style type="text/css">
	    .content02>.user04>input{
		float:left;
		      margin-left:490px !important;
		}
		
		</style>
		<script type="text/javascript">
		$(document).ready(function(){
			
			   if(${sessionScope.user.email!=null}){
				   $(".log-a1").remove();
				   $(".log-a2").remove();
				   $(".left").append("<a style='color:red;' href='#' class='user' >${sessionScope.user.email}</a></span>");
				   $(".left").append("<a style='color:red;margin-left:50px' href='#' class='exit' >退出登录</a></span>");
			   };
		});

		</script>
		<script type="text/javascript">
		$(document).ready(function(){
			$(".ptBtn").css("display","none");
			
			$(".user04").each(function(i){
				if($(".pText").eq(i).val()=="已发货")
				{
					$(".ptBtn").eq(i).css("display","block");
					$(".ptBtn").eq(i).prop("class","button button-3d button-action button-pill").val("确认收货");
				}
				else if($(".pText").eq(i).val()=="已收货")
				{
					$(".ptBtn").eq(i).css("display","block");
					$(".ptBtn").eq(i).prop("class","button button-3d button-action button-pill").val("确认退货");
				}else{
					return "";
				}
			})
			
			
		});
		
		function changeBtn(id){
			var data={id:id};
			 $.ajax({
			        type: "POST",
			        url: "../Orders/productStatus",
			        contentType: "application/json; charset=utf-8",
			        data:JSON.stringify(data),
			        dataType:"text",
			        success: function (result) {
			       $(".user04").each(function(i){
			        	if(result==3){
			        		$(".pText").eq(i).val("已收货");
			        		$(".ptBtn").eq(i).prop("class","button button-3d button-action button-pill").val("确认退货");
			        	}
			        	if(result==4){
			        		$(".pText").eq(i).val("已退货");
			        		$(".ptBtn").eq(i).css("display","none");
			        	}
			        });
			        }
			    });
		      };
		</script>
</head>
<body>
<jsp:include page="tanchu.jsp"></jsp:include>
<!---head--------->
	<div class="header">
    	<div class="box">
        	<jsp:include page="header1.jsp"></jsp:include>
        </div>
		<div class="logoCon">
            <img onclick="location='../Products/picsList'" src="/MarksWeb/lib/img/images/gengduo_03.png" alt="这是一张图片"> 
            <ul class="nav">
            	<a href="${pageContext.request.contextPath}/Products/picsList"><span>首页</span></a>
                <a href="#">账户设置</a>
            </ul>
        </div>
    </div>	
<!---content------>
	<div class="con01">
    	<div class="content01">
        	<ul class="words">
            	<a href="javascript:;"><li><span>全部功能</span></li></a>
                
            </ul>
        </div>
        <div class="content02">
        	<div class="user01">
            	<img class="userCon01" src="/MarksWeb/lib/img/images/Lo.jpg" alt="这是一张图片">
                <div class="userCon02">
                	<a href="user.html"><p>${sessionScope.user.email}</p></a>
                    <a href="#"><img src="/MarksWeb/lib/img/images/logoxing.jpg" alt="这是一张图片"></a>
                </div>
            </div>
            <ul class="user02">
                <a href="#">待付款</a>
                <a href="#">待发货</a>
                <a href="#">待收货<span>（1）</span></a>
                <a href="#">待评价<span>（6）</span></a>
                <a href="#">退款</a>
            </ul>
            <c:forEach items="${requestScope.uOrderList}" var="r" varStatus="v">
            <div class="user03" >
            	<img src="/MarksWeb/lib/img/images/logowuliu.jpg" alt="这是一张图片">
                <a href="#"><p>我的物流</p></a>
                <a href="#"><p>订单号:${r.code}</p></a>
                <a href="#"><p>${requestScope.status[r.status]}</p></a>
            </div>
            <div class="user04">
            	 <a><img src="/MarksWeb/lib/img/images/Avocado.jpg" alt="这是一张图片"></a>
                 <div class="userCon04" >
                	<a href="#"><h1>查看物流明细</h1></a>
                    <a href="#"><p>${r.date}</p></a>
                </div>
                <input class="pText" type="text" value="${requestScope.status[r.status]}">
                <input  style="padding:0px!important ;text-align:center;margin-left:100px !important;" class="ptBtn" onclick="changeBtn(${r.id})" name="" type="button" value="收货">
            </div>
            </c:forEach>
           
        </div>
    </div>
<!---foot--------->
	<div class="footer01">
    	<div class="footerBox">
        	<img src="/MarksWeb/lib/img/images/gengduo_03.png" alt="这是一张图片">
        	<div class="footerCon01">
            	<ul class="foot01">
            		<li><a href="#"><span>公司</span></a></li>
               		<li><a href="#">关于我们</a></li>
                	<li><a href="#">招聘信息</a></li>
                    <li><a href="#">联系我们</a></li>
            	</ul>
            </div>
            <div class="footerCon02">
            	<ul class="foot02">
            		<li><a href="#"><span>消费者</span></a></li>
                	<li><a href="#">消费者服务</a></li>
                	<li><a href="#">意见反馈</a></li>
                	<li><a href="#">手机版下载</a></li>
            	</ul>
            </div>
            <div class="footerCon03">
                <ul class="foot03">
            		<li><a href="#"><span>支付方式</span></a></li>
                	<li><a href="#">快捷支付</a></li>
                    <li><a href="#">银联支付</a></li>
                	<li><a href="#">微信支付</a></li>
            	</ul>
            </div>
            <div class="footerCon04">
                <ul class="foot04">
            		<li><a href="#"><span>商家服务</span></a></li>
                	<li><a href="#">商家入驻</a></li>
                    <li><a href="#">商家中心</a></li>
                	<li><a href="#">运营服务</a></li>
            	</ul>
            </div>
            <div class="footerCon05">
                <ul class="foot05">
            		<li><a href="#"><span>手机商城</span></a></li>
            	</ul>
                <div class="erWeiMa"></div>
            </div>
    	</div>
    </div>
    <div class="footer02">
    	<p>营业执照注册号：330106000129004   增值电信业务经营许可证：鲁B2-20110349  网络文化经营许可证：鲁网文（2016）0349-219号  
安全责任书 鲁公网安备 33010602002329号——林杨工作室</p>
	</div>
</body>
</html>