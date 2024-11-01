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
	</head>
	
		<body class="container">
		<div class="row">
			<div class="col-sm-2">
				<!-- leftMenu.jsp include -->
				<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			</div>
			
			<div class="col-sm-10">
				<!-- main content -->
				<h1>Staff One</h1>
				
				<!-- Staff OutLine bar-->				
				<div id="accordion">
				
				  <div class="card">
				    <div class="card-header">
				      <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
				        USER INFO
				      </a>
				    </div>
				    <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
				      <div class="card-body">
					      	 USER : ${staff.username} ( ${staff.firstName} ${staff.lastName} )
							<br>
							EMAIL : ${staff.email}
							<br>
							Address : ${staff.addressId }
				      </div>
				    </div>
				  </div>
				
				  <div class="card">
				    <div class="card-header">
				      <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
				      	 STORE INFO
				      </a>
				    </div>
				    <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
				      <div class="card-body">
				        STORE : ${staff.storeId}
				      </div>
				    </div>
				  </div>
				
				  <div class="card">
				    <div class="card-header">
				      <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseThree">
				        EXT
				      </a>
				    </div>
				    <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
				      <div class="card-body">
				        UPDATE DATE : ${staff.lastUpdate}
				      </div>
				    </div>
				  </div>
				</div>
			</div>
						
		</div>
			
	</body>
</html>

