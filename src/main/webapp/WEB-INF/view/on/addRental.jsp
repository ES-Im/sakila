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
			  min-height: 80pv;
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
			    <div>ADD Rental</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			  <div class="row">
				   <div class="card col-xl-3" style="max-width: 20%; margin: 0px 5px">
					    
		 				<!-- Address search box -->
						<fieldset>	
							<form class="searchForm" id="searchForm" action="${pageContext.request.contextPath}/on/addRental" method="get">
								<legend>
									Select Customer
								</legend>
								<hr>
								

								<label class="form-group-label mb-2">고객 검색 : </label>
								<br>
								<div class="d-flex">
									<input id="inventoryId" name="inventoryId" class="form-control me-2" type="hidden" value="${param.inventoryId}">
									<input id="searchWord" name="searchWord" class="form-control me-2" type="text" placeholder="Search Customer">
									<button id="btnSearch" class="btn btn-success" type="button">Search</button>
								</div>
							</form>
							
							<c:if test="${customerList != null}">
								<!-- display searchFilm List -->
								<form>
									<label for="Result" class="form-label mt-5 mb-2">Search Result:</label>
									<br>
									<select id="resultCustomer" class="form-select" size="10">
										<c:forEach var="c" items="${customerList}">
											<option value="${c.customerId}">(ID:${c.customerId}) ${c.firstName} ${c.lastName} </option>
										</c:forEach>
									</select>
									<br>
									<div class="d-flex flex-row-reverse">
										<button id="btnSelectCustomer" class="btn btn-success mt-4" type="button">Select</button>
									</div>
								</form>
							</c:if>

						</fieldset>
				   </div>
			   
				
			   <div class="card col-xl-7" style="max-width: 55%">
					<fieldset>
					<!-- addStaff Form -->
						
						<form id="Addform" action="${pageContext.request.contextPath}/on/addRental" method="post">
							<legend>
								ADD Rental
							</legend>
							
							<hr>
							<!-- 1 :inventoryId : readOnly -->
							<div class="col-xl-6">
								<label for="storeId" class="form-label">inventoryId:</label>
								<input id="inventoryId" name="inventoryId" class="form-control" type="text" value="${param.inventoryId}" readonly>
							</div>
	
							<!-- 2 : customerId : readOnly -->
							<div class="col-xl-6">
								<label for="customerId" class="form-label">customerId</label>
								<input id="customerId" name="customerId" class="form-control" type="text" placeholder="고객을 선택하세요" readonly>
							</div>
							
							<!-- 3 :staffId : readOnly -->
							<div class="col-xl-6">
								<label for="staffId" class="form-label">staffId:</label>
								<input id="staffId" name="staffId" class="form-control" type="text" value="${sessionScope.loginStaff.staffId}" readonly>
							</div>
							
							<!-- 4 :rentalDate : readOnly -->
							<div class="col-xl-6">
								<label for="rentalDate" class="form-label">inventoryId:</label>
								<input id="rentalDate" name="rentalDate" class="form-control" type="date" value="${curDate}">
							</div>
								
							<!-- button -->
							<div class="d-flex flex-row-reverse">
								<button id="btnAddRental" class="btn btn-success mt-5" type="button">ADD</button>
							</div>
						</form>
					</fieldset>
				</div>
			  </main>
			  </div>

			
		  <footer class="footer">
			 <div></div>
		  </footer>
			</div>
			
    </body>
    <script>

		$('#btnSearch').click(function() {
			console.log("click");
			if($('#searchFilm').val() == "") {
				alert('fill in the film search form');
			} else {
				$('#searchForm').submit();
			}
		});
		
		$('#btnSelectCustomer').click(function() {
			if($('#resultCustomer').val() == '' || $('#resultCustomer').val() == null) {
				alert('select Customer first');
			} else {
				$('#customerId').val($('#resultCustomer').val());
			}
		});
		
		$('#btnAddRental').click(function() {
			if($('#rentalDate').val() == "" || $('#filmId').val() == "") {
				alert('fill in all required form');
			}
			$('#Addform').submit();
		});
		
		
	
	
		
	</script>
</html>