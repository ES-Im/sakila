<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<style>		
			body {
			    font-family: "Lato", sans-serif;
			}
			
			.sidenav {
			    height: 100%;
   			    width: 40%;
			    background-color: #000;
			    padding-top: 20px;
		        position: fixed;
		        top: 0;
		        left: 0;
			}
			
			.main {
			    padding: 0px 10px;
			    margin-left: 40%; 
		        margin-top: 30%;
			}
			
			.login-main-text{
			    margin-top: 20%;
			    padding: 60px;
			    color: #fff;
			}
			
			.login-main-text h2{
			    font-weight: 300;
			}
			
			.btn-black{
			    background-color: #000;
			    color: #fff;
			}
		 </style>
	</head>
	
	<body class="container">
		 <div class="sidenav">
         <div class="login-main-text">
            <h2>Sakila<br> Login Page</h2>
            <p>Login or register from here to access.</p>
            <div class="loginResult" id="loginResult">${msg}</div>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="form" action="${pageContext.request.contextPath}/off/login" method="post">
                  <div class="form-group">
                   	<label >staffId : </label>
					<input class="form-control" name="staffId" id="staffId" type="text">
                  </div>
                  <div class="form-group">
                    <label >Password : </label> 
					<input  class="form-control" id="password" name="password" type="password">
                  </div>
                  <button id="btn" type="button" class="btn btn-black">Login</button>
                  <button id="registerBtn" type="button" class="btn btn-secondary">Register</button>
               </form>
            </div>
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
















