<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>确认订单</title>
    <script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
	<script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
	<script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script>
    <link rel="stylesheet" href="/MarksWeb/lib/css/public.css">
    <link rel="stylesheet" href="/MarksWeb/lib/css/content.css">

</head>
<script type="text/javascript">
   $(function(){
	   var amount=0;
	   $(".firstProduct").each(function(){
		   
		   amount +=parseFloat($(this).find(".nowprice").text().substring(1));
	   });
	   $(".finalAmount").text("￥" +amount);
   });


</script>
<script type="text/javascript">
			   if(${sessionScope.user.email!=null}){
				   $(".log-a1").remove();
				   $(".log-a2").remove();
				   $(".left").append("<a style='color:red;' href='${pageContext.request.contextPath}/user.jsp' class='user' >${sessionScope.user.email}</a></span>");
				   $(".left").append("<a style='color:red;margin-left:50px' href='#' class='exit' >退出登录</a></span>");
			   };
		});
		   
		</script>
<body>
<jsp:include page="tanchu.jsp"></jsp:include>
<div class="headerCon">
    <jsp:include page="header1.jsp"></jsp:include>
    <div class="logoCon">
        <div class="logoCon">
            <a class="loginLogo" href="index.html"></a>
            <p>确认订单</p>
            <div class="logoRight">
                <div class="searchBox">
                    <input type="text" value="请输入搜索内容"><button>搜索</button>
                </div>
                <a class="shoppingCart" href="shopping.jsp"><span class="shoppingCartIcon"></span>购物车<span>(3)</span>件</a>
            </div>
        </div>
    </div>
</div>
<div class="settlementContentCon">
    <div class="addressBox">
        <div class="topTitle">
            <div><h2>确认收货地址</h2></div>
        </div>
        <div class="addressInfo">
            <dl class="addressActive"><dt>鲍世英<b class="phoneNum">183****1165</b></dt><dd>山东省 青岛市 城阳区 城阳街道 春阳路 盈园国际商务中心 812</dd></dl>
            <!-- <dl><dt>鲍世英<b class="phoneNum">183****1165</b></dt><dd>山东省 东营市 东营区 文汇街道 中国石油大学胜利学院</dd></dl>
            <dl><dt>鲍世英<b class="phoneNum">183****1165</b></dt><dd>山东省 青岛市 城阳区 城阳街道 仁和居东区五号楼 一单元 601</dd></dl> -->
            <dl class="addAddress"><dt>添加新的收货地址</dt></dl>
        </div>
    </div>
    <div class="settlementInfoBox">
        <div class="topTitle">
            <div><h2>确认订单信息</h2></div>
        </div>
        <ul class="tableTitle">
            <li class="firstTitle">商品信息</li>
            <li>商品属性</li>
            <li>单价</li>
            <li>数量</li>
            <li>金额</li>
            <li>优惠方式</li>
        </ul>
        <div class="shopBox">
            <h3>店铺：我的小吃店</h3><h3>卖家：开心的鱼</h3>
            <div class="productBox">
            <c:forEach items="${sessionScope.payList.list}" var="r" varStatus="v">
                <ul class="firstProduct">
                    <li><img src="${r.pic}" width="80px" height="80px"/></li>
                    <li class="productName" style="text-align: left;display:block;width:220px!important;">${r.fullname}</li>
                    <%-- <li class="product01" id="${r.id}"></li> --%>
                    <li class="testBox">317g</li>
                    <li><span class="yuanjia">￥${r.price}</span><br>￥${r.nowprice}</li>
                    <li class="shuliang"><input type="text" value="${r.count}"></li>
                    <li class="nowprice">￥${r.count * r.nowprice}</li>
                    <li>商家促销</li>
                </ul>
                </c:forEach>
               <!--  <ul>
                    <li class="product02"></li>
                    <li class="productName">包邮日本进口零食悠哈UHA 100%青紫葡萄果汁包裹软糖味觉糖40g</li>
                    <li class="testBox">口味：青葡萄</li>
                    <li>￥19.90</li>
                    <li class="shuliang"><input type="text" value="1"></li>
                    <li>￥19.90</li>
                    <li>无</li>
                </ul> -->
            </div>
        </div>
        <ul class="tableTitle">
            <li class="firstTitle">订单其他信息</li>
        </ul>
        <ul class="otherInfo">
            <li class="message">给卖家的留言</li>
            <textarea rows="20" cols="60">选填：对本次订单的补充说明</textarea>
            <li>运送方式：普通配送（免运费）<span>￥0.00</span></li>
            <li>运费险：送运费险<span>￥0.00</span></li>
        </ul>
    </div>
    <div class="checkoutBox">
        <ul class="checkoutInfo">
            <li class="finalAmount"  style="font-size: 20px;color:red">合计：<span></span></li>
            <li>配送至：山东省 青岛市 城阳区 城阳街道 春阳路 盈园国际商务中心 812</li>
            <li>收货人信息：鲍世英（183****1165）</li>
            <li><b>付款方式：</b><input type="checkbox"><b class="quickIcon"></b><b>快捷支付</b><input type="checkbox"><b class="weixinIcon"></b><b>微信支付</b></li>
        </ul>
        <button>结算</button>
    </div>
</div>
<div class="footerCon">
    <p><a>关于我们</a> | <a>合作伙伴</a> | <a>营销中心</a> | <a>廉正举报</a> | <a>联系客服</a> | <a>开放平台</a> | <a>诚征英才</a> | <a>联系我们</a> | <a>网站地图</a> | <a>法律声明</a> | <a>知识产权</a> | © 2003-2016 chihuo.com 版权所有</p>
    <p>网络文化经营许可证：浙网文[2013]0268-000号|增值电信业务经营许可证：京B2-20081001|信息网络传播视听节目许可证：1109364号|互联网违法和不良信息举报电话:400-800-8000</p>
</div>
</body>
</html>