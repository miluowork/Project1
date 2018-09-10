<%@ page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
	<link href="/MarksWeb/lib/css/order.css" rel='stylesheet' type='text/css' />
	
	<script type="text/javascript">
	function add() {
		var layer=layui.layer;
		layer.open({
			type:2,
			content:'addaddr.jsp',
			area:['600px','320px']
		});
	}
	function edit(id) {
		var layer=layui.layer;
		layer.open({
			type:2,
			content:'aedit?id='+id,
			maxmin:true,
			area:['600px','320px']
		});
	}
	
	</script>
</head>
<body>

<div id="contentCon">
	
    <div class="right">
    	<ul>
        	<li style="margin-left:100px;">收货人</li>
        	<li style="margin-left:100px;">电话</li>
        	<li style="margin-left:150px;">地区</li>
        	<li style="margin-left:200px;">地址</li>
        	<li style="float: right;">
        	<input class="btn btn-primary radius" onclick="add();" type="button" style="height: 30px;" value="新增">
        	</li>
        </ul>
        <c:forEach items="${myaddress}" var="r">
        <hr>
        <div>
        <ul>
        	<li style="margin-left: 50px;width: 50px;">${r.name}</li>
            	<li style="margin-left: 30px;width: 80px;">${r.tel}</li>
                <li style="margin-left: 30px;width: 90px;">
                	<p>${r.zone}</p>
                </li>
                <li style="margin-left: 70px;width: 90px;">
                	<p>${r.addr}</p>
                </li>
                <li style="margin-left: 30px;width: 30px;">
                	<input onclick="edit(${r.id});" type="button" style="float:right; height: 30px;"class="btn btn-primary radius" value="编辑">
                </li>
               
            </ul>
        </div>
        <hr>
        </c:forEach>
        
    </div>
    
    
</div>

</body>
</html>