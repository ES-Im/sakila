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
			    <div>Main</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			    <div class="card">
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
									<a href="">Edit ADDRESS</a>
									<br>
									EMAIL : ${staff.staffEmail}
									<a href="">Edit Email</a>
									<br>
									PHONE NUM : ${staff.staffPhone}
									
									<a href="">Edit Password</a>
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
									<a href="">Change Store</a>
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
					<a href="">modify account</a>
					<a href="">delete account</a>
					
					<hr>
								
				</div>			    
			    
			    </div>
			  </main>
			
			  <footer class="footer">
			  <div></div>
			  </footer>
			</div>
    </body>
</html>


