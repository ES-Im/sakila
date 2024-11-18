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
			    <div>Register STAFF</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			  <div class="row">
				   <div class="card col-xl-3" style="max-width: 20%; margin: 0px 5px">
					    
		 				<!-- Address search box -->
						<fieldset>	
							<form class="searchForm" id="searchForm" action="${pageContext.request.contextPath}/on/addInventory" method="get">
								<legend>
									Select Film
								</legend>
								<hr>
								

								<label class="form-group-label mb-2">영화 검색 : </label>
								<br>
								<div class="d-flex">
									<input name="storeId" type="hidden" value="${storeId}">
									<input id="searchFilm" name="searchFilm" class="form-control me-2" type="text" placeholder="Search Film">
									<button id="btnFilm" class="btn btn-success" type="button">Search</button>
								</div>
							</form>
							
							<c:if test="${searchFilm != ''}">
								<!-- display searchFilm List -->
								<form>
									<label for="Result" class="form-label mt-5 mb-2">Search Result:</label>
									<br>
									<select id="resultFilm" class="form-select" size="10">
										<c:forEach var="f" items="${filmList}">
											<option value="${f.filmId}">(ID:${f.filmId}) ${f.title}</option>
										</c:forEach>
									</select>
									<br>
									<div class="d-flex flex-row-reverse">
										<button id="btnSelectFilm" class="btn btn-success mt-4" type="button">Select</button>
									</div>
								</form>
							</c:if>

						</fieldset>
				   </div>
			   
				
			   <div class="card col-xl-7" style="max-width: 55%">
					<fieldset>
					<!-- addStaff Form -->
						
						<form id="Addform" action="${pageContext.request.contextPath}/on/addInventory" method="post">
							<legend>
								add Inventory
							</legend>
							
							<hr>
							<!-- 1 :Store NO : readOnly -->
							<div class="col-xl-6">
								<label for="storeId" class="form-label">storeId:</label>
								<input id="storeId" name="storeId" class="form-control" type="text" value="${storeId}" readonly>
							</div>
	
							<!-- 2 : AddressId-->
							<div class="col-xl-6">
								<label for="filmId" class="form-label">filmId</label>
								<input id="filmId" name="filmId" class="form-control" type="text" placeholder="영화를 선택하세요" readonly>
							</div>
								
							<!-- button -->
							<div class="d-flex flex-row-reverse">
								<button id="btnAddInventory" class="btn btn-success mt-5" type="button">Select</button>
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

		$('#btnFilm').click(function() {
			console.log("click");
			if($('#searchFilm').val() == "") {
				alert('fill in the film search form');
			} else {
				$('#searchForm').submit();
			}
		});
		
		$('#btnSelectFilm').click(function() {
			if($('#resultFilm').val() == '' || $('#resultFilm').val() == null) {
				alert('select film first');
			} else {
				$('#filmId').val($('#resultFilm').val());
			}
		});
		
		$('#btnAddInventory').click(function() {
			if($('#storeId').val() == "" || $('#filmId').val() == "") {
				alert('fill in all required form');
			}
			$('#Addform').submit();
		});
		
		
	
	
		
	</script>
</html>