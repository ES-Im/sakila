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
			    			<a class="btn" href="${pageContext.request.contextPath}/on/customerList?rowPerPage=5">5Page</a>
			    			<a class="btn" href="${pageContext.request.contextPath}/on/customerList?rowPerPage=10">10Page</a>
				    	</span>
						<form class="p-1" id="formSearch" action="${pageContext.request.contextPath}/on/customerList" method="get" placeholder="Search Customer">
				    		<div class="form-control">
					    		<input class="form-input" name="searchWord" id="searchWord" type="text">
					    		<button  id="btnSearch">Search</button>
				    		</div>
				    	</form>
		    		</div>
			    	
			    	<table class="table table-striped">
			    		<thead class="table-primary">
				    		<tr>
				    			<th>CustomerNo</th>
				    			<th>Name</th>
				    			<th>storeId</th>
				    			<th>Address</th>
				    			<th>active</th>
				    			<th>CustomerOne</th>
				    		</tr>
			    		</thead>
			    		<c:forEach var="c" items="${customerList}">
			    			<tr>
			    				<td>${c.customerId}</td>
			    				<td>${c.firstName} ${c.lastName}</td>
			    				<td>${c.storeId}</td>
			    				<td>${c.country} ${c.city} ${c.address} (${c.district})</td>
			    				<td>${c.active}</td>
			    				<td>
			    					<a class="btn btn-primary" href="${pageContext.request.contextPath}/on/customerOne?customerId=${c.customerId}">이동</a>
			    				</td>
			    			</tr>
			    		</c:forEach>
			    	</table>
			    	
			    	<ul class="pagination">
				    	<c:if test="${page.currentPage - 10 > 0}">
				    		<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/customerList?currentPage=1&rowPerPage=${page.rowPerPage}">처음으로</a>
					    	</li>
					    	<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${page.currentPage-10}&rowPerPage=${page.rowPerPage}">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<li class="page">
			    			<c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
				    				<c:if test="${page.currentPage == num}">
				    					${num}&nbsp;
				    				</c:if>
				    				
				    				<c:if test="${page.currentPage != num}">
				    					<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${num}&rowPerPage=${page.rowPerPage}">
				    						${num}
				    					</a>
				    					&nbsp;
				    				</c:if>
			    			</c:forEach>
			    		</li>
			    		
				    	<c:if test="${page.currentPage <= page.lastPage-10 && page.lastPage != 0}">
				    		<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${page.currentPage+10}&rowPerPage=${page.rowPerPage}">다음</a>
					    	</li>
					    	<li class="page">
					    		<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${page.lastPage}&rowPerPage=${page.rowPerPage}">마지막</a>
					    	</li>
				    	</c:if>
		    		</ul>
		    		[currentPage : ${page.currentPage} / ${page.lastPage}]
				</div>
			  </main>
			
			  <footer class="footer">
			  <div></div>
			  </footer>
		  </div>
    </body>
    <script>
    	$('#btnSearch').onclick(function() {
    		if($('#searchWord').val() == '') {
    			alert('검색어를 입력하세요');
    			return;
    		}
    		$('#formSearch').submit();
    	})
    </script>
</html>