<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<style>
		  .fakeimg {
		    height: 200px;
		    background: #aaa;
		  }
		 </style>
	</head>
	<body>
		<!-- title & session info -->
		<div class="p-5 bg-primary text-white text-center">
		  <h1>Home</h1>
		  <p></p> 
		</div>
		
		<!-- upside nav bar -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		  <c:import url="/WEB-INF/view/on/inc/upsideMenu.jsp"></c:import>
		</nav>
		
		<div class="row">
        	<div class="col-sm-2">
              <h3 class="row">Some Links</h3>
              <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <c:import url="/WEB-INF/view/on/inc/upsideMenu.jsp"></c:import>
              </nav>
			</div>

		    <div class="col-sm-8">
		      <h2>TITLE HEADING</h2>
		     
		
		      <h2 class="mt-5">TITLE HEADING</h2>
		      <h5>Title description, Sep 2, 2020</h5>
		      <div class="fakeimg">Fake Image</div>
		      <p>Some text..</p>
		      <p>Sunt </p>
		    </div>
		  </div>

		
		<div class="mt-5 p-4 bg-dark text-white text-center">
		  <p>Footer</p>
		</div>
		
	</body>
</html>
