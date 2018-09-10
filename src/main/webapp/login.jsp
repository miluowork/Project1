<%@page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/enter.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/login.css"/>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript"charset="utf-8"></script>
		<script src="/MarksWeb/lib/layer/layer.js" type="text/javascript"></script>
		<script src="/MarksWeb/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript">
		   var a=0;
		    $(document).on('click','.loginBtn', function(){
		    	alert("132");
		         var num=0;
			     var str="";
			     $("input[type$='text'],input[type$='password']").each(function(n){
			          if($(this).val()=="")
			          {
			               
						   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
			                title: '提示框',				
							icon:0,								
			          }); 
					    num++;
			            return false;            
			          } 
					 });
			          
			         
					  if(num>0){return false;}	 	
			          else{
	        	        var jsons={
	      				email:$('.uEmail').val(),
	      				password:$('.uPassword').val(),
	      			         }; 
	        	  $.ajax({
	                  type:'POST',  //提交方法是POST
	                  url:'User/uLogin', //请求的路径
	                  data:JSON.stringify(jsons), //表单序列化         //以JSON字符串形式把 user 传到后台
	                  contentType: "application/json; charset=utf-8",
	                  dataType:"json", //后台返回的数据类型是html文本
	                  timeout:3000,  //请求超时时间，毫秒
	                  error:function(){  //请求失败的回调方法
	                	  layer.msg('请求失败',{icon:1,time:1000});
	                  },
	                  success:function(us){//请求成功的回调方法
	                	  console.log(us);
	                	  var result=us.result;
	                      alert(result);
	                	  layer.msg(result+"",{icon:1,time:1000});
	                      if(result!="" && result == "success"){
	                    	  layer.msg('登陆成功!'+"",{icon:1,time:3000});
	                    	 /*var session=${sessionScope.user.email};
	                    	  session.email=us.email;
	                    	  alert(session.email); */ 
	                          location.href='index.jsp';
	                      } else if(result=="UserError"){
	                    	  layer.msg('用户不存在',{icon:1,time:1000});
	                      }else{
	                    	  layer.msg('密码输入错误',{icon:1,time:1000});
	                      }
	                  }
	              });
			  }		 	     						
		});
		</script>
	</head>
	<body>
		<div class="box">
			<div class="head">
				<div class="logo-zc">
				<a href="index.html"><img src="/MarksWeb/lib/img/images/logojgj_03.png"/></a>
			    </div>
			    <span class="welcome">
				        欢迎登录
			    </span>
			    
			</div>
			
			<!--  -->
			<!-- <div class="tanchu"> -->
		<div class="login" style="width:100%;">
		    <img class="col-md-8 hidden-xs" alt="" src="/MarksWeb/lib/img/banner.png"/>
			<div class="denglu col-md-4 col-xs-md-4">
				<div class="denglu-cont">
				<form action="" class="loginForm" >
					<p class="p1"><span class="s1">账号登录</span><span class="s2">扫码登录</span></p>
					<div class="name">
						<input  name="email" type="text" class="uEmail"  value=""  placeholder="用户名/email"/>
					</div>
					<div class="name">
						<input name="password" type="password" class="uPassword"  value="" placeholder="请输入密码"/>
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
				
				
			</div>
			</div>
	<!-- 	</div> -->
		
		
			<!-- <div class="cont-zc">
			<form action="" id="login_btn" method="post">
				<ul>
					<li>
						<label>用户名</label>
						<input class="one uEmail" type="text" name="email" value=""placeholder="请设置用户名"/>
						<span>设置后不能更改<br>中英文均可，最长14个英文或7个汉字</span>
					</li>
					<li>
						<label>输入密码</label>
						<input class="four uPassword"type="password"  name="password" value=""placeholder="请设置登录密码"/>
						<span>长度为6~14个字符<br />支持数字，大小写字母和标点符号<br />不允许有空格</span>
					</li>
					<li class="yz">
						<label>验证码</label>
						<input class=" three uCode"type="text" name="code" value=""placeholder="请输入验证码"/>
						<p><img  src="img"  onclick="this.src='img?a='+(a++) "/></p>
					</li>
					<li>
						<a><input class="six uBtn"type="button" value="登录"/></a>
					</li>
			</ul>
			</form>
				
			</div> -->
			<footer>
				<div class="up" style="">
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
