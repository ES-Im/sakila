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
		    <div>Add Actor</div>
		  </header>
		
		  <aside class="sidenav">
			  <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		  </aside>
		
		  <main class="main">
		    <div class="card">
		    	<!-- form dto = Actor instance + multipart-form-data -->
		    	<div class="" style="max-width:50%">
			    	<form id="formActor" method="post" action="${pageContext.request.contextPath}/on/addActor" enctype="multipart/form-data">
						<label class="form-label mt-1" >firstName</label>
						<input id="firstName" name="firstName" class="form-control" type="text">
						
						<label class="form-label mt-3">lastName</label>
						<input id="lastName" name="lastName" class="form-control" type="text">
						
						<span>${msg}</span>
						<label class="form-label mt-3">AddFile</label>
						<div class="d-flex flex-row flex-row-reverse">
							<button id="btnRemoveFile" type="button" class="btn btn-danger">RemoveFile</button>
							<button id="btnAddFile" type="button" class="btn btn-success">AddFile</button>	
						</div>
						<div id="fileDiv"></div>					
						
						<div class="d-flex flex-row flex-row-reverse">
							<button id="btnAddActor" type="button" class="btn btn-success mt-3">ADD</button>
						</div>
					</form>
				</div>
		    </div>
		  </main>
		
		  <footer class="footer"></footer>
		</div>
    </body>
    <script>
    	// form submit
		$('#btnAddActor').click(function() {
			if($('#firstName').val == '' || $('#lastName').val() == '') {
				alert("fill in required form");
				return;
			} else if($('.actorFile').length > 0 && $('.actorFile').last().val() == '') {
				alert('첨부되지 않은 파일이 있습니다');
			} else {
				$('#formActor').submit();
			}
			
		});
    
    	// add file btn
    	$('#btnAddFile').click(function() {
    		if($('.actorFile').last().val() == '') {
    			alert('empty File already exist.');
    		} else {
    			let html = '<input id="addFile" class="actorFile form-control" name="actorFile" type="file">';
	    		$('#fileDiv').append(html);
    		}
    	});
		
    	//delete file btn
    	$('#btnRemoveFile').click(function() {
    		if($('.actorFile').length == 0) {
    			alert('File doesn`t exist for being deleted.');
    		} else {
    			$('.actorFile').last().remove();
    		}
    	});
    	

    </script>
</html>