<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Best Rent</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
<style>
body, html {
  height: 100%;
  font-family: "Inconsolata", sans-serif;
}

table {
  width: 100%;
}

td {
  text-align: center;
  height: 50px;
}

.bgimg {
  background-position: center;
  background-size: cover;
  background-image: url("https://mclaren.scene7.com/is/image/mclaren/McLaren_GT_Adventures_Dubai_01:crop-16x9?wid=1980&hei=1114");
  min-height: 75%;
}

.menu {
  display: none;
}

.center {
  margin-left: auto;
  margin-right: auto;
}
</style>
</head>
<body>

<!-- Links (sit on top) -->
<div class="w3-top">
  <div class="w3-row w3-padding w3-black">
    <div class="w3-col s3">
      <a href="#" class="w3-button w3-block w3-black">HOME</a>
    </div>
    <div class="w3-col s3">
      <a href="#about" class="w3-button w3-block w3-black">ABOUT US</a>
    </div>
    <div class="w3-col s3">
      <a href="#menu" class="w3-button w3-block w3-black">AVAILABLE CARS</a>
    </div>
    <div class="w3-col s3">
      <a href="#where" class="w3-button w3-block w3-black">RENT NOW</a>
    </div>
  </div>
</div>

<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
    <span class="w3-tag">Open from 6am to 7pm</span>
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white" style="font-size:100px">Best<br>Rent</span>
  </div>
  <div class="w3-display-bottomright w3-center w3-padding-large">
    <span class="w3-text-white">Boston University</span>
  </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div class="w3-sand w3-large">

<!-- About Container -->
<div class="w3-container" id="about">
  <div class="w3-content" style="max-width:700px">
    <h5 class="w3-center w3-padding-64"><span class="w3-tag w3-wide">WHY BEST RENT?</span></h5>
    <p>Best Rent is the leading car-sharing company in Boston. We provide on-demand access to cars by the hour or the day in cities and campuses around the globe.We have various kinds of cars from economy ones to sports cars to fit your need.</p>
    <p>Customer satisfaction is our first priority. We want to make sure our customers have a happy and enjoyable trip by using our services. Our employees are more than happy to help you to fit your needs. </p>
    <div class="w3-panel w3-leftbar w3-light-grey">
      <p><i>"I love using Best Rent. The cars they have are clean and the employees are nice. It has always been my first choice when renting a car!"</i></p>
      <p>- Customer Joe</p>
    </div>
    <img src="https://www.nerdwallet.com/assets/blog/wp-content/uploads/2020/09/GettyImages-1159573826-770x462.jpg" style="width:100%;max-width:1000px" class="w3-margin-top">
    
  </div>
</div>

<!-- Menu Container -->
<div class="w3-container" id="menu">
  <div class="w3-content" style="max-width:700px">
 
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">AVAILABLE CARS</span></h5>
  
    <div class="w3-container w3-padding-48 w3-card">
	    
      <!-- Retriving available cars -->
		<form method="post">
			<table class="center">
				<tr>
					<td><b>Vehicle Number</b></td>
					<td><b>Make</b></td>
					<td><b>Model</b></td>
					<td><b>Price</b></td>

				</tr>
		<%
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/best_rent", "root", "bao1tian2");
				Statement stmt=con.createStatement();
    			ResultSet rs=stmt.executeQuery("SELECT vehicle_num, make, model, price FROM vehicle where available = 'Yes'");
    			while(rs.next()){
		%>  	
    
    			<tr>
    				<td><%=rs.getString("vehicle_num") %></td>
    				<td><%=rs.getString("make") %></td>
    				<td><%=rs.getString("model") %></td>
    				<td><%=rs.getInt("price") %></td>
    			</tr>
    	
		<%
       			}
		%>	
			</table>
		<%
        	rs.close();
        	stmt.close();
        	con.close();
   			} catch(Exception e) {
        		e.printStackTrace();
   			}
		%>
		</form>

    </div>
      
    
  </div>
</div>

<!-- Contact/Area Container -->
<div class="w3-container" id="where" style="padding-bottom:32px;">
  <div class="w3-content" style="max-width:700px">
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">RENT NOW</span></h5>
    <p>Pick up your favorite car at our service center during opening hours!</p>
    <img src="https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_13/2798361/190325-rental-cars-cs-229p.jpg" class="w3-image" style="width:100%">
    <p><span class="w3-tag">Customers Be Aware:</span> Please specify the vehicle id exactly as shown above in the available car list. If you do not return the vehicle in time, we will charge a late fee accordingly. Thank you for your understanding!</p>
    <p><strong>Reserve</strong> your favorite car now, our team will contact you shortly:</p>
    <form  action="RentServlet" method="post">
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Address" required name="Address"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Phone Number" required name="Phone"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vehicle ID" required name="Id"></p>
      <p>Pick-up Date: <input class="w3-input w3-padding-16 w3-border" type="text" placeholder="YYYY-MM-DD" required name="date"></p>
      <p>Drop-off Date: <input class="w3-input w3-padding-16 w3-border" type="text" placeholder="YYYY-MM-DD" required name="due"></p>
      <p><button class="w3-button w3-black" type="submit">Submit Request</button></p>
    </form>
  </div>
</div>

<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-48 w3-large">
  <p>Best Rent 2022</p>
  <p>Templates from <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
  <p>Created for CS 411 Final Project By: Tianyi Bao, Zijie Li, Xiang Li, Zhangde Song</p>
</footer>

<script>
// Tabbed Menu
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-dark-grey";
}
document.getElementById("myLink").click();
</script>

</body>
</html>
