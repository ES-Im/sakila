<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<Style>
			body {
			  margin: 0;
			  padding: 0;
			  color: #fff;
			  font-family: 'Open Sans', Helvetica, sans-serif;
			  box-sizing: border-box;
			}
			
			.grid-container {
			  display: grid;
			  grid-template-columns: 240px 1fr;
			  grid-template-rows: 50px 1fr 50px;
			  grid-template-areas: 
			    "sidenav header" 
			    "sidenav main" 
			    "sidenav footer";
			  height: 100vh;
			}
			
			.menu-icon {
			  position: fixed;
			  top: 5px;
			  left: 10px;
			  display: flex;
			  align-items: center;
			  justify-content: center;
			  background-color: #DADAE3;
			  border-radius: 50%;
			  z-index: 1;
			  cursor: pointer;
			  padding: 12px;
			}
			
			.header {
			  grid-area: header;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  padding: 0 16px;
			  background-color: #648ca6;
			}
			
			.sidenav {
			  grid-area: sidenav;
			  display: flex;
			  flex-direction: column;
			  width: 240px;
			  overflow-y: auto;
			  background-color: #394263;
			  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.16), 0 0 0 1px rgba(0, 0, 0, 0.08);
			}
			
			.sidenav__list {
			  margin-top: 85px;
			  padding: 0;
			  list-style-type: none;
			}
			
			.sidenav__list-item {
			  padding: 20px 40px;
			  color: #ddd;
			  cursor: pointer;
			}
			
			.sidenav__list-item:hover {
			  background-color: rgba(255, 255, 255, 0.2);
			}
			
			.main {
			  grid-area: main;
			  background-color: #8fd4d9;
			  padding: 20px;
			}
			
			.card {
			  background-color: #82bef6;
			  padding: 24px;
			  margin-bottom: 20px;
			  text-align: center;
			}
			
			.footer {
			  grid-area: footer;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  padding: 0 16px;
			  background-color: #648ca6;
			}
		</Style>
		<title></title>
    </head>

    <body>
	       <div class="grid-container">
			  <header class="header">
			    <div>Register STAFF</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			    <div class="card">
				    
	 				<!-- Address search box -->
					<fieldset>	
						<form class="searchForm" id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
							<legend>
								Select Address
							</legend>
							<hr>
							<label for="storeId" class="form-label">search</label>
							<input id="searchAddress" name="searchAddress" class="form-control" type="text">
							<button id="btnAddress" type="button">Search</button>
						</form>
						
						<!-- display Address List -->
						<form>
							<label for="Result" class="form-label">Search Result:</label>
							<br>
							<select  id="resultAddress" class="form-select" size="10">
								<c:forEach var="a" items="${addressList}">
									<option value="${a.addressId}">(ID:${a.addressId}) ${a.address}</option>
								</c:forEach>
							</select>
							<br>
							<button type="button" id="btnAddrSel">Select</button>
						</form>
					</fieldset>
				</div>
				<div class="card">
					<fieldset>
					<!-- addStaff Form -->
						
						<form id="Addform" action="${pageContext.request.contextPath}/on/addStaff" method="post">
							<legend>
								add Form
							</legend>
							<hr>
							<!-- 1 :Store List -->
	
							<label for="storeId" class="form-label">storeId:</label>
							<select id="storeId" name="storeId" class="form-control">
								<option value="">|||select|||</option>
								<c:forEach var="s" items="${storeList}">
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
							</select>
	
							 <!-- 2 : AddressId-->
							<label for="AddressId" class="form-label">AddressId</label>
							<input id="addressId" name="addressId" class="form-control" type="text" readonly>
								
							<!-- 3 : username-->
							<label for="username" class="form-label">username</label>
							<input id="username" name="username" class="form-control" type="text" >
	
							<!-- 4 : email-->
							<label for="Email" class="form-label">Email</label>
							<input id="email" name="email" class="form-control" type="text" >
		
							<!-- 5 : first_name-->
							<label for="firstName" class="form-label">first_name</label>
							<input id="firstName" name="firstName" class="form-control" type="text" >
								
							<!-- 6 : last_name-->
							<label for="lastName" class="form-label">last_name</label>
							<input id="lastName" name="lastName" class="form-control" type="text" >
							
							<!-- button -->
							<button type="button" id="btnAddstaff">Select</button>
						</form>
					</fieldset>
				</div>
			  </main>

			
		  <footer class="footer">
			 <div></div>
		  </footer>
			</div>
			
    </body>
    <script>

		$('#btnAddstaff').click(function() {
			let arr = [$('#storeId'), $('#addressId'), $('#username'), $('#email'), 
					 	$('#firstName'), $('#lastName')];
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