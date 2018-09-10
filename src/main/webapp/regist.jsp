<%@page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="/MarksWeb/lib/css/footer.css"/>
		<script src="/MarksWeb/lib/js/jquery.min.js" type="text/javascript"charset="utf-8"></script>
		<script src="/MarksWeb/lib/layer/layer.js" type="text/javascript"></script>
		<style type="text/css">
		body,p{
	       margin: 0;
		}
		b{
			font-weight: normal;
		}
		ul,ol,dl,dt,dd,li{
			list-style: none;
			margin: 0;
			padding: 0;
		}
		a{
			text-decoration: none;
			color:#706e6e ;
		}
		em{
			font-style: normal;
		}
		input,textarea,button{
			border: none;
			background: transparent;
		}
		input:focus,textarea:focus{
			outline: none;
		}
			.box{
				width: 100%;
				background: #F4F4F4;
				overflow: hidden;
			}
			.head{
				width: 1200px;
				margin: 45px auto 25px;
				overflow: hidden;
				
			}
			.head .logo-zc{
				float: left;
			}
			.welcome{
				display: inline-block;
				line-height: 52px;
				float: left;
				margin-left: 60px;
				font-family: "微软雅黑";
				font-size: 18;
				color: #494747;
			}
			.cont-zc{
				width: 1200px;
				height: 500px;
				background: #FFFFFF;
				border-top: 3px solid  #D63A3B;
				margin: 0 auto;
			}
			.cont-zc ul{
				margin-top:50px;
			}
			.cont-zc ul li label{
				font-size: 14px;
				color: #666666;
				text-align: right;
				width: 70px;
				display: inline-block;
			}
			
			.cont-zc ul li{
				margin-bottom: 18px;
				margin-left: 390px;
			}
			.cont-zc ul .yz{
				position: relative;
			}
			.cont-zc ul .yz p{
				background: url(img/yz.png);
				position: absolute;
				right: 405px;
				top:10px;
				width: 87px;
				height: 28px;
			}
			
			.cont-zc input{
				margin-left: 10px;
			}
			.cont-zc .one,.cont-zc .two,.cont-zc .three,.cont-zc .four{
				width: 338px;
				height: 44px;
				border: 1px solid #dddddd;
				padding-left: 10px;
			}
			.cont-zc ul li .five{
				margin-left: 65px;
				vertical-align: middle;
			}
			.cont-zc ul li .six{
				cursor: pointer;
				width: 350px;
				height: 50px;
				background: #D63A3B;
				font-size: 16px;
				color: #fffffc;
				margin-left:65px ;
			}
			
			.cont-zc span{font-size: 12px;
			 color: #666666;
			 vertical-align: middle;
			 display: inline-block;
			 display: none;
			
			}
			.cont-zc input:focus+span{
				display: inline-block;
			}
			.yuedu{
				font-size: 12px;
				color: #666666;
				display: inline-block;
			}
			.xieyi{
				color: #1b66c7;
			}
		</style>
		<script type="text/javascript">
		   var a=0;
		    $(document).on('click','.uBtn', function(){
		    	alert(success);
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
	      				tel:$('.uTel').val(),
	      				password:$('.uPassword').val(),
	      				password1:$('.uPassword1').val(),
	      				code:$('.uCode').val(),
	      			         };
	        	  $.ajax({
	                  type:'POST',  //提交方法是POST
	                  url:'User/uInsert', //请求的路径
	                  data:JSON.stringify(jsons), //表单序列化         //以JSON字符串形式把 user 传到后台
	                  contentType: "application/json; charset=utf-8",
	                  dataType:"text", //后台返回的数据类型是html文本
	                  timeout:3000,  //请求超时时间，毫秒
	                  error:function(){  //请求失败的回调方法
	                	  layer.msg('请求失败',{icon:1,time:1000});
	                  },
	                  success:function(result){//请求成功的回调方法
	                	  alert(result);
	                	  layer.msg(result+"",{icon:1,time:1000});
	                      if(result!="" && result == "success"){
	                    	  layer.msg('注册成功!'+"",{icon:1,time:1000});
	                    	  window.location.href='/Products/picsList';
	                          /* window.location.href='Products/picsList';  */
	                      } else if(result=="UserExit"){
	                    	  layer.msg('用户已存在',{icon:1,time:1000});
	                      }else if(result=="PwdError"){
	                    	  layer.msg('密码输入不一致',{icon:1,time:1000});
	                      }else{
	                    	  layer.msg('验证码不正确',{icon:1,time:1000});
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
				<a href="#"><img src="/MarksWeb/lib/img/images/logojgj_03.png"/></a>
			    </div>
			    <span class="welcome">
				        欢迎注册
			    </span>
			    
			</div>
			<div class="cont-zc">
			<form action="" id="login_btn" method="post">
				<ul>
					<li>
						<label>用户名</label>
						<input class="one uEmail" type="text" name="email" value=""placeholder="请设置用户名"/>
						<span>设置后不能更改<br>中英文均可，最长14个英文或7个汉字</span>
						
							
					</li>
					<li>
						<label>手机号</label>
						<input class="two uTel" type="text" name="tel" value=""placeholder="可用于登陆和找回密码"/>
						<span>请输入中国大陆手机号，其他手机号不可见</span>
					</li>
					<li class="yz">
						<label>验证码</label>
						<input class=" three uCode"type="text" name="code" value=""placeholder="请输入验证码"/>
						<p><img  src="img"  onclick="this.src='img?a='+(a++) "/></p>
					</li>
					<li>
						<label>输入密码</label>
						<input class="four uPassword"type="password"  name="password" value=""placeholder="请设置登录密码"/>
						<span>长度为6~14个字符<br />支持数字，大小写字母和标点符号<br />不允许有空格</span>
					</li>
					<li>
						<label>重复密码</label>
						<input class="four uPassword1"type="password" name="password1" value=""placeholder="请设置登录密码"/>
						<span>长度为6~14个字符<br />支持数字，大小写字母和标点符号<br />不允许有空格</span>
					</li>
					<li>
						<input class="five uCheck"type="checkbox" name="" id="" value="" />
						<p class="yuedu">阅读并接受<em class="xieyi">《鲜生购用户注册协议》</em></p>
					</li>
					<li>
						<a><input class="six uBtn"type="button" value="注册"/></a>
					</li>
			</ul>
			</form>
				
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
