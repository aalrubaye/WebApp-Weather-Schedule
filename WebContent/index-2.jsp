<%@page import="com.github.dvdme.ForecastIOLib.ForecastIO"%>
<%@page import="com.eclipsesource.json.*"%>
<%@page import="com.abdul.pkg.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Using Ajax</title>

<script type="text/javascript">
	
	function callServletWithAjax(methodtype){
		var xmlhttp;
		if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		}else{
			xmlhttp = new ActiveXObjext("Microsoft.XMLHTTP");
		}
		
		xmlhttp.onreadystatechange = function() {
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
			}
		};
		
		var params = "uname="+document.getElementById("pass_city").innerHTML;
		if(methodtype == 'POST'){
			xmlhttp.open(methodtype, "/WebApp0.1/MyServlet", true);
			xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xmlhttp.send(params);
		}else if(methodtype == 'GET'){
			xmlhttp.open(methodtype, "/WebApp0.1/MyServlet?"+params,true);
			xmlhttp.send();
		}
	}
	
	function send_city(name){
		document.getElementById("pass_city").innerHTML = name;
	}

</script>
</head>
<body>
<div id="pass_city" style="display: none;"></div>
<form id='Hi'>
	<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Melbourne');callServletWithAjax('POST')" style="font-size: 14px;color: #404040;">Melbourne</a>
	<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Sebastian');callServletWithAjax('POST')" style="font-size: 14px;color: #404040;">Sebastian</a>
	<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Orlando');callServletWithAjax('POST')" style="font-size: 14px;color: #404040;">Orlando</a>
	<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Tampa');callServletWithAjax('POST')" style="font-size: 14px;color: #404040;">Tampa</a>
	<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Miami');callServletWithAjax('POST')" style="font-size: 14px;color: #404040;">Miami</a>
	<div id="myDiv"></div>
</form>


</body>
</html>