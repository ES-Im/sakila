<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
			    <div>EDIT FILM</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			    <div class="card">
	  			    <!-- FILM Info  -->
				    	<legend>
				    		 Edit FILM NO : ${filmInfo.filmId}
				    	</legend>
				    	<hr>
				    	<form id="modifyForm" action="${pageContext.request.contextPath}/on/filmOne?filmId=${filmInfo.filmId}" method="post">
			    		<table class="table table-primary">
			    			<input type="hidden" value="${filmInfo.filmId}">
			    			
			    			<%--title--%>
			    			<tr>
			    				<td>
			    					Title
			    				</td>
			    				<td>
			    					<input id="title" name="title" class="form-control" type="text" placeholder="${filmInfo.title}">
								</td>
			    			</tr>
			    			
			    			<%--description--%>
			    			<tr>
			    				<td>Description</td>
			    				<td>
			    					<textarea id="description" name="description" class="form-control" cols="50" rows="3" placeholder="${filmInfo.description}">
			    						${filmInfo.description}
			    					</textarea>
			    				</td>
			    			</tr>
			    			
			    			<%--releaseYear--%>
			    			<tr>
			    				<td>releaseY</td>
			    				<td>
			    					<input id="releaseYear" name="releaseYear" class="form-control" type="number" placeholder="${fn:substring(filmInfo.releaseYear,0,4)}">
			    				</td>
			    			</tr>
			    			
			    			<%--rentalDuration--%>
			    			<tr>
			    				<td>rentalDur</td>
			    				<td>
			    					<input id="rentalDuration" name="rentalDuration" class="form-control" type="number" value="3" placeholder="${filmInfo.rentalDuration}">
			    				</td>
			    			</tr>
			    			
			    			<%--rentalRate--%>
			    			<tr>
			    				<td>rentalRate</td>
			    				<td>
			    					<input id="rentalRate" name="rentalRate" class="form-control" type="number" value="4.99"  placeholder="${filmInfo.rentalRate}">
			    				</td>
			    			</tr>
			    			<%--length--%>
			    			<tr>
			    				<td>length</td>
			    				<td>
			    					<input id="length" name="length" class="form-control" type="number" placeholder="${filmInfo.length}">
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>replacementCost</td>
						    	<td>
						    		<input id="replacementCost" name="replacementCost" class="form-control" type="number" value="19.99" placeholder="19.99">
			    				</td>
			    			</tr>
			    			
			    			<%--rating--%>
			    			<tr>
			    				<td>rating</td>
			    				<td>
				    				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
										<input class="btn-check" id="rating1" name="rating" value="G" type="radio" autocomplete="off">
										<label class="btn btn-outline-primary" for="rating1">G</label>
										
										<input class="btn-check" id="rating2" name="rating" value="PG" type="radio" autocomplete="off">
										<label class="btn btn-outline-primary" for="rating2">PG</label>
										
										<input class="btn-check" id="rating3" name="rating" value="PG-13" type="radio" autocomplete="off">
										<label class="btn btn-outline-primary" for="rating3">PG-13</label>
										
										<input class="btn-check" id="rating4" name="rating" value="R" type="radio" autocomplete="off">
										<label class="btn btn-outline-primary" for="rating4">R</label>
										
										<input class="btn-check" id="rating5" name="rating" value="NC-17" type="radio" autocomplete="off">
										<label class="btn btn-outline-primary" for="rating5">NC-17</label>
										
									</div>
										<input class="btn-check" id="now" name="rating" value=null type="radio" autocomplete="off" disabled>
										<label class="btn btn-outline-primary" for="now">현재:${filmInfo.rating}</label>
								</td>
			    			</tr>
			    			<tr>
			    				<td>specialFeatures</td>
			    				<td>
			    					<div class="form-check">
			    						<c:choose>
				    						<c:when test="${fn:contains(specialFeaturesList, 'Trailers')}">
												<input class="form-check-input" type="checkbox" value="Trailers" id="specialFeatures1" name="specialFeatures" checked>
											</c:when>
											<c:otherwise>
												<input class="form-check-input" type="checkbox" value="Trailers" id="specialFeatures1" name="specialFeatures">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="specialFeatures1">
										 	Trailers
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${fn:contains(specialFeaturesList, 'Commentaries')}">
												<input class="form-check-input" type="checkbox" value="Commentaries" id="specialFeatures2" name="specialFeatures">
											</c:when>
											<c:otherwise>
												<input class="form-check-input" type="checkbox" value="Commentaries" id="specialFeatures2" name="specialFeatures">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="specialFeatures2">
										 	Commentaries
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${fn:contains(specialFeaturesList, 'Deleted Scenes')}">
												<input class="form-check-input" type="checkbox" value="Deleted Scenes" id="specialFeatures3" name="specialFeatures" checked>
											</c:when>
											<c:otherwise>
												<input class="form-check-input" type="checkbox" value="Deleted Scenes" id="specialFeatures3" name="specialFeatures">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="specialFeatures3">
										 	Deleted Scenes
										</label>
									</div>
									<div class="form-check">
										<c:choose>
											<c:when test="${fn:contains(specialFeaturesList, 'Behind the Scenes')}">
												<input class="form-check-input" type="checkbox" value="Behind the Scenes" id="specialFeatures4" name="specialFeatures" checked>
											</c:when>
											<c:otherwise>
												<input class="form-check-input" type="checkbox" value="Behind the Scenes" id="specialFeatures4" name="specialFeatures">
											</c:otherwise>
										</c:choose>
										<label class="form-check-label" for="specialFeatures4">
										 	Behind the Scenes
										</label>
									</div>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>languageName</td>
			    				<td>
				    				<div class="row">
				    					<div class="col-xl-4">
									        <select class="form-select" id="LanguageId" name="languageId">
									            <option value="${info.languageId}">기존 : ${filmInfo.languageName}</option>
									            <c:forEach var="la" items="${languageList}">
									                <option value="${la.languageId}">${la.name}</option>
									            </c:forEach>
									        </select>
									    </div>
									    
									    	<button class="btn btn-success col-xl-1" id="addLanguage" style="white-space: nowrap; width: 180px;">ADD Language</button>
								    </div>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>lastUpdate</td>
			    				<td>${filmInfo.lastUpdate}</td>
			    			</tr>
		  			    </table>
		    			<div class="d-flex flex-row-reverse">
							<button class="btn btn-success" id="btnModifyFilm" type="button" style="width: 180px;">ADD</button>
						</div>
					</form>
				</div>

				  <footer class="footer">
				  <div></div>
				  </footer>
			  </main>
    </body>
    <script>
    	<%-- 언어 추가 폼 팝업 --%>
		$('#addLanguage').click(function() {
			let url = `${pageContext.request.contextPath}/on/addLanguage`
			window.open(url, '언어 등록하기', 'width=500pv, height=400pv');
			return false;
		});
		
		<%-- 폼 검사 --%>
		$('#btnModifyFilm').click(function(){
			console.log("click");
			<%-- 필수 입력 폼 : rating은 따로--%>
			let mendatoryVar = {
					Title : $("#title").val(),
					RentalDuration : $("#rentalDuration").val(),
					RentalRate : $("#rentalRate").val(), 
					ReplacementCost : $("#replacementCost").val(),
			};
			
			<%-- 필수 입력 폼 유효성 검사 --%>
			for(let key in mendatoryVar) {
				if(mendatoryVar[key] == null || mendatoryVar[key] == "") {
					alert(key + "을/를 입력해주세요.");
					return;
				}
			}
			<%-- rating 체크 검사 --%>
			if( $('#rating:checked'), $("#title").val() == false) {
				alert("rating을 하나 이상 체크해주세요.");
			};
			
			<%-- 선택 입력 폼 : specialFeatures는 따로 
			let selectableVar = {
					length : $("#length").val(),
					LanguageId : $("#LanguageId").val(), 
					Description: $("#description").val(), 
					ReleaseYear: $("#releaseYear").val(),
			}; --%>
			
			$('#modifyForm').submit();
		});
    </script>
</html>