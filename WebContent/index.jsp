<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MY TITLE</title>

<script type="text/javascript">

	function callServlet(methodType){
		document.getElementById("Hi").action="/WebApp0.1/MyServlet";
		document.getElementById("Hi").method = methodType;
		document.getElementById("Hi").submit();
	}

</script>


</head>
<body>

<h2>Welcome to the page</h2>

<!-- 
<form action="MyServlet">
	<input type=submit value='send' />
</form>
 -->


<form id='Hi'>
	Name: <input type="text" name="uname" width="20" />
	<button type="button" onclick="callServlet('GET')">doGet</button>
	<button type="button" onclick="callServlet('POST')">doPost</button>
</form>

</body>
</html>