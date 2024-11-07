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
		    <div>Add Film</div>
		  </header>
		
		  <aside class="sidenav">
			  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		  </aside>
		
		  <main class="main">
		    <div class="card">
		    	<!-- form dto = Actor instance + multipart-form-data -->
		    	<form id="formFilm" method="post" action="${pageContext.request.contextPath}/on/addFilm">
		    	
		    		<div style="width: 80%">
		    			<%--title--%>
						<label class="form-label">Title</label>
						<input id="title" name="title" class="form-control" type="text">
						
						<%--description--%>
						<label class="form-label">description</label>
						<textarea id="description" name="description" class="form-control" cols="50" row="3">
						</textarea>
						
						<%--releaseYear : select + forEach로 1900 ~ 현재년도 순환--%>
						<label class="form-label">ReleaseYear</label>
						<input id="releaseYear" name="releaseYear" class="form-control" type="number" >
						
						<%--language_id--%>
						<label class="form-label">language</label>
						<select id="LanguageId" name="languageId">
							<option value=""></option>
							<c:forEach var="la" items="${languageList}">
								<option value="${la.languageId}">${la.name}</option>
							</c:forEach>
						</select>
						
						
						
						
						<br>
						
						<%--originalLanguageId--%>
						<label class="form-label">originalLanguage</label>
						<select id="originalLanguageId" name="originalLanguageId">
							<option value=""></option>
							<c:forEach var="la" items="${languageList}">
								<option value="${la.languageId}">${la.name}</option>
							</c:forEach>
						</select>
						
						<br>
						
						<%--rentalDuration--%>
						<label class="form-label">rentalDuration</label>
						<input id="rentalDuration" name="rentalDuration" class="form-control" type="number" value="3">
						
						<%--rentalRate--%>
						<label class="form-label">rentalRate</label>
						<input id="rentalRate" name="rentalRate" class="form-control" type="number" value="4.99">
						
						<%--length--%>
						<label class="form-label">length</label>
						<input id="length" name="length" class="form-control" type="number">
						
						<%--replacementCost--%>
						<label class="form-label">replacementCost</label>
						<input id="replacementCost" name="replacementCost" class="form-control" type="number" value="19.99" placeholder="19.99">
						
						<%--rating--%>
						<label class="form-label">rating</label><br>
						<input id="rating" name="rating" type="radio" value="G">G<br>
						<input id="rating" name="rating" type="radio" value="PG">PG<br>
						<input id="rating" name="rating" type="radio" value="PG-13">PG-13<br>
						<input id="rating" name="rating" type="radio" value="R">R<br>
						<input id="rating" name="rating" type="radio" value="NC-17">NC-17<br>
						
						<%--specialFeatures--%>
						<label class="form-label">specialFeatures</label>
						
						<input id="specialFeatures" name="specialFeatures" type="checkBox" value="Trailers">Trailers
						<input id="specialFeatures" name="specialFeatures" type="checkBox" value="Commentaries">Commentaries
						<input id="specialFeatures" name="specialFeatures" type="checkBox" value="Deleted Scenes">Deleted Scenes
						<input id="specialFeatures" name="specialFeatures" type="checkBox" value="Behind the Scenes">Behind the Scenes
						
						<button id="btnAddFilm" type="button">ADD</button>
					</div>
					
				</form>
		    </div>
		  </main>
		
		  <footer class="footer"></footer>
		</div>
    </body>
    <script>
    	// form submit
		$('#btnAddFilm').click(function() {
			$("#formFilm").submit();
		})
		
    </script>
</html>