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
			    <div>Actor List</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
			    <div class="card">
			    	<div class="d-flex justify-content-between  text-white">
	  			    	<span class="p-1">
			    			<a class="btn" href="${pageContext.request.contextPath}/on/filmList?rowPerPage=5">5Page</a>
			    			<a class="btn" href="${pageContext.request.contextPath}/on/filmList?rowPerPage=10">10Page</a>
				    	</span>
				    	<span class="p-1">
							<form method="get" action="${pageContext.request.contextPath}/on/filmList">
								<input name="rating" type="hidden" value="${rating}">
								<input name="categoryId" type="hidden" value="${categoryId}">
								<input id="searchWord" name="searchWord" type="text"  placeholder="Search Title">
								<button id="searchBtn" class="btn btn-primary" type="submit">SEARCH</button>
							</form>
						</span>
		    		</div>
			    	
			    	<table class="table table-striped">
			    		<thead class="table-primary">
				    		<tr>
				    			<th>filmId</th>
				    			<th>title</th>
				    			<th>releaseYear</th>
				    			<th>rentalDuration</th>
				    			<th>rentalRate</th>
				    			<th>length</th>
				    			<th>replacementCost</th>
				    			<th>
									<%-- 제한등급 검색 --%>
									<div class="dropdown">
										<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
											Select Rating
										</button>
										<ul class="dropdown-menu category">
											<c:forEach var="r" items="${ratingList}">
									  			<li>
													<a href="${pageContext.request.contextPath}/on/filmList?rating=${r}&categoryId=${categoryId}&searchWord=${searchWord}">
														${r}
													</a>						  			
									  			</li>
											</c:forEach>
							  			</ul>
									</div>
				    			</th>
				    			
				    			<th>					    	
				    				<%-- 장르 검색 --%>
									<div class="dropdown">
										<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
											Select Gerne
										</button>
										<ul class="dropdown-menu category">
											<c:forEach var="c" items="${categoryList}">
									  			<li>
													<a href="${pageContext.request.contextPath}/on/filmList?categoryId=${c.categoryId}&rating=${rating}&searchWord=${searchWord}">
														${c.name}
													</a>						  			
									  			</li>
											</c:forEach>
							  			</ul>
									</div>
								</th>
				    			<th>상세보기</th>
				    		</tr>
			    		</thead>
			    		<c:forEach var="f" items="${filmList}">
			    			<tr>
			    				<td>${f.filmId}</td>
			    				<td>${f.title}</td>
			    				<td>${f.releaseYear}</td>
			    				<td>${f.rentalDuration}</td>
			    				<td>${f.rentalRate}</td>
			    				<td>${f.length}</td>
			    				<td>${f.replacementCost}</td>
			    				<td>${f.rating}</td>
			    				<td>${f.categoryId}</td>
			    				<td>
			    					<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">이동</a>
		    					</td>
			    			</tr>
			    		</c:forEach>
			    	</table>
			    	
			    	<ul class="pagination">
				    	<c:if test="${page.currentPage - 10 > 0}">
				    		<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/filmList?currentPage=1&rowPerPage=${page.rowPerPage}&rating=${rating}&searchWord=${searchWord}&categoryId=${categoryId}">처음으로</a>
					    	</li>
					    	<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${page.currentPage-10}&rowPerPage=${page.rowPerPage}&rating=${rating}&searchWord=${searchWord}&categoryId=${categoryId}">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<li class="page">
			    			<c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
				    				<c:if test="${page.currentPage == num}">
				    					${num}&nbsp;
				    				</c:if>
				    				
				    				<c:if test="${page.currentPage != num}">
				    					<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${num}&rowPerPage=${page.rowPerPage}&rating=${rating}&searchWord=${searchWord}&categoryId=${categoryId}">
				    						${num}
				    					</a>
				    					&nbsp;
				    				</c:if>
			    			</c:forEach>
			    		</li>
			    		
				    	<c:if test="${page.currentPage <= page.lastPage - 10 && page.lastPage != 0}">
				    		<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${page.currentPage+10}&rowPerPage=${page.rowPerPage}&rating=${rating}&searchWord=${searchWord}&categoryId=${categoryId}">다음</a>
					    	</li>
					    	<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${page.lastPage}&rowPerPage=${page.rowPerPage}&rating=${rating}&searchWord=${searchWord}&categoryId=${categoryId}">마지막</a>
					    	</li>
				    	</c:if>
		    		</ul>
		    		<div>현재페이지 : ${page.currentPage} / ${page.lastPage}</div>
				</div>
			  </main>
			
			  <footer class="footer">
			  <div></div>
			  </footer>
		  </div>
    </body>
    <script>
    	$('#category').change(function() {
    		
    	})
    </script>
</html>








