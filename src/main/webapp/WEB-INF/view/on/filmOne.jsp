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
	<%--
		1) film 상세 
			(o) - film One
			- film 수정 /on/modifyFilm
			- actor 삭제 /on/removeActor (인벤토리 렌탈정보 확인) - (렌탈 정보에 없으면) -> (film_actor 삭제 + film-category 삭제) 
		2) film-category 리스트
			- 리스트
			- film-category 추가 /on/addFilmCategory (체크박스로 선택, 추가)
			- film-category 개별 삭제 /on/removeFilmCategory
		3) film-actor 리스트
			(o) - 리스트 
			- film_actor 추가 /on/addActorByFilm (Actor 검색 후 선택, 추가)
			- film_actor 개별 삭제 /on/removeActorFile
		4) inventory 정보 출력
	 --%>
    <body>
	       <div class="grid-container">
			  <header class="header">
			    <div>FILM ONE</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			    <div class="card">
			    	<div>
	  			    <!-- FILM Info  -->
				    	<legend>
				    		FILM
				    	</legend>
				    	<hr>
			    		<table class="table table-primary">
			    			<tr>
			    				<td>FilmId</td>
			    				<td>${film.filmId}</td>
			    			</tr>
			    			<tr>
			    				<td>Title</td>
			    				<td>${film.title}</td>
			    			</tr>
			    			<tr>
			    				<td>Description</td>
			    				<td>${film.description}</td>
			    			</tr>
			    			<tr>
			    				<td>releaseY</td>
			    				<td>${film.releaseYear}</td>
			    			</tr>
			    			<tr>
			    				<td>rentalDur</td>
			    				<td>${film.rentalDuration}</td>
			    			</tr>
			    			<tr>
			    				<td>rentalRate</td>
			    				<td>${film.rentalRate}</td>
			    			</tr>
			    			<tr>
			    				<td>length</td>
			    				<td>${film.length}</td>
			    			</tr>
			    			<tr>
			    				<td>replacementCost</td>
			    				<td>${film.replacementCost}</td>
			    			</tr>
			    			<tr>
			    				<td>rating</td>
			    				<td>${film.rating}</td>
			    			</tr>
			    			<tr>
			    				<td>specialFeatures</td>
			    				<td>${film.specialFeatures}</td>
			    			</tr>
			    			<tr>
			    				<td>lastUpdate</td>
			    				<td>${film.lastUpdate}</td>
			    			</tr>
			    			<tr>
			    				<td>languageName</td>
			    				<td>${film.languageName}</td>
			    			</tr>
			    			<tr>
			    				<td>edit</td>
			    				<td>
			    					<a class="btn btn-success" href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}">Edit</a>
			    				</td>
		    				</tr>
			    			<tr>
			    				<td>Remove</td>
			    				<td>
			    					<a class="btn btn-success" href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}">Delete</a>
									<span>${param.removeFilmMsg}</span>
			    				</td>
		    				</tr>
		  			    </table>
						</div>
						<br>
				</div>
				
				<div class="card">	    
	  			    <%-- artorList --%>
 			    	<h1>장르</h1>
 			    	<hr>
		    	</div>
				<div class="card">	    
	  			    <%-- artorList --%>
 			    	<h1>작품에 출연한 배우들</h1>
 			    	<hr>
					<table class="table table-striped table-primary">
						<tr>
							<th>배우이름</th>
							<th>이동</th>
						</tr>
						<c:forEach var="a" items="${actorList}">
							<tr>
		  			    		<td>
		  			    			${a.firstName} ${a.lastName}
		  			    		</td>
		  			    		<td>
									<a class="btn btn-success" href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
										배우 정보
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
			
		 	 </div>
				  <footer class="footer">
				  <div></div>
				  </footer>
			  </main>
    </body>
    <script>

    </script>
</html>