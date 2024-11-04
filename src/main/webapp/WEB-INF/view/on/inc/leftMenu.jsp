<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<title></title>
		<style>

		</style>
	</head>
	
	<body>
		<div class="container">

			  <li class="list-group-item">
				|||STAFF|||
			  </li>
   			  <li class="list-group-item">
				<a href="${pageContext.request.contextPath}/on/addStaff">ADD STAFF</a>
			  </li>
			  <li class="list-group-item">
  			  <li class="list-group-item">
				<a href="${pageContext.request.contextPath}/on/staffList">STAFF List</a>
			  </li>
				<a href="${pageContext.request.contextPath}/on/logout">[x]Inactivate STAFF</a>
			  </li>
			  <li class="list-group-item">
				<a href="${pageContext.request.contextPath}/on/logout">[x]Edit STAFF</a>
			  </li>


			  <li class="list-group-item">
				|||STORE|||
			  </li>
			  
			  
			  <li class="list-group-item">
				|||Comtomer|||
			  </li>
			 
			</ul>
		
		</div>
	</body>
</html>


