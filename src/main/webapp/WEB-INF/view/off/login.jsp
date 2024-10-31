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
			.setborder {
				padding : 10px;
			}
			.setWidth {
				width : 50%;
			}
			.setCenter {
				text-align : center;
			}
			
			.setInputBox { 
				margin-left : 110px;
			}
			
			.flex-container {
				  display: flex;
				  flex-direction: row;
			}
			
		
		</style>
	</head>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<body class="container" >
	  <div class="col" >
	  		 <div class="row">
			    <div class="col-md-4"></div>
			    
			    <div class="col-md-4 bg-secondary setborder">
			    	<h1 class="text-dark-50 setCenter">Login Page</h1>
					<form action="${pageContext.request.contextPath}/off/login" method="post">
						<div class="mb-3 mt-3 setInputBox">
							<label for="email" class="form-label">staffId : </label>
							<input type="text" class="form-control setWidth" id="staffId" name="staffId">
						</div>
						<div class="mb-3 setInputBox">
							<label for="pwd" class="form-label">Password : </label> 
							<input type="password" class="form-control setWidth" id="password" name="password">
						</div>
					<button type="button" class="setInputBox">Login</button>
					</form>
					
			    </div>
			    
			    <div class="col-md-4"></div>
			  </div>
	  </div>
	
	 
	</body>
</html>