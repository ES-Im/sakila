<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<title></title>
		<style>
		
			html,
			body {
				height : 100%;
			}
			
			body {
				display : flex;
				align-items: center;
				justify-contents : center;
			}
			
			.LoginBox {
				padding : 10px;
			}
			
		
		</style>
	</head>
	
	<body class="container" >
	  <div class="col" >
	  		 <div class="row">
			    <div class="col-md-3"></div>	<!-- left blank block -->
			    
			    
			    
			    <div class="col-md-6">
			    
			    	<h1 class="text-dark-50">Login Page</h1>
			    	<div class="loginResult" id="loginResult">${msg}</div>
			    	<br>
			    	<div class="bg-secondary LoginBox">
					<form id="form" action="${pageContext.request.contextPath}/off/login" method="post">
						<div class="mb-3 mt-3">
							<label for="email" class="form-label">staffId : </label>
							<input  class="form-control" name="staffId" id="staffId" type="text">
						</div>
						<div class="mb-3">
							<label for="pwd" class="form-label">Password : </label> 
							<input  class="form-control" id="password" name="password" type="password">
						</div>
					<button id="btn" type="button" class="btn btn-secondary">Login</button>
					</form>
			    </div>
			    
			    </div>
			    
			    <div class="col-md-3"></div>	<!-- right blank block -->
			  </div>
	  </div>
	  

	</body>
    <script>
	  	// when click btn, check the form validated
	  	$('#btn').click(function() {
	  		console.log('click');
	  		
	  		// whether staffId is number or not & password > 4
	  		if( $.isNumeric($("#staffId").val()) == false) {
	  			$('#loginResult').text("Login failed, fill in staffId by number type")
	  		} else if($('#password').val().length < 4) {
	  			$('#loginResult').text("Login failed, password's length must be 4 at least")
	  		} else {
	  			$('#form').submit();
	  		}
	  	});
	  
	  </script>
</html>


















