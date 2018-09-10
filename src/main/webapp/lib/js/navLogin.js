
		    $(document).on('click','.exit',function(){
		    	layer.confirm('是否确定退出系统？', {
		    	      btn: ['是','否'] ,//按钮
		    	      yes: function(index, layero) {
		    	          window.location.href='../User/exit';
		    	      },
		    		  icon:2,
		    	     }, function(){
		    	    	/*  location.href="Operator/exit"; */
		    	    });
		    });
		   
		   var a=0;
		    $(document).on('click','.loginBtn', function(){
		         var num=0;
			     var str="";
			     $(".loginForm input[type$='text'],.loginForm input[type$='password']").each(function(n){
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
	                  url:'../User/uLogin', //请求的路径
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
	                	  //layer.msg(result+"",{icon:1,time:1000});
	                      if(result!="" && result == "success"){
	                    	  layer.msg('登陆成功!'+"",{icon:1,time:3000});
	                          location.reload();
	                      } else if(result=="UserError"){
	                    	  layer.msg('用户不存在',{icon:1,time:1000});
	                      }else{
	                    	  layer.msg('密码输入错误',{icon:1,time:1000});
	                      }
	                  }
	              });
			  }		 	     						
		});