<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!-- <html> -->
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
textarea {
    resize: none;
}
</style>
<link rel="shortcut icon" href="./img/Logo.png">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
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
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
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
							<b>${LoginMsg}${success}${faild}</b>
						</h3>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
			<div class="container container_border ">
				<div class="">
					<h2 align="center"
						style="margin-top: 5%; color: white; padding-top: 3%">Enquiry
						Management</h2>
					<div class="panel panel-default">
						<div class="panel-body" align="center" style="margin-top: 2%">
							<div class="row mt-3 mb-3">
								<div class="col-sm-4"></div>
								<div class="col-sm-4" align="center">
									<select class="custom-select custom-select-lg sm-3"
										onchange="getEnquiryType()"
										id="enquiryOperations"
										style="font-size: 20px; text-align: center;">
										<option value="0">Select Enquiry Operation</option>
										<option value="1">New Enquiry</option>
										<option value="2">Upload Enquires</option>
										<option value="3">View Enquires</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<script type="text/javascript">
			function handleSelect(page) {
				window.location = page.value + ".jsp";
			}
		</script>
				<br>
				<div class="">
					<h2 align="center"
						style="margin-top: 5%; color: white; padding-top: 3%">Call
						Management</h2>
					<div class="panel panel-default">
						<div class="panel-body" align="center" style="margin-top: 2%">
							<div class="row mt-3 mb-3">
								<div class="col-sm-4"></div>
								<div class="col-sm-4" align="center">
									<select class="custom-select custom-select-lg sm-3"
										onchange="javascript:handleSelect(this)" id="selectOperation"
										style="font-size: 20px; text-align: center;">
										<option value="Welcome">Select Call Operation</option>
										<option value="Login">New Calls</option>
										<option value="EnquiryLogin">Pending Calls</option>
										<option value="EnquiryLogin">Upload Calls</option>
										<option value="EnquiryLogin">View All Calls</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<form name="newenq" class="newEnquiry" method="POST" action="newEnquiry.do" style="margin-top: 8%; ">
								<table class="col-md-6 table table-bordered table-dark"
									border="1" border-color="white" align="center"
									style="color: white">
									<tr>
										<td colspan="2" align="center"><h3>New Enquiry</h3></td>
									</tr>
									
									<tr>
									<td><h5> Full Name<sup>*</sup>:</h5></td>
									<td><input type="text" class="form-control"  name="fullName" required placeholder="Enter full name" onblur="checkNameExist()"/><b><span id="isName"></span></b></td>
									</tr>
									
									<tr>
									<td><h5>MOBILE NO<sup>*</sup>:</h5></td>
									<td><input type="number" class="form-control" name="mobileNo" required placeholder="Enter valid mobile number"/></td>
									</tr>
									
									<tr>
								    <td><h5>ALTERNATE MOBILE<sup></sup>:</h5></td>
									<td><input type="number" class="form-control" name="alternateMobileNo" placeholder="Enter alternate mobile number"/></td>
									</tr>
									
									<tr>
								    <td><h5>EMAIL ID<sup>*</sup>:</h5></td>
									<td><input type="email" class="form-control" name="emailId" required placeholder="Enter valid email id" onblur="checkEmailExist()"/><b><span id="isE"></span></b></td> 
									</tr>
									
									<tr>
								    <td><h5>COURSE<sup>*</sup>:</h5></td>
									<td><input type="text" class="form-control" name="course" required placeholder="Enter course name"/></td>
									</tr>
									
									<tr>
								    <td><h5>BATCH TYPE<sup>*</sup>:</h5></td>
									<td><select name="batchType" class="custom-select custom-select-lg sm-3" >  
								        <option value="Weekend" label="Weekend"/>  
								        <option value="WeekDay" label="WeekDay"/>   
								        </select>
								    </td>
									</tr>
                                    
                                    <tr>
								    <td><h5>SOURCE<sup>*</sup>:</h5></td>
									<td><input type="text" class="form-control" required name="source" placeholder="Enter source of information"/></td>
									</tr>
									
									<tr>
								    <td><h5>REFRENCE<sup>*</sup>:</h5></td>
									<td><input type="text" class="form-control" name="refrenceName"  placeholder="Enter refrence name"/></td>
									</tr>
									
									<tr>
									<td><h5>REFRENCE MOBILE NO<sup></sup>:</h5></td>
									<td><input type="number" class="form-control" name="refrenceMobileNo" placeholder="Enter refrence mobile number"/></td>
									</tr>
									
									<tr>
								    <td><h5>BRANCH TYPE<sup>*</sup>:</h5></td>
									<td><select  name="branch" required class="custom-select custom-select-lg sm-3">  
								        <option value="Rajajinagar" label="Rajajinagar"/>  
								        <option value="BTM" label="BTM"/>   
								        </select>
								    </td>
									</tr>
                                     
                                    <tr>
								    <td><h5>COUNSELOR<sup>*</sup>:</h5></td>
									<td><input type="text" class="form-control" name="counselor" required placeholder="Enter refrence name"/></td>
									</tr>
									
									<tr>
								    <td><h5>COMMENTS<sup></sup>:</h5></td>
									<td><textarea rows="10" cols="10" style="overflow:auto;resize:none" maxlength = "300" class="form-control" name="comments"  placeholder="Enter comments" required></textarea></td>
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
   <script type="text/javascript">
   function checkEmailExist(){
       var xmlhttp = new XMLHttpRequest();
       var username = document.forms["newenq"]["emailId"].value;
       var url = "emailfinder.jsp?username=" + username;
       xmlhttp.onreadystatechange = function(){
           if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
               if(xmlhttp.responseText == "Email Id Already Exists")
                   document.getElementById("isE").style.color = "green";
               else
                   document.getElementById("isE").style.color = "red";
               document.getElementById("isE").innerHTML = xmlhttp.responseText;
           }
           
       };
       try{
       xmlhttp.open("GET",url,true);
       xmlhttp.send();
       }
      catch(e)
      {
	   console.log("unable to connect to server");
      }
   }
   
   function checkNameExist(){
       var xmlhttp = new XMLHttpRequest();
       var fullname = document.forms["newenq"]["fullName"].value;
       var url = "namefinder.jsp?username=" + fullname;
       xmlhttp.onreadystatechange = function(){
           if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
               if(xmlhttp.responseText == " ")
                   document.getElementById("isName").style.color = "green";
               else
                   document.getElementById("isName").style.color = "red";
               document.getElementById("isName").innerHTML = xmlhttp.responseText;
           }
           
       };
       try{
       xmlhttp.open("GET",url,true);
       xmlhttp.send();
       }
      catch(e)
      {
	   console.log("unable to connect to server");
      }
   }
   
   </script>
   
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>