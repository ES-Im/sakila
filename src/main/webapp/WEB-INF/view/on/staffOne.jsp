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
			html, body {
			    margin: 0; /* 기본 여백 제거 */
			    padding: 0; /* 기본 패딩 제거 */
			    height: 100%; /* 전체 높이를 100%로 설정 */
			}
			
		</style>
	</head>
	
		<body class="container-fluid">
		<div class="row full-height">
			<div class="col-sm-2">
				<!-- leftMenu.jsp include -->
				<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			</div>
			
			<div class="col-sm-10">
				<!-- main content -->
				<h1>Staff One</h1>
				<hr>
				<!-- Staff OutLine bar-->				
				<div id="accordion">
				
				  <div class="card">
				    <div class="card-header">
				      <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
				        STAFF INFO
				      </a>
				    </div>
				    <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
				      <div class="card-body">
					      	STAFF : ${staff.staffUserName} ( ${staff.staffFirstName} ${staff.staffLastName} )
							<br>
							ADDRESS : ${staff.staffCountry} ${staff.staffCity} ${staff.staffDistrict} ${staff.staffAddress}
							<br>
							EMAIL : ${staff.staffEmail}
							<br>
							PHONE NUM : ${staff.staffPhone}
				      </div>
				    </div>
				  </div>
				
				  <div class="card">
				    <div class="card-header">
				      <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
				      	 #${staff.storeId} STORE INFO 
				      </a>
				    </div>
				    <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
				      <div class="card-body">
					        STOREID : ${staff.storeId}
					        <br>
					        ADDRESS : ${staff.storeCountry} ${staff.storeDistrict} ${staff.storeCity} ${staff.storeAddress}
							<br>
				      </div>
				    </div>
				  </div>
				
				  <div class="card">
				    <div class="card-header">
				      <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseThree">
				        #${staff.storeId} STORE MANAGER INFO 
				      </a>
				    </div>
				    <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
				      <div class="card-body">
 							STORE MANAGER ID : ${staff.managerStaffId}
					        <br>
					        STORE MANAGER NAME : ${staff.managerName}
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<hr>
						
		</div>
			
	</body>
</html>

