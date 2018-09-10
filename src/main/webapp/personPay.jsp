<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>汨罗商场</title>
<link href="/MarksWeb/lib/css/public1.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/base1.css"/>
<script type="text/javascript" src="/MarksWeb/lib/js/jquery_cart.js"></script>
<script type="text/javascript" src="/MarksWeb/lib/js/navLogin.js"></script>
<script type="text/javascript" src="/MarksWeb/lib/layer/layer.js"></script>
<script type="text/javascript" src="/MarksWeb/lib/js/tanchu.js"></script>
<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/header.css"/>  
<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/checkOut.css" />
<script type="text/javascript">
  function orderMake(){
	  /*location.href="${pageContext.request.contextPath}/Orders/finalAccount"*/
	  var id=$("input[type=radio]:checked").val();
	  alert(id);
	  var data={id:id};
		  $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/Orders/finalAccount",
		        contentType: "application/json;charset=utf-8",
		        data:JSON.stringify(data),
		        dataType:"text",
		        success: function (result) {
						 alert(result); 
		        	location.href="${pageContext.request.contextPath}/Orders/uOrderList";
		        }
		    });
  };
 
  function addaddr(){
	  /* layui.use('layer', function(){ */
	  layer.open({
	        type: 2
	        ,title: false //不显示标题栏
	        ,closeBtn: true
	        ,area:['600px','350px'] 
	        ,shade: 0.8
	        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	        /* ,btn: ['火速围观', '残忍拒绝']*/
	        ,btnAlign: 'c' 
	        ,moveType: 1 //拖拽模式，0或者1
	        ,content: '../addaddr.jsp'
	        ,success: function(layero){
	        }
	      });
	  /* }); */
  }
</script>
<script type="text/javascript">
$(document).ready(function(){
	 if(${sessionScope.user.email!=null}){
		   $(".log-a1").remove();
		   $(".log-a2").remove();
		   $(".left").append("<a style='color:red;' href='${pageContext.request.contextPath}/Orders/uOrderList' class='user' >${sessionScope.user.email}</a></span>");
		   $(".left").append("<a style='color:red;margin-left:50px' href='#' class='exit' >退出登录</a></span>");
	   };
	 var nowPrice=0;
	 $(".price").each(function(i){
		 var price = parseFloat($(".price").eq(i).text().split("元"));
		 nowPrice +=price;
	 }) 
	 $(".checkout-price ul li").eq(0).find("span").text(nowPrice);
	 $(".checkout-price p span strong").text(nowPrice);
  });

			  
		   
		</script>
</head>

<body>
<jsp:include page="tanchu.jsp"></jsp:include>
 <!--顶部快捷菜单-->
    <div class="shortcut_v2013 alink_v2013">
        <div class="w">
        <jsp:include page="header1.jsp"></jsp:include>
        
            <span class="clr"></span>
        </div>
    </div>
    <!--顶部快捷菜单-->
    <div class="header2">
					<div class="header2-cont">
						<a href="index.html"><img src="/MarksWeb/lib/img/images/gengduo_03.png"/></a>   <!--172*62-->
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
    <!--顶部Logo及搜索-->
    
     <!--  导航条    start-->
 	<div class="yHeader">
		<div class="shop_Nav">
			<div class="pullDown">
				<h2 class="pullDownTitle"><i></i>全部商品分类</h2>
			</div>

			<ul class="Menu_box">
				<li><a href="" target="_blank" class="yMenua">首页</a></li>
				<li><a href="" target="_blank">大划算</a></li>
				<li><a href="" target="_blank">抢拍</a></li>
				<li><a href="" target="_blank">锡货专场</a></li>
				<li><a href="" target="_blank">锡货超市</a></li>
			</ul>
            <div class="fr r_icon"><i class="i01"></i><span>30天退货</span><i class="i02"></i><span>满59包邮</span></div>
		</div>
 	</div>
	<!--  导航条    end-->
    
   <div class="banner_red_top"> 

  </div>  
    
    
 <!--收货地址body部分开始-->  
 <div class="border_top_cart">
 
<div class="container">
    <div class="checkout-box">
        <!-- <form  id="checkoutForm" action="#" method="post"> -->
            <div class="checkout-box-bd">
                    <!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
                <input type="hidden" name="Checkout[addressState]" id="addrState"   value="0">
                <!-- 收货地址 -->
                <div class="xm-box">
                <div class="box-hd ">
    <h2 class="title">收货地址</h2>
