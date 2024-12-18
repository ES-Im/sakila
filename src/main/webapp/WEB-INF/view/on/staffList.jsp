
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
		    <div>Staff List</div>
		  </header>
		
		  <aside class="sidenav">
			  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		  </aside>
			
		  <main class="main">
		    <div class="card">
			<table class="table table-striped">
				<thead class="table-primary">
					<tr>
						<th>ID</th>
						<th>UserName</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Address Id</th>
						<th>Email</th>
						<th>Store Id</th>
						<th>last Update</th>
						<th>Active</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<c:forEach items="${staffMap}" var="s">
					<tr>
						<td>${s.staffId}</td>
						<td>${s.username}</td>
						<td>${s.firstName}</td>
						<td>${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.email}</td>
						<td>${s.lastUpdate}</td>
						<td>status : ${s.active}</td>
						<td>
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}">
								<c:if test="${s.active==1}">disable</c:if>
								<c:if test="${s.active==2}">Activate</c:if>
							</a>
						</td>
						<td>
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/staffOne?staffId=${s.staffId}">이동</a>
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