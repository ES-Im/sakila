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
  	||| Logout |||
  	<hr>
  </li>
  <li class="sidenav__list-item">
  	<a class="nav-link" href="${pageContext.request.contextPath}/on/logout">LOGOUT</a>
  </li>
</ul>


