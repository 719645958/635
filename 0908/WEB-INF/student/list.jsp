<%@page import="util.Pagination"%>
<%@ page language="java" import="java.util.*,entity.*"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<style>
#main {
	width: 600px;
	margin: 10px auto;
}

#mes {
	float: right;
	width: 150px;
	height: 36px;
	line-height: 30px;
	letter-spacing: 3px;
	color: red;
}

.fenye {
	float: right;
	margin: 0;
	padding: 0;
	margin: 0;
}

.fenye li {
	list-style: none;
	float: left;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 140%;
	border: 1px solid #ddd;
	text-align: center;
	color: #337ab7;
	margin-left: -1px;
}

.fenye li:hover {
	background: #eee;
	cursor: pointer;
}

.fenye li:first-child {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.fenye li:last-child {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.fenye .active {
	color: #fff;
	background-color: #337ab7;
	border-color: #337ab7;
}

.fenye .active:hover {
	color: #fff;
	background-color: #337ab7;
	border-color: #337ab7;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>

<script>
	$(document).ready(function() {

		var ye = ${p.ye};
		var maxYe = ${p.maxYe};
		$("#pre").click(function() {
			if (ye > 1) {
				window.location.href = "stu?ye=" + (ye - 1);
			} else {
				$("#mes").html("已经是第一页了");
				setTimeout(function() {
					$("#mes").html("");
				}, 1000);
			}
		})
		$("#next").click(function() {
			if (ye < maxYe) {
				window.location.href = "stu?ye=" + (ye + 1);
			} else {
				$("#mes").html("已经是最后一页了");
				setTimeout(function() {
					$("#mes").html("");
				}, 1000);
			}
		})

		$("[ name=numPage]").click(function() {
			window.location.href = "stu?ye=" + $(this).html();
		})
		$("#add").click(function() {
			window.location.href = "stu?type=showAdd";

		})
	})
</script>
</head>

<body>
	<div id="main">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="stu" items="${stus}">
					<tr>
						<td>${stu.name}</td>
						<td>${stu.sex}</td>
						<td>${stu.age}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="fenye">
			<li id="pre">上一页</li>
			<c:forEach begin="${p.begin}" end="${p.end}" varStatus="status">
				<li name="numPage"
					<c:if test="${p.ye==status.index}"> class="active"</c:if>>${status.index }</li>
			</c:forEach>
			<li id="next">下一页</li>
		</ul>
		<div id="mes"></div>

		<div class="btn-group">
			<button id="add" type="button" class="btn btn-danger">新增</button>
			<button type="button" class="btn btn-primary">修改</button>
			<button type="button" class="btn btn-primary">删除</button>
		</div>


	</div>

</body>
</html>
