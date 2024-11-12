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
		
		  <main class="main row">
		    <div class="card" style="max-width:50%">
		    <div class="col">
		    	<!-- form dto = Actor instance + multipart-form-data -->
		    	<form id="formFilm" method="post" action="${pageContext.request.contextPath}/on/addFilm">
		    	
		    		<div style="width: 90%">
		    			<%--title--%>
						<label class="form-label">Title</label>
						<input id="title" name="title" class="form-control" type="text">
						
						<%--description--%>
						<label class="form-label">description</label>
						<textarea id="description" name="description" class="form-control" cols="50" row="3">
						</textarea>
						
						<%--releaseYear : select + forEach로 1900 ~ 현재년도 순환--%>
						<label class="form-label">ReleaseYear</label>
						<input id="releaseYear" name="releaseYear" class="form-control" type="number">
						
						<%--language_id--%>
						<div class="row">
						    <div class="col-xl-4">
						        <label class="form-label">Language</label>
						        <select class="form-select" id="LanguageId" name="languageId">
						            <option value="">|||Select|||</option>
						            <c:forEach var="la" items="${languageList}">
						                <option value="${la.languageId}">${la.name}</option>
						            </c:forEach>
						        </select>
						    </div>
						
						<%--originalLanguageId--%>
							 <div class="col-xl-4">
						        <label class="form-label">Original Language</label>
						        <select class="form-select" id="originalLanguageId" name="originalLanguageId">
						            <option value="">|||Select|||</option>
						            <c:forEach var="la" items="${languageList}">
						                <option value="${la.languageId}">${la.name}</option>
						            </c:forEach>
						        </select>
						    </div>
						    
					    <%-- 언어 추가 --%>
							<button class="btn btn-success col-xl-1" id="addLanguage"  style="white-space: nowrap; width: 180px; margin-top: 10px;">ADD Language</button>
						</div>
						
						
						
						
						<%--rentalDuration--%>
						<label class="form-label">rentalDuration</label>
						<input id="rentalDuration" name="rentalDuration" class="form-control" type="number" value="3">
						
						<%--rentalRate--%>
						<label class="form-label">rentalRate</label>
						<input id="rentalRate" name="rentalRate" class="form-control" type="number" value="4.99">
						
						<%--length--%>
						<label class="form-label">length</label>
						
						
						<%--replacementCost--%>
						<label class="form-label">replacementCost</label>
						<input id="replacementCost" name="replacementCost" class="form-control" type="number" value="19.99" placeholder="19.99">
						
						<%--rating--%>
						<label class="form-label">rating</label><br>
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							<input class="btn-check" id="rating1" name="rating" value="G" type="radio" autocomplete="off" checked>
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
						<br>
						<%--specialFeatures--%>
						<label class="form-label">specialFeatures</label>
						
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="Trailers" id="Trailers" name="specialFeatures">
							<label class="form-check-label" for="Trailers">
							 	Trailers
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="Commentaries" id="Commentaries" name="specialFeatures">
							<label class="form-check-label" for="Commentaries">
							 	Commentaries
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="Deleted Scenes" id="Deleted Scenes" name="specialFeatures">
							<label class="form-check-label" for="Deleted Scenes">
							 	Deleted Scenes
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="Behind the Scenes" id="Behind the Scenes" name="specialFeatures">
							<label class="form-check-label" for="Behind the Scenes">
							 	Behind the Scenes
							</label>
						</div>
						<div class="d-flex flex-row-reverse">
							<button class="btn btn-success" id="btnAddFilm" type="button">ADD</button>
						</div>
					</div>
					
				</form>
			</div>
		    </div>
		  </main>
		
		  <footer class="footer"></footer>
		</div>
    </body>
    <script>
    
	
		$('#addLanguage').click(function() {
			let url = `${pageContext.request.contextPath}/on/addLanguage`
			window.open(url, '언어 등록하기', 'width=500pv, height=400pv');
			return false;
		});
    
    	// form submit
		$('#btnAddFilm').click(function() {
			let arr = [$("#rentalDuration").val(),  $("#rentalRate").val(), $("#replacementCost").val(), $('#rating:checked'), $("#title").val()];
			/* FilmForm 의 int를 전부 기본형으로 설계시 사용 : 서비스에서 -1을 널로 치환하는 작업을 해야된다.(공백을 int에 담을수없어 공백입력받을시 특정 숫자로 치환필요)
			$('#releaseYear').val(($('#releaseYear').val() == "") ? -1 : $('#releaseYear').val());
			$('#length').val(($('#length').val() == "") ? -1 : $('#length').val());
			$('#languageId').val(($('#languageId').val() == "") ? -1 : $('#languageId').val());
			$('#originalLanguageId').val(($('#originalLanguageId').val() == "") ? -1 : $('#originalLanguageId').val());
			*/
			//console.log("length = " + $('#length').val());
			//console.log("releaseYear = " + $('#releaseYear').val());

			for(let i = 0; i < arr.length; i++) {
					// 유효성 검사(1) : 대상 = 숫자가 입력됬는지 확인 rentalDuration, rentalRate, replacementCost
					if((i < 3) && isNaN(arr[i])) {
						alert('rentalDuration, rentalRate, replacementCost 항목은 숫자를 입력해야합니다.');
						return;
					}
					// 유효성 검사(2) : 대상 = rating 이 체크되어 있지 않은지
					if((i==3) && arr[i] == false) {
						alert('rating을 선택하세요');
						return;
					}
					// 유효성 검사(3) : 대상 = 기본값이 NULL 이 아닌 필드 {title, rentalDuration, rentalRate, replacementCost, rating, lastUpdate}
					if((i > 3) && arr[i] == '') {
						alert('fill in the requeired form');
						return;
					}
			}
			
			$("#formFilm").submit();
		});
		

    	
    </script>
</html>