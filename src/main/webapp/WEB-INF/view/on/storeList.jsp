
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
			  background-color: #D4F4FA;
			  padding: 24px;
			  margin-bottom: 20px;
			  text-align: center;
			  min-height: 100%;
			}
			
			.footer {
			  grid-area: footer;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  padding: 0 16px;
			  background-color: #648ca6;
			}
			
			.min-thead {
				min-heigth:30%;
			}
		</Style>
		<title></title>
    </head>

    <body>
       <div class="grid-container">
		  <header class="header">
		    <div>Store List</div>
		  </header>
		
		  <aside class="sidenav">
			  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		  </aside>
			
		  <main class="main">
		    <div class="card">
			    <h1>가게 정보</h1>
			    <hr>
				<table class="table table-striped">
					<thead class="table-primary">
						<tr>
							<th>storeId</th>
							<th>위치</th>
							<th>Inventory</th>
							<th>Manager</th>
							<th>email</th>
							<th>staffOne 이동</th>
						</tr>
					</thead>
					<c:forEach var="s" items="${storeList}">
						<tr>
							<td>${s.storeId}</td>
							<td>${s.countryName} ${s.cityName} ${s.district} ${s.address}</td>
							<td>
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${s.storeId}">
									인벤토리 관리
								</a>
							</td>
							<td>${s.firstName} ${s.lastName} (${s.userName})</td>
							<td>${s.email}</td>
							<td>
								<a class="btn btn-success" href="${pageContext.request.contextPath}/on/staffOne?staffId=${managerStaffId}">이동</a>
							</td>
							
						</tr>
					</c:forEach>
				</table>
				

			</div>
			
		    
	  </main>
      </div>
			
	  <footer class="footer">
	  </footer>
    </body>
</html>