</div>
<div class="box-bd">
    <div class="clearfix xm-address-list" id="checkoutAddrList">
       <c:forEach items="${requestScope.addrList}" var="r" varStatus="v">
         <dl class="item" >
            <dd>
                <input type="radio" name="Checkouts" class="myaddressId"  value="${r.id}">
            </dd>
            <dt>
                <strong class="itemConsignee">${r.name}</strong>
                <span class="itemTag tag">个人工作室</span>
            </dt>
            <dd>
                <p class="tel itemTel">${r.tel}</p>
                <p class="itemRegion">${r.zone}</p>
                <p class="itemStreet">${r.addr}</p>
                <!-- <span class="edit-btn J_editAddr">编辑</span> -->
            </dd>
         </dl>
           </c:forEach>
             <div class="item use-new-addr"  id="J_useNewAddr" data-state="off">
             <span onclick="addaddr()"   class="iconfont icon-add"><img src="/MarksWeb/lib/img/images/add_cart.png" /></span> 
            使用新地址
        </div>
            </div>
    <!--点击弹出新增/收货地址界面end-->
    <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"></div>
    </div>                </div>
                
            <div class="checkout-box-ft">
                 <!-- 商品清单 -->
                <div id="checkoutGoodsList" class="checkout-goods-box">
                   <div class="xm-box">
                    <div class="box-hd">
                        <h2 class="title">确认订单信息</h2>
                    </div>
                    <div class="box-bd">
                        <dl class="checkout-goods-list">
                            <dt class="clearfix">
                                <span class="col col-1">商品名称</span>
                                <span class="col col-2">购买价格</span>
                                <span class="col col-3">购买数量</span>
                                <span class="col col-4">小计（元）</span>
                            </dt>
                            <c:forEach items="${sessionScope.payList.list}" var="r" varStatus="v">
                    <dd class="item clearfix">
                      <div class="item-row">
                         <div class="col col-1" style="width:100% !important;">
                            <div class="g-pic">
                               <img src="${r.pic}" width="100" height="100" />
                            </div>
                            
                            <div class="g-info" style="margin-right:200px !important;">
                              <a href="${pageContext.request.contextPath}/Products/infos?id=${r.id}"  style="display:block;width:450px !important;">${r.fullname}</a>
                            </div>
                            <div class="col col-2" >${r.nowprice}元</div>
                            <div class="col col-3">${r.count}</div>
                            <div class="col col-4 price">${r.nowprice*r.count}元</div>
                            </div>
                    </dd>
                    </c:forEach>
                      </dl>
                        <div class="checkout-count clearfix">
                            <div class="checkout-price">
                                 <ul>

                                    <li>
                                                                                                             订单总额：<span></span>
                                    </li>
                                    <li>
                                                                                                  活动优惠：<span>-0元</span>
                                    </li>
                                </ul> 
                                <p class="checkout-total">应付总额：<span><strong id=""></strong>元</span></p>
                            </div>
                            <!--  -->
                        </div>
                    </div>
                </div>
                <div class="modal hide modal-choose-pro" id="J_choosePro-664">
                <div class="modal-header">
                    <span class="close" data-dismiss='modal'><i class="iconfont">&#xe617;</i></span>
                    <h3>选择产品</h3>
                    <div class="more">
                        <div class="xm-recommend-page clearfix">
                            <a class="page-btn-prev   J_carouselPrev iconfont" href="javascript: void(0);">&#xe604;</a><a class="page-btn-next  J_carouselNext iconfont" href="javascript: void(0);">&#xe605;</a>
                        </div>
                    </div>
                </div>
                <div class="modal-body J_chooseProCarousel">
                    <div class="J_carouselWrap modal-choose-pro-list-wrap">
                        <ul class="clearfix J_carouselList"></ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-disabled J_chooseProBtn">加入购物车</a>
                </div>
            </div>
                </div>
                <!-- 商品清单 END -->
                <input type="hidden"  id="couponType" name="Checkout[couponsType]">
                <input type="hidden" id="couponValue" name="Checkout[couponsValue]">
                <div class="checkout-confirm">
                    
                    <a href="../ShopCar/carList?user_id=${sessionScope.user.id}" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
                     <input onclick="orderMake()"   type="button" class="btn btn-primary"  value="立即下单" id="checkoutToPay" />
                </div>
            </div>
        </div>

    <!-- </form> -->

</div>
<!-- 禮品卡提示 S-->
    <div class="modal hide lipin-modal" id="lipinTip">
        <div class="modal-header">
            <h2 class="title">温馨提示</h2>
            <p> 为保障您的利益与安全，下单后礼品卡将会被使用，<br>
 且订单信息将不可修改。请确认收货信息：</p>
        </div>
        <div class="modal-body">
            <ul>
                <li><strong>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</strong><span id="lipin-uname"></span></li>
                <li><strong>联系电话：</strong><span id="lipin-uphone"></span></li>
                <li><strong>收货地址：</strong><span id="lipin-uaddr"></span></li>
            </ul>
        </div>
        <div class="modal-footer">
            <span class="btn btn-primary" id="useGiftCard">确认下单</span><span class="btn btn-dakeLight" id="closeGiftCard">返回修改</span>
        </div>
    </div>
