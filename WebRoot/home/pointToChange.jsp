<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<title>积分转换</title>
<link rel="stylesheet" href="<%=basePath%>home/dist/wx_css/ydui.css">
<link rel="stylesheet"
	href="<%=basePath%>home/dist/wx_css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>home/dist/wx_css/style.css">

</head>

<body>
	<div class="smallMoney2" style="padding-top:53px;">
		<jsp:include page="back.jsp" />
		<div class="smallMoney2_content">
			<div class="smallMoney_content_left">
				<div class="smallMoney_content_canUse">
					我的零钱&nbsp;&nbsp;<span><fmt:formatNumber type="number" maxFractionDigits="2" value="${cac.cacChange}" /></span>元
				</div>
			</div>
			<div class="smallMoney_content_right"></div>
		</div>
		<div class="smallMoney2_exchange">
			<form id="signupForm"
				action="<%=basePath%>CtaTrading!pointToChange.action">
				<div class="smallMoney2_exchange_canUse">
					可转零钱的消费积分：<span id="point">${cac.cacPoints}</span>
				</div>
				<input type="text"  class="cell-input" id="input"
					name="point" placeholder="" autocomplete="off" /> <span>${jf.configValue}</span>
				<button type="submit" class="btn-block btn-primary">提交</button>
			</form>
		</div>
	</div>
</body>
<script src="<%=basePath%>home/dist/wx_js/ydui.flexible.js"></script>
<script src="<%=basePath%>home/dist/wx_js/jquery.2.1.1min.js"></script>
<script src="<%=basePath%>home/dist/wx_js/ydui.js"></script>
<script>
	$("#signupForm").submit(function(e) {
		var point = $("#point").text();
		var input = $("#input").val();
		console.log(point);
		console.log(input);
		if (input == "") {
			e.preventDefault();
			window.YDUI.dialog.alert('请输入数字');
		} else {
			if (parseFloat(input) < 0.1) {
				e.preventDefault();
				window.YDUI.dialog.alert('最少输入的数字为：0.1');
			} else {
				if (parseFloat(point) < parseFloat(input)) {
					e.preventDefault();
					window.YDUI.dialog.alert('可用最大的积分为：${cac.cacPoints}');
				}
			}

		}

	});
</script>
</html>
