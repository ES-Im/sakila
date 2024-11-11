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
	  <main class="main">
	    <div class="card">
			<h1>ADD LANGUAGE</h1>
			<hr>
			<div id="result"></div>
			<form id="addForm" method="post" action="${pageContext.request.contextPath}/on/addLanguage">
				<input name="name" id="name" type="text" placeholder="Language">
				<input id="result" value="${result}" type="hidden">
				
				<button class="btn btn-primary" id="addBtn" type="button">등록</button>
			</form>  
			<hr>
			<h3>현재 등록된 언어</h3>
			<hr>
			<table>
				<tr>
					<th>NO</th>
					<th>Name</th>
				</tr>
				<c:forEach var="l" items="${list}">
					<tr>
						<td>${l.languageId}</td>
						<td>${l.name}</td>
					</tr>
				</c:forEach>
			</table>
	    </div>
	  </main>
    </body>
    <script>

    	<%-- add가 성공해도 창이 닫히지 않는 이슈 : [원인]
    		window.open으로 연 창만 close()가 가능한데, 중간에 리다이렉트 과정이 있어 window.close()를 사용하지 못함 --%>
    	$("#addBtn").click(function() {
    		if($("#name").val() == "") {
    			alert("값을 입력하세요.")
    			return;
    		}
    		
    		$('#addForm').submit();
    		
    		if($("#result").val() == "fail") {
    			$("#result").text('등록에 실패하였습니다.');
    			return;
    		}
    		console.log($("#result").val());
    		if($("#result").val() == "success") {
				window.close();    			
    		}
    	});
    </script>
</html>