<!--  禮品卡提示 E-->
<!-- 预售提示 S-->
    <div class="modal hide yushou-modal" id="yushouTip">
        <div class="modal-body">
            <h2>请确认收货地址及发货时间</h2>
            <ul class="list">
                <li>
                    <strong>请确认配送地址，提交后不可变更：</strong>
                    <p id="yushouAddr"> </p>
                    <span class="icon-common icon-1"></span>
                </li>
                <li>
                    <strong>支付后发货</strong>
                    <p>如您随预售商品一起购买的商品，将与预售商品一起发货</p>
                    <span class="icon-common icon-2"></span>
                </li>
                <li>
                    <strong>以支付价格为准</strong>
                    <p>如预售产品发生调价，已支付订单价格将不受影响。</p>
                    <span class="icon-common icon-3"></span>
                </li>
            </ul>
        </div>
        <div class="modal-footer">
                <p id="yushouOk" class="yushou-ok">
                    <span class="icon-checkbox"><i class="iconfont">&#xe626;</i></span>
                    我已确认收货地址正确，不再变更</p>
                <span class="btn btn-lineDakeLight" data-dismiss="modal">返回修改地址</span>    
                <span class="btn btn-primary" id="yushouCheckout">继续下单</span>
                
            </div>
    </div>

<!-- 保险弹窗 -->
<!-- 保险弹窗 -->


        

    <script src="/MarksWeb/lib/js/base1.min.js"></script>

        <script type="text/javascript" src="/MarksWeb/lib/js/address_all.js"></script>
<!-- <script type="text/javascript" src="/MarksWeb/lib/js/checkout.min.js"></script>  -->
</div>
 
 <!--收货地址body部分结束-->
    
    
    
    <!-- 底部 -->
    <div class="promise_box">
    	<div class="w">
    		<ul>
        		<li><img src="/MarksWeb/lib/img/images/promise_img01.jpg"><span>365天不打烊</span></li>
        		<li><img src="/MarksWeb/lib/img/images/promise_img02.jpg"><span>无理由退换货</span></li>
        		<li><img src="/MarksWeb/lib/img/images/promise_img03.jpg"><span>担保交易</span></li>
        		<li><img src="/MarksWeb/lib/img/images/promise_img04.jpg"><span>先行赔付</span></li>
        		<li><img src="/MarksWeb/lib/img/images/promise_img05.jpg"><span>支持定制</span></li>
        	</ul>
    	</div>
    </div>
    <div class="bottom-links">
        <ul class="clearfix cols">
            <li class="col">
                <div class="bottom-links-title">关于我们</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">招聘英才</a></li>
                    <li><a href="#">公司简介</a></li>
                    <li><a href="#">合作洽谈</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">客服中心</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">收货地址</a></li>
                    <li><a href="#">个人资料</a></li>
                    <li><a href="#">修改密码</a></li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">售后服务</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">退换货政策</a></li>
                    <li><a href="#">退款说明</a></li>
                    <li><a href="#">联系卖家</a></li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">帮助中心</div>
                <ul class="clearfix bottom-links-items">
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">积分兑换</a></li>
                    <li><a href="#">积分细则</a></li>
                    <li><a href="#">已购商品</a></li>
                </ul>
            </li>
            <li class="col">
            	<div class="bottom-links-title">锡好网公众号</div>
                <ul class="clearfix bottom-links-items">
                    <li>
                        <img src="/MarksWeb/lib/img/images/weixin_big.jpg" />
                    </li>
                </ul>
            </li>
            <li class="col">
                <div class="bottom-links-title">关注我们</div>
                <ul class="clearfix bottom-links-items">
                    <li><img src="/MarksWeb/lib/img/images/icon_sina.png" /><a href="#">新浪微博</a></li>
                    <li><img src="/MarksWeb/lib/img/images/icon_tencent.png" /><a href="#">腾讯微博</a></li>
                    <li><img src="/MarksWeb/lib/img/images/icon_dou.png" /><a href="#">豆瓣小站</a></li>
                    <li><img src="/MarksWeb/lib/img/images/icon_weixin.png" /><a href="#">官方微信</a></li>
                </ul>
            </li>
            
        </ul>
    </div>
    <div class="footer_v2013 bottom-about">
        <div class="w">
            <p class="foot_p1">
                <a href="../Products/picsList">首页</a>|<a href="#">招聘英才</a>|<a href="#">广告合作</a>|<a href="#">联系我们</a>|<a href="#">关于我们</a>
            </p>
                <pre>
    经营许可证：苏B2-20130223备案许可证：苏ICP备13041162号-1360网站安全检测平台
    ©2013-2014 无锡太湖云电商网络科技发展有限公司   版权所有  更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
                </pre>
        </div>
        <p>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img01.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img02.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img03.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img04.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img05.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img06.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img07.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img08.png"></a>
            <a href="#"><img src="/MarksWeb/lib/img/images/bottom_img09.png"></a>
        </p>
    </div>
    <!-- 底部 -->
    <!-- <div class="fixed-buttons">
        <ul>
            <li><a href="#" class="fixed-weixin"><img src="images/fixed_weixin.png" /><div class="weixin-pic"><img src="images/weixin_big.jpg"></div></a></li>
            <li><img id="imgBtn-to-top" src="images/back_top.png" /></li>
        </ul>
    </div> -->
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/MarksWeb/lib/js/unslider.min.js" type="text/javascript"></script>
    <script src="/MarksWeb/lib/js/index.js" type="text/javascript"></script>

</body>
</html>
