<%@page import="com.github.dvdme.ForecastIOLib.ForecastIO"%>
<%@page import="com.eclipsesource.json.*"%>
<%@page import="com.abdul.pkg.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>welcome to the WebApplication</title>
	
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://rawgithub.com/darkskyapp/skycons/master/skycons.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript"> 
	
	//show the selected item in the dropdown-menu
	$("document").ready(function() {
			$(".dropdown-menu li a").click(function(){
				  $(".event").hide();
				  $(".map").hide();
				  $("#hidemap_btn").hide()
				  var selText = $(this).text();
				  $(this).parents('.dropdown').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
				  $("#dropdown_title").html(selText)
				  $("#"+selText).show();
				  $("#mapview_btn").show()
				});
		});

		//show element e
		function show(e){ 
			document.getElementById(e).style.display = "";
		}
		//hide element e
		function hide(e){
			document.getElementById(e).style.display = "none";
		}
		//show the map correlated with the selected event 
		function showmap(){
			var x = document.getElementById("dropdown_title").innerHTML;
			document.getElementById(x+'_map').style.display = "";
		}
		//hide the map  
		function hidemap(){
			var x = document.getElementById("dropdown_title").innerHTML;
			document.getElementById(x+'_map').style.display = "none";
		}
		//show all temps in Fahrenheit
		function toFahrenheit(){
			
			var x = document.getElementById("weather_results").innerHTML;
			var result = x.split(",");
			var skycons = new Skycons({"color": "orange"});  
			skycons.add("main_icon", result[1]);
			skycons.add("day1_icon", result[6]);
			skycons.add("day2_icon", result[13]);
			skycons.add("day3_icon", result[20]);
			skycons.play();
			document.getElementById("current_temp").innerHTML = result[3]+"&deg";
			document.getElementById("condition").innerHTML = result[0];
			document.getElementById("day1_name").innerHTML = result[4];
			document.getElementById("day2_name").innerHTML = result[11];
			document.getElementById("day3_name").innerHTML = result[18];
			document.getElementById("day1_min_temp").innerHTML =  "<span class='glyphicon glyphicon-triangle-bottom'></span> " + result[8]+"&deg";
			document.getElementById("day2_min_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-bottom'></span> " + result[15]+"&deg";
			document.getElementById("day3_min_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-bottom'></span> " + result[22]+"&deg";
			document.getElementById("day1_max_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-top'></span> " + result[10]+"&deg";
			document.getElementById("day2_max_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-top'></span> " + result[17]+"&deg";
			document.getElementById("day3_max_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-top'></span> " + result[24]+"&deg";	
		}
		
		//show all temps in Celsius
		function toCelsius(){
			var x = document.getElementById("weather_results").innerHTML;
			var result = x.split(",");
			document.getElementById("current_temp").innerHTML = result[2]+"&deg";
			document.getElementById("day1_min_temp").innerHTML =  "<span class='glyphicon glyphicon-triangle-bottom'></span> " + result[7]+"&deg";
			document.getElementById("day2_min_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-bottom'></span> " + result[14]+"&deg";
			document.getElementById("day3_min_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-bottom'></span> " + result[21]+"&deg";
			document.getElementById("day1_max_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-top'></span> " + result[9]+"&deg";
			document.getElementById("day2_max_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-top'></span> " + result[16]+"&deg";
			document.getElementById("day3_max_temp").innerHTML = "<span class='glyphicon glyphicon-triangle-top'></span> " + result[23]+"&deg";
		}
		
		//Call Servlet using Ajax in two methods get and post
		function callServletWithAjax(methodtype){
			var xmlhttp;
			if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
			}
			else{
				xmlhttp = new ActiveXObjext("Microsoft.XMLHTTP");
			}
			
			xmlhttp.onreadystatechange = function() {
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					document.getElementById("weather_results").innerHTML = xmlhttp.responseText;
					toFahrenheit();
				}
			};
			
			var params = "uname="+document.getElementById("pass_city").innerHTML;
			if(methodtype == 'POST'){
				xmlhttp.open(methodtype, "/WebApp0.1/MyServlet", true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xmlhttp.send(params);
			}
			else 
				if(methodtype == 'GET'){
				xmlhttp.open(methodtype, "/WebApp0.1/MyServlet?"+params,true);
				xmlhttp.send();
			}
			
		}
		
		//fetch the name of the city that already have been selected 
		function send_city(name){
			document.getElementById("city_selected").innerHTML = name;
			document.getElementById("pass_city").innerHTML = name;
			show("show_weather");
		}
		
	</script> 
 
	<style>
		.jumbotron{
		    background-color:gray;
		    color:white;
		    margin-bottom:0;
		}
		
		.bs-example{
		   	margin: 20px;
		}
		.current_temp_css {
		    font-family: Tahoma, Geneva, sans-serif;
		    font-size: 100px;
		}
		.degree {
		    font-family: Impact, Charcoal, sans-serif;
		    font-size: 70px; 
		}
		.condition_css {    
		    font-size: 30px;
		    font-weight: Bold;
		}
		.day_name{
			font-size: 18px;
		    font-weight: Bold;
		}
	</style>
</head>


<body>

	<div class="container">
		<!-- the header shown on top of the page -->
		<div align="center" class="jumbotron">
			<h3>Welcome to the page</h3>
			<p></p>
			<p></p>
			<button type="submit" class = "btn btn-warning btn-lg" onclick="show('schedule');hide('weather');" ><span class="glyphicon glyphicon-list-alt"></span> Event Schedule</button>
			<button type="submit" class = "btn btn-warning btn-lg" onclick="hide('schedule');show('weather');"><span class="glyphicon glyphicon-cloud"></span> Weather</button>
		</div><!-- jumbotron -->
		
		<!-- the Event schedule container part -->
		<div id="schedule" style="display:none;">
			<div class="well well-sm" style="background-color: #e6cab3;margin-bottom:0;">	
				<div id="dropdown_title" style="display:none;"></div>
				<div id="dropmenu" class="dropdown">
				  <span>Class / Event </span>
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Select to see details <span class="caret"></span></button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <li><a href="javascript:void(0)" >BioComplex_Class_CS5666</a></li>
					    <li><a href="javascript:void(0)" >Soccer_Match</a></li>
					    <li><a href="javascript:void(0)">Comprihensive_Exam</a></li>
					    <li><a href="javascript:void(0)">CS_Seminar</a></li>
					    <li><a href="javascript:void(0)">Pizza_Party</a></li>
				  </ul>
				</div>
			</div>
			
			<!-- the options containers -->
			<div id = "BioComplex_Class_CS5666" class="event" style="display:none;">
				<div class="well well-sm">
					<div class="row">
						<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
					   		<p></p>
						    	<img src="pic1.png" width="200" height="200">
						    	<h3>BioComplex Class - CS5666</h3>
						    	<span style="font-weight: bold">Place:</span> Harris Center Building - Room 209</p>
						    	<span style="font-weight: bold">Time:</span> Mondays 6:30 pm - 9:30 pm</p>
						    	<span style="font-weight: bold">Details:</span> This class is going to be an advanced class and only available for the graduate students. Many biocomplex networks such as the protein interaction networks and the metabolic networks exhibit an emerging pattern that the distribution of the number of connections of a protein or substrate follows a power law. As the network theory is developed recently, several quantities describing network structure such as modularity and degree-degree correlation have been introduced. Here we investigate and compare the structural properties of the yeast protein networks for different datasets with those quantities. More-over, we introduce a new quantity, called the load, characterizing the amount of signal passing through a vertex. It is shown that the load distribution also follows a power law, and its characteristics are related to the structure of the core part of the biocomplex networks.</p>
						    	<p></p>
								<div class = "map" align="center" id = "BioComplex_Class_CS5666_map" style="display:none;">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1760.3955447557203!2d-80.62508867961877!3d28.061402719687297!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x3302245b19294efa!2sHarris+Center+for+Science+and+Engineering!5e0!3m2!1sen!2sus!4v1455037661535" width="300" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
								</div>
					    	<p></p>
				  		</div>
					</div>
				</div>
			</div><!-- option1 -->
		
			<div id = "Soccer_Match" class="event" style="display:none;">
				<div class="well well-sm">
					<div class="row">
						<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
					   		<p></p>
						    	<img src="soccer.png" width="200" height="200">
						    	<h3>Soccer Match</h3>
						    	<span style="font-weight: bold">Place:</span> Palm bay high school's football field</p>
						    	<span style="font-weight: bold">Time:</span> Tuesday 7:00 pm - 9:00 pm</p>
						    	<span style="font-weight: bold">Details:</span> A friendly match between Florida Tech Panthers and Palm Bay School soccer teams. It's a free event. Come and support your team.</p>
						    	<p></p>
								<div class = "map" align="center" id = "Soccer_Match_map" style="display:none;">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1924.2891344498594!2d-80.61985159891516!3d28.047852638842308!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x7a0f3bb9c0416f05!2sPalm+Bay+High+School!5e0!3m2!1sen!2sus!4v1455113950124" width="300" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
								</div>
					    	<p></p>
				  		</div>
					</div>
				</div>
			</div><!-- option2 -->
					
			<div id = "Comprihensive_Exam" class="event" style="display:none;">
				<div class="well well-sm">
					<div class="row">
						<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
					   		<p></p>
						    	<img src="exam.png" width="200" height="200">
						    	<h3>Comprihensive Exam - Compiler</h3>
						    	<p><span style="font-weight: bold">Place:</span> Crawford Building - room 404</p>
						    	<span style="font-weight: bold">Time:</span> Thursday 8:30 am - 11:00 am</p>
						    	<span style="font-weight: bold">Details:</span> Please be in the class 404 half an hour before the exam starts in order to manage your places. Using cell-phones and laptopbs not alloweded. Do not put your name on the exam, please answer all the questions directly on the exam itself. You may need scratch paper. Answer all the questions. Explain answers as fully as possible, give examples or define terms, if appropriate.</p>
						    	<p></p>
								<div class = "map" align="center" id = "Comprihensive_Exam_map" style="display:none;">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d220.04336641677676!2d-80.62409928726636!3d28.064370632234436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88de1204f496f29b%3A0xf8c5e7ede267634a!2sCrawford+Building!5e0!3m2!1sen!2sus!4v1455114215467" width="300" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
								</div>
					    	<p></p>
				  		</div>
					</div>
				</div>
			</div><!-- option3 -->
			
			<div id = "CS_Seminar" class="event" style="display:none;">
				<div class="well well-sm">
					<div class="row">
						<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
					   		<p></p>
						    	<img src="seminar.png" width="200" height="200">
						    	<h3>Computer Science Seminar</h3>
						    	<p><span style="font-weight: bold">Place:</span> Olin Engineering Building - room 109</p>
						    	<span style="font-weight: bold">Time:</span> Friday 9:30 am - 10:15 am</p>
						    	<span style="font-weight: bold">Details:</span> This week we have two of our very best alumni giving a talk in our CS seminar. I hope you can make it. See flyer attached! There is also an interview preparation workshop later. Show up and talk to Kesann Walrond-McClean and Kim Day.</p>
						    	<p></p>
								<div class = "map" align="center" id = "CS_Seminar_map" style="display:none;">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d440.0948379641525!2d-80.62422535105495!3d28.06239134924859!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0xad8c4ea34b3403be!2sCollege+of+Science!5e0!3m2!1sen!2sus!4v1455115343441" width="300" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
								</div>
					    	<p></p>
				  		</div>
					</div>
				</div>
			</div><!-- option4 -->
			
			<div id = "Pizza_Party" class="event" style="display:none;">
				<div class="well well-sm">
					<div class="row">
						<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
					   		<p></p>
						    	<img src="pizza.png" width="200" height="200">
						    	<h3>Pizza Party</h3>
						    	<span style="font-weight: bold">Place:</span> ELS - Language Center</p>
						    	<span style="font-weight: bold">Time:</span> Friday 11:30 am - 1:00 pm</p>
						    	<span style="font-weight: bold">Details:</span> Like every friday we have a party for the graduate students. This time it's Pizza Party :). For those who did not join us las time, please dont be late. It will be very crowded, so try to come earlier. Also, don't forget to bring your student ID with you. We will surve pepperoni and cheese pizza, pepsi, and water. So please join us and let's have fun.</p>
						    	<p></p>
								<div class = "map" align="center" id = "Pizza_Party_map" style="display:none;">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d880.15028696655!2d-80.62412312757615!3d28.067200543236357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x0b3b5fcfa0a419e2!2sELS+Language+Centers+-+Melbourne!5e0!3m2!1sen!2sus!4v1455060552655" width="300" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
								</div>
					    	<p></p>
				  		</div>
					</div>
				</div>
			</div><!-- option5 -->
		
			<p id = "mapview_btn" align="center" style="display:none;" ><a href="javascript:void(0)" class="btn btn-primary" role="button"  onclick="showmap();hide('mapview_btn');show('hidemap_btn');"><span class="glyphicon glyphicon-map-marker"></span> view on map</a></span>
			<p id = "hidemap_btn" align="center" style="display:none;"><a href="javascript:void(0)" class="btn btn-primary" style="background-color: #cccccc; color:black; role="button" onclick="hidemap();show('mapview_btn');hide('hidemap_btn')">hide the map</a></span>	
				
		</div> <!-- div schedule -->
		
		



		<!-- the Event schedule container part -->
		<div id="weather" style="display:none;">
			
			<form id='cities' align= "center" class="well well-sm" style="background-color: #e6cab3;margin-bottom:0;">
				<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Melbourne');callServletWithAjax('POST');" style="font-size: 14px;color: #404040;">Melbourne</a>
				<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Orlando');callServletWithAjax('POST');" style="font-size: 14px;color: #404040;">Orlando</a>
				<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Tampa');callServletWithAjax('POST');" style="font-size: 14px;color: #404040;">Tampa</a>
				<a id = "uname" href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="send_city('Miami');callServletWithAjax('POST');" style="font-size: 14px;color: #404040;">Miami</a>
			</form>					
			
			<div id="pass_city" style="display: none;"></div>
			
			<div id="show_weather" class="well well-sm" style="display:none;" >
				<span id="celsius"><a href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="toCelsius();" style="font-size: 18px;">C&deg;</a></span>
				<span>|</span>
				<span id="fahrenheit"><a href="javascript:void(0)" class = "btn btn-link btn-lg" role="button" onclick="toFahrenheit();" style="font-size: 18px;">F&deg;</a></span>
					
				<div id="weather_results" style="display:none;" ></div>
				<p></p>
				<div id="city_selected" class="condition_css" align="center"></div>
				<p></p>
				<div align="center">
					<canvas id="main_icon" width="128" height="128"></canvas>
				</div>
				
				<div id="current_temp" class="current_temp_css" align="center"></div>
	    		<div id="condition" class="condition_css" align="center"></div>
				
				<hr>
				<p></p>
				<p></p>
					
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-3">
						<div align="center" id="day1_name" class="day_name"></div>
						<div align="center">
							<canvas id="day1_icon" width="40" height="40"></canvas>
						</div>
						<div align="center" id="day1_max_temp" class="day_name"></div>
						<div align="center" id="day1_min_temp" class="day_name"></div>
					</div>
	  			
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<div align="center" id="day2_name" class="day_name"></div>
						<div align="center">
							<canvas id="day2_icon" width="40" height="40"></canvas>
						</div>
						<div align="center" id="day2_max_temp" class="day_name"></div>
						<div align="center" id="day2_min_temp" class="day_name"></div>
					</div>
	  			
				  	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				    	<div align="center" id="day3_name" class="day_name"></div>
				    	<div align="center">
							<canvas id="day3_icon" width="40" height="40"></canvas>
						</div>
						<div align="center" id="day3_max_temp" class="day_name"></div>
						<div align="center" id="day3_min_temp" class="day_name"></div>
				  	</div>
				</div><!-- row -->
		
	    		<p></p>
			</div><!-- show weather -->
		
		   	
		</div> <!-- weather -->
	
	</div><!-- container -->


</body>
</html>