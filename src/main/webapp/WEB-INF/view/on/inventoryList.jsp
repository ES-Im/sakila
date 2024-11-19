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
			    <div>#${storeId} Store's Inventory List</div>
			  </header>
			
			  <aside class="sidenav">
				  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
			  </aside>
			
			  <main class="main">
	    		<%-- 영화 검색 박스 --%>
	    		
	    		<div class="card">
	    			영화검색
	    			<span class="p-1">
						<form method="get" action="${pageContext.request.contextPath}/on/inventoryList">
							<input name="storeId" type="hidden" value="${storeId}">
							<input id="searchWord" name="searchWord" type="text"  placeholder="Search Title">
							<button id="searchBtn" class="btn btn-primary" type="submit">SEARCH</button>
						</form>
					</span>
					
					<div>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/addInventory?storeId=${storeId}">
							인벤토리 추가	
						</a>
					</div>
	    		</div>
			    <div class="card">
			    	<h1>#${storeId} Store's Inventory List</h1>
			    	<hr>
			    	
			    	<div class="d-flex justify-content-between  text-white">
	  			    	<span class="p-1">
			    			<a class="btn" href="${pageContext.request.contextPath}/on/inventoryList?rowPerPage=5&storeId=${storeId}&searchWord=${searchWord}">5Page</a>
			    			<a class="btn" href="${pageContext.request.contextPath}/on/inventoryList?rowPerPage=10&storeId=${storeId}&searchWord=${searchWord}">10Page</a>
				    	</span>
		    		</div>
			    	
			    	<table class="table table-striped">
			    		<thead class="table-primary">
				    		<tr>
				    			<th>NO</th>
				    			<th>title</th>
				    			<th>customerId</th>
				    			<%-- rental 가능 여부 필터링 --%>
				    			<th>
				    				<div class="dropdown">
										<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
											Rental
										</button>
										<ul class="dropdown-menu category">
								  			<li>
												<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&searchWord=${searchWord}&rentaled=${true}">
													렌탈 가능
												</a>						  			
								  			</li>
								  			<li>
												<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&searchWord=${searchWord}">
													렌탈중
												</a>						  			
								  			</li>
							  			</ul>
									</div>
				    			
				    			</th>
				    			<th>인벤토리 삭제</th>
				    		</tr>
			    		</thead>
			    		<c:forEach var="i" items="${inventoryList}">
			    			<tr>
			    				<td>${i.inventoryId}</td>
			    				<td>
			    					<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${i.filmId}">${i.title}</a>
			    				</td>
			    				<td>
			    					<c:if test="${i.customerId != null}">
			    						<a class="" href="${pageContext.request.contextPath}/on/customerOne?customerId=${c.customerId}">${i.customerId}</a>
			    					</c:if>
			    				</td>
			    				
			    				<td>
			    					<c:if test="${i.rentalDate == '-1'}">
			    						<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/addRental?inventoryId=${i.inventoryId}&storeId=${storeId}">대여</a>
			    					</c:if>
			    					<c:if test="${i.rentalDate != '-1'}">
			    						${i.rentalDate}
			    					</c:if>
			    				</td>
			    				<td>
			    					<a class="btn btn-danger" href="${pageContext.request.contextPath}/on/deleteInventory?inventoryId=${i.inventoryId}&storeId=${storeId}">삭제</a>
			    				</td>
			    			</tr>
			    		</c:forEach>
			    	</table>
			    	
			    	<ul class="pagination">
				    	<c:if test="${currentPage > 1 && lastPage != 0}">
				    		<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=1&rowPerPage=${rowPerPage}&storeId=${storeId}&searchWord=${searchWord}">처음으로</a>
					    	</li>
					    	<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&storeId=${storeId}&searchWord=${searchWord}">이전</a>
					    	</li>
				    	</c:if>
				    	<li class="page">
			    			[currentPage : ${currentPage} / ${lastPage}]
			    		</li>
			    		
				    	<c:if test="${currentPage != lastPage && lastPage != 0}">
				    		<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&storeId=${storeId}&searchWord=${searchWord}">다음</a>
					    	</li>
					    	<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=${lastPage}&rowPerPage=${rowPerPage}&storeId=${storeId}&searchWord=${searchWord}">마지막</a>
					    	</li>
				    	</c:if>
		    		</ul>
				</div>
				
		
			  </main>
			
			  <footer class="footer">
			  <div></div>
			  </footer>
		  </div>
    </body>
    <script>
)
    </script>
</html>








