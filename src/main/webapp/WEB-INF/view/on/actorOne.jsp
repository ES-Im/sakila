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
	  			    <h2>ACTOR</h2>
	  			    <table class="table">
	  			    	<tr>
		  			    	<td>Id</td>
		  			    	<td>${actor.actorId}</td>
	  			    	</tr>
	  			    	<tr>
		  			    	<td>Name</td>
		  			    	<td>${actor.firstName} ${actor.lastName}</td>
	  			    	</tr>
	  			    </table>
	  			    <div>
	  			    	<a href="${pageContext.request.contextPath}/on/modifyActor">Edit ACTOR</a>
	  			    	// 배우의 firstName, lastName 수정 기능 과제[입력폼, 액션, 서비스, 매퍼]
	  			    </div>
	  			    
	  			    <!-- Actor File -->
					<h2>Actor File</h2>
					<table class="table">
						<tr>
							<th>Image</th>
							<th>Type</th>
							<th>Size</th>
							<th>CreateDate</th>
							<th>Delete</th>
						</tr>
						<c:forEach var="af" items="${actorFileList}">
							<tr>
								<td>
									<img src="${pageContext.request.contextPath}/upload/${af.fileName}.${af.ext}">
								</td>
								<td>${af.contentType}</td>
								<td>${af.size}</td>
								<td>${af.createDate}</td>
								<td>
									<a href="">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</table>	  	
					<div>
						<a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-success">이미지 파일 추가</a>
					</div>
							    
	  			    <!-- Film -->
	  			    <h2>Film</h2>
  			    	<ul>
	  			    	<c:forEach var="f" items="${filmList}">

		  			    	<li>
		  			    		<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">${f.title}</a>
		  			    	</li>
		  			    </c:forEach>
  			    	</ul>
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