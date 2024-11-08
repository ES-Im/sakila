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
    // 배우의 firstName, lastName 수정 기능 과제[입력폼, 액션, 서비스, 매퍼]
	<%--
		1) actor 상세 
			(o) - actor One
			- actor 수정 /on/modifyActor
			- actor 삭제 /on/removeActor (actor의 파일 삭제 + film_actor 삭제 + actor 삭제)
		2) actor_file 리스트
			(o) - 리스트
			(o) - actor_file 추가 /on/addFilmByActor
			(o) - 개별 actor_file 삭제 /on/removeActorFile
		3) film-actor 리스트
			(o) - 리스트 
			- film_actor 추가 /on/addFilmActor (Film 검색 후 선택, 추가)
			- film_actor 개별 삭제 /on/removeFilmActor
	 --%>
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
			    		Actor
			    	</legend>
			    	<hr>
		    		<table class="table table-primary">
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
	  			    <!-- Actor File -->
			    	<legend>
			    		Actor File
			    	</legend>
			    	<hr>
			    	<c:if test="${empty actorFileList==false}">
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
			  			    			<a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actorId}">Remove File</a>
									</td>
								</tr>
							</c:forEach>
						</table>	
					</c:if>  	
						<div>
							<a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-success">이미지 파일 추가</a>
						</div>
				</div>	
				<div class="card">	    
	  			    <!-- Film -->
	  			    <div>
	  			    	<!-- 출연작 추가 : 영화 검색 -->
	  			    	<form id="searchFilmForm" method="get" action="${pageContext.request.contextPath}/on/actorOne">
	  			    		<legend>
	  			    			Select Film
	  			    		</legend>
	  			    		<hr>
	  			    		<%-- 컨트롤러에서 포워딩 방식으로 검색 --%>
	  			    		<div class="mt-3">
		  			    		<input type="hidden" name="actorId" value="${actor.actorId}">
		  			    		<input type="text" name="searchTitle">
		  			    		<buttom id="BtnsearchFilm" class="btn btn-success" type="button">Film 검색</buttom>
	  			    		</div>
	  			    	</form>
	  			    	<!-- 출연작 추가 : 검색한 영화중에 선택 -->
	  			    	
  			    		<c:if test="${searchFilmList != null}">
  			    			<form id="addFilmForm" method="post" action="${pageContext.request.contextPath}/on/addFilmByActor">
  			    				<input type="hidden" name="actorId" value="${actor.actorId}">
  			    				<div class="d-flex flex-col justify-content-center mt-3">
	  			    				<select name="filmId">
	  			    					<c:forEach var="sf" items="${searchFilmList}">
	  			    						<option value="${sf.filmId}">${sf.title}</option>
	  			    					</c:forEach>
	  			    				</select>
		  			    			<button class="btn btn-success" id="btnAddFilm" type="button">영화 등록</button>
		  			    		</div>
	  			    		</form>
  			    		</c:if>

	  			  	  </div>  	
	  			   </div>
	  			   <div class="card">	
		   	  		   <legend>
	  			    		Film
	  			       </legend>
	  			       <hr>     
	  			    	  <table class="table table-striped table-primary">
		  			    	<c:forEach var="f" items="${filmList}">
			  			    	<tr>
			  			    		<td>
			  			    			${f.title}
			  			    		</td>
			  			    		<td>
			  			    			<a class="btn btn-success" href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">상세보기</a>
			  			    		</td>
			  			    		<td>
			  			    			<a class="btn btn-danger" href="${pageContext.request.contextPath}/on/removeFileActor?filmId=${f.filmId}&actorId=${actor.actorId}">출연자에서 삭제</a>
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
	    $('#BtnsearchFilm').click(function() {
	    	$('#searchFilmForm').submit();
	    });
	    $('#btnAddFilm').click(function() {
	    	$('#addFilmForm').submit();
	    });
    </script>
</html>