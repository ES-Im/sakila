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
			*, *:before, *:after {
			  -moz-box-sizing: border-box;
			  -webkit-box-sizing: border-box;
			  box-sizing: border-box;
			}
			
			body {
			  font-family: 'Nunito', sans-serif;
			  color: #384047;
			}
			
			form {
			  max-width: 300px;
			  margin: 10px auto;
			  padding: 10px 20px;
			  background: #f4f7f8;
			  border-radius: 8px;
			}
			
			h1 {
			  margin: 0 0 30px 0;
			  text-align: center;
			}
			
			input[type="text"],
			input[type="password"],
			input[type="date"],
			input[type="datetime"],
			input[type="email"],
			input[type="number"],
			input[type="search"],
			input[type="tel"],
			input[type="time"],
			input[type="url"],
			textarea,
			select {
			  background: rgba(255,255,255,0.1);
			  border: none;
			  font-size: 16px;
			  height: auto;
			  margin: 0;
			  outline: 0;
			  padding: 15px;
			  width: 100%;
			  background-color: #e8eeef;
			  color: #8a97a0;
			  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
			  margin-bottom: 30px;
			}
			
			input[type="radio"],
			input[type="checkbox"] {
			  margin: 0 4px 8px 0;
			}
			
			select {
			  display: block;
			  max-width: 480px;
			  margin: 10px auto;
			  padding: 10px 20px;
			  background: #f4f7f8;
			  border-radius: 8px;
			  padding: 6px;
			  height: 100px;
			  border-radius: 2px;
			}
			
			button {
			  padding: 19px 39px 18px 39px;
			  color: #FFF;
			  background-color: #4bc970;
			  font-size: 18px;
			  text-align: center;
			  font-style: normal;
			  border-radius: 5px;
			  width: 100%;
			  border: 1px solid #3ac162;
			  border-width: 1px 1px 3px;
			  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
			  margin-bottom: 10px;
			}
			
			fieldset {
			  margin-bottom: 30px;
			  border: none;
			}
			
			legend {
			  font-size: 1.4em;
			  margin-bottom: 10px;
			}
			
			label {
			  display: block;
			  margin-bottom: 8px;
			}
			
			label.light {
			  font-weight: 300;
			  display: inline;
			}
			
			.number {
			  background-color: #5fcf80;
			  color: #fff;
			  height: 30px;
			  width: 30px;
			  display: inline-block;
			  font-size: 0.8em;
			  margin-right: 4px;
			  line-height: 30px;
			  text-align: center;
			  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
			  border-radius: 100%;
			}
			
			@media screen and (min-width: 480px) {
			
			  form {
			    max-width: 480px;
			  }
			
			}
						
		</style>
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
				<h1>Register STAFF</h1>
				<hr>
				<fieldset>
					<!-- Address search box -->

					
					<form class="searchForm" id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
						<legend>
							<sapn class="number">1</sapn>
							Select Address
						</legend>
						<input id="searchAddress" name="searchAddress" type="text">
						<button id="btnAddress" type="button">Search</button>
					</form>
					
					<!-- display Address List -->
					<form>
						<label for="Result">Search Result:</label>
						<select  id="resultAddress" size="10">
							<c:forEach var="a" items="${addressList}">
								<option value="${a.addressId}">(ID:${a.addressId}) ${a.address}</option>
							</c:forEach>
						</select>
						<br>
						<button type="button" id="btnAddrSel">Select</button>
					</form>
				</fieldset>
				
				<fieldset>
				<!-- addStaff Form -->
					
					<form id="Addform" action="${pageContext.request.contextPath}/on/addStaff" method="post">
						<legend>
							<sapn class="number">2</sapn>
							add Form
						</legend>
						<!-- 1 :Store List -->

						<label for="storeId">storeId:</label>
						<select id="storeId" name="storeId">
							<option value="">|||select|||</option>
							<c:forEach var="s" items="${storeList}">
								<option value="${s.storeId}">${s.storeId}</option>
							</c:forEach>
						</select>

						 <!-- 2 : AddressId-->
						<label for="AddressId">AddressId</label>
						<input id="addressId" name="addressId" type="text" readonly>
							
						<!-- 3 : username-->
						<label for="username">username</label>
						<input id="username" name="username" type="text" >

						<!-- 4 : email-->
						<label for="Email">Email</label>
						<input id="email" name="email" type="text" >
	
						<!-- 5 : first_name-->
						<label for="first_name">first_name</label>
						<input id="first_name" name="first_name" type="text" >
							
						<!-- 6 : last_name-->
						<label for="last_name">last_name</label>
						<input id="last_name" name="last_name" type="text" >
						
						<!-- button -->
						<button type="button" id="btnAddstaff">Select</button>
					</form>
				</fieldset>
			</div>
			
		</div>
	</body>
	<script>

		$('#btnAddstaff').click(function() {
			let arr = [$('#storeId'), $('#addressId'), $('#username'), $('#email'), 
					 	$('#first_name'), $('#last_name')];
			console.log(arr[3].val());
			// (1) check empty and null
			for(let i = 0; i < arr.length-1; i++) {
				console.log(arr[i].val());
				if(arr[i].val() == null || arr[i].val() == '') {
					alert('fill in the form');
					return;
				}
			}
			// (2) email reg check
			let email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
			if(!email_regex.test(arr[3].val())) {
				alert('invalidated Email');
				return;
			}
			
			$('#Addform').submit();
		});
		
		
	
		$('#btnAddrSel').click(function() {
			if($('#resultAddress').val() == '' || $('#resultAddress').val() == null) {
				alert('select address first');
			} else {
				$('#addressId').val($('#resultAddress').val());
			}
		});
	
		$('#btnAddress').click(function() {
			if($('#searchAddress').val() == "") {
				alert('fill in the address search form');
			} else {
				$('#formAddress').submit();
			}
		});
	</script>
</html>