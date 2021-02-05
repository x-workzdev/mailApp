<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<!-- 	<meta name="keywords" content="Institute Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" /> -->
<style type="text/css">
.backgroundImage {
	background-image:
		url("https://raw.githubusercontent.com/xworkzodc/mailApp/master/prism.png");
	/* Center and scale the image nicely */
	background-repeat: repeat;
	height: 100%;
	min-height: 750px;
}

.error {
	color: red;
	font-weight: bold;
}
</style>
<link rel="shortcut icon" href="./img/Logo.png">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackname.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackname.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

	<div class="backgroundImage">
		<div class="header">
			<a href="" class="logo"><img src="./img/Logo.png" height="90px"></a>
			<div class="header-right">
				<h1>Om's Development Center</h1>
			</div>
			<div style="align-items: flex-end; width: 6%;">
				<button onclick="location.href='EnquiryLogin.jsp'" type="button"
					class="btn btn-danger btn-block">Log Out</button>
			</div>
		</div>
		<div class="container">
			<div class="container" align="center">
				<div>
					<nav class="navbar navbar navbar-dark bg-dark">
					<h3
						style="color: white; font-weight: 900; width: 100%; align-items: center;">
						<b>X-WorkZ Enquiry And Call Management</b>
					</h3>
					</nav>
				</div>
				<div class="row"
					style="color: white; text-align: center; margin-top: 2%">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<h3 style="color: red;">
							<b>${LoginMsg}</b>
						</h3>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
			<div class="container container_border ">
				<div class="">
					<h2 align="center"
						style="margin-top: 5%; color: white; padding-top: 3%">New
						Enquiry</h2>
				</div>
                     <form class="newEnquiry" method="POST" action="newEnquiry.do" style="margin-top: 8%;">
								<table class="col-md-6 table table-bordered table-dark"
									border="1" border-color="white" align="center"
									style="color: white">
									<tr>
										<td colspan="2" align="center"><h3>New Enquiry</h3></td>
									</tr>
									
									<tr>
									<td><h5> Full Name<sup>*</sup>:</h5></td>
									<td><input type="text" type="text" name="fullName" size="30"/></td>
									</tr>
									
									<tr>
									<td><h5>MOBILE NO<sup>*</sup>:</h5></td>
									<td><input type="text" name="mobileNo"/></td>
									</tr>
									
									<tr>
								    <td><h5>ALTERNATE MOBILE<sup></sup>:</h5></td>
									<td><input type="text" name="alternateMobileNo"/></td>
									</tr>
									
									<tr>
								    <td><h5>EMAIL ID<sup>*</sup>:</h5></td>
									<td><input type="text" name="emailId"/></td>
									</tr>
									
									<tr>
								    <td><h5>COURSE Name<sup>*</sup>:</h5></td>
									<td><input type="text" name="course"/></td>
									</tr>
									
									<tr>
								    <td><h5>BATCH TYPE<sup>*</sup>:</h5></td>
									<td><select name="batchType">  
								        <option value="Weekend" label="Weekend"/>  
								        <option value="WeekDay" label="WeekDay"/>   
								        </select>
								    </td>
									</tr>
                                    
                                    <tr>
								    <td><h5>SOURCE<sup>*</sup>:</h5></td>
									<td><input type="text" name="source"/></td>
									</tr>
									
									<tr>
									<td><h5>SOURCE MOBILE NO<sup></sup>:</h5></td>
									<td><input type="text" name="sourceMobileNo"/></td>
									</tr>
									
									<tr>
								    <td><h5>BRANCH TYPE<sup>*</sup>:</h5></td>
									<td><select name="branch">  
								        <option value="Rajajinagar" label="Rajajinagar"/>  
								        <option value="BTM" label="BTM"/>   
								        </select>
								    </td>
									</tr>
                                     
                                    <tr>
								    <td><h5>REFRENCE<sup>*</sup>:</h5></td>
									<td><input type="text" name="refrenceName"/></td>
									</tr>
                                                              
									<tr>
										<td colspan="2" align="center"><input type="submit"
											class="col-sm-5 btn btn-light" value="Submit"></td>
									</tr>

							</table>
					</form>
			</div>
		</div>
		<div>
			<nav class="navbar navbar-expand-md navbar-dark bg-dark"> </nav>
		</div>
	</div>	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
		<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>