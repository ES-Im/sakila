<ul class="sidenav__list">
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/main">HOME</a>
  </li>

  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username}</a>
  </li>
  
  <li style="padding : 5% 5%">	
  	||| Staff |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/staffList">STAFF List</a>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/addStaff">ADD STAFF</a>
  </li>

  <li style="padding : 5% 5%">	
  	||| Actor |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/actorList">Actor List</a>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/addActor">ADD Actor</a>
  </li>
  
  <li style="padding : 5% 5%">	
  	||| Film |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/filmList">Film List</a>
  </li>
  <li class="sidenav__list-item"> <!-- 언어 리스트 & 언어 추가, 카테고리 리스트 & 카테고리 추가/삭제 포함 -->
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/addFilm">ADD FILM</a>
  </li>
  
  <li style="padding : 5% 5%">	
  	||| Shop |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/storeList">Store List</a>
  </li>
  <%--  
  		StoreMapper.selectStoreList() : return List<Map> Type : need Joining Store & Staff & Address 
  		StoreService.getStoreList() : MAP
  		Get/on/storeList - StoreController.storeList() - storeList.jsp
  
   --%>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/addStore">ADD Store</a>
  	<%-- 
		StoreMapper.insertStore() : Integer
		StoreService.addStore() : Integer

  		Get on/addStore - StaffMapper.selectStaffList - StoreController.addStore() add {staffList  & searchAddress} Model - addStore.jsp
  						- AdressMapper.select(searchAddress)   
		Post on/addStore - StaffController.addStore(Store) -
		
			
  		
  	--%>
  </li>
  
  <li style="padding : 5% 5%">	
  	||| STATICSTICS |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="">---</a>
  </li>
  
  <li style="padding : 5% 5%">	
  	||| Logout |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/logout">LOGOUT</a>
  </li>

</ul>


