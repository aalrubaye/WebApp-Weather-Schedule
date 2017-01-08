<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
 <head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
 <title>welcome to my page</title>

 <!-- Bootstrap -->
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/mycss.css" rel="stylesheet">

 <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
 <!--[if lt IE 9]>
 <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
 <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
 <![endif]-->
 
 <script type="text/javascript">

	function getdiv(cl){
		document.getElementById("myDiv").innerHTML = "You have selected the "+cl+" | ";
	}

</script>
 
 </head>
 <body>

<div class="container">
    <hr />
    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2 gold">Hello World</div>
  </div> <!-- /container -->

<div class="jumbotron">
 <h3>Hello, world!</h3>
 <p>This is some text for our Jumbotron</p>
 <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>

 <h1 class="top">Welcome to my Page</h1>

 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script src="js/bootstrap.min.js"></script>
 
 
 <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    Select Your Class
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#" onclick="getdiv('Class1')" >Class1</a></li>
    <li><a href="#" onclick="getdiv('Class2')" >Class2</a></li>
    <li><a href="#"onclick="getdiv('Class3')" >Class3</a></li>
    <li role="separator" class="divider"></li>
  </ul>
</div>
<p></p>
<div id="myDiv"></div>
 
 
 
 
 
 
 </body>
</html>