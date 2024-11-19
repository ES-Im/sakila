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
			
			li {
			    list-style: outside none none;
			    padding-left: 5px;
			}
		</Style>
		<title></title>
    </head>

    <body>
	       <div class="grid-container">
			  <header class="header">
			    <div>Actor One</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			    <div class="card">
			    
	  			    <!-- Actor Info  -->
			    	<legend>
			    		Customer Info
			    	</legend>
			    	<hr>
		    		<table class="table table-primary">
		    			<tr>
		    				<th>customerId</th>
		    				<th>Name</th>
		    				<th>email</th>
		    				<th>address</th>
		    				<th>storeId</th>
		    				<th>createDate</th>
		    				<th>lastUpdate</th>
		    				<th>active</th>
		    			</tr>
		    			<tr>
		    				<td>${customer.customerId}</td>
		    				<td>${customer.firstName} ${customer.lastName}</td>
		    				<td>${customer.email}</td>
		    				<td>${customer.country} ${customer.city} ${customer.address} (${customer.district})</td>
		    				<td>${customer.storeId}</td>
		    				<td>${customer.createDate}</td>
		    				<td>${customer.lastUpdate}</td>
		    				<td>${customer.active}</td>
		    			</tr>
	  			    </table>

	  			    <div>
	  			    	<a class="btn btn-success" href="${pageContext.request.contextPath}/on/modifyActor?actorId=${actor.actorId}">Edit ACTOR</a>
	  			    	<form method="get" action="${pageContext.request.contextPath}/on/modifyActor?actorId=${actor.actorId}">
	  			    		<table>
	  			    			<tr>
	  			    			
	  			    			</tr>
	  			    			
	  			    		</table>
	  			    	</form>
	  			    </div>
	  			    <div>
	  			    	<a class="btn btn-success" href="${pageContext.request.contextPath}/on/removeActor?actorId=${actor.actorId}">DELETE ACTOR</a>
	  			    </div>
	  			    
  			    </div>
  			    
  			    
			    <div class="card">	    
	  			   	<legend>
			    		Rental List
			    	</legend>

	  			      <hr>     
  			    	  <table class="table table-striped table-primary">
	  			    		<tr>
	  			    			<th>inventoryId</th>
	  			    			<th>filmId</th>
	  			    			<th>storeId</th>
	  			    			<th>title</th>
	  			    			<th>rentalDate</th>
	  			    			<th>returnDate</th>
	  			    			<th>이동</th>
	  			    		</tr>
	  			    	<c:forEach var="r" items="${rentaledList}">
		  			    	<tr>
		  			    		<td>${r.inventoryId}</td>
		  			    		<td>${r.filmId}</td>
		  			    		<td>${r.storeId}</td>
		  			    		<td>${r.title}</td>
		  			    		<td>${r.rentalDate}</td>
		  			    		<td>${r.returnDate}</td>
		  			    		<td>
		  			    			<a class="btn btn-success" href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">상세보기</a>
		  			    		</td>
		  			    	</tr>
		  			    </c:forEach>
  			    	  </table>
					</div>
  			  
			  </main>
			
			  <footer class="footer">
			  <div></div>
			  </footer>
		  </div>
    </body>
    <script> 

	    
    </script>
</html>