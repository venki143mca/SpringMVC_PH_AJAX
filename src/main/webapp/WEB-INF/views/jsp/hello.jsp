<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Utility</title>
 
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

</head>
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
	<div class="navbar-header">
		<div class="header_one">Utility to send Passcode</div>
	</div>
  </div>
</nav>
 
<div class="jumbotron">
  <div class="container">
	<h1>${title}</h1>
	
	<p>
	<c:if test="${mail != null}">
   		<p class="text-center">Welcome ${firstName} </p>
		<input type="hidden" id="mail" value="${mail}"/> 
		<input type="hidden" id="firstName" value="${firstName}"/> 
		<input type="hidden" id="lastName" value="${lastName}"/> 
		<input type="hidden" id="userName" value="${userName}"/> 
   
        <p class="text-center">
        	 <input type="password" id="passCode" placeholder="Please Enter PassCode" autofocus> 
        	 <br/>
        </p>
       <p class="text-center">
         <input type="button"  id="Submit" name="Submit" class="btn btn-primary btn-md" value="GO" onclick="enroll()">
         </p>
         
	</c:if> 
	<c:if test="${mail == null}">
		Please add proper username at end of the url ex: http://localhost:8081/springmvc_new/c_srami
	</c:if>
	
     </p>
     <div id="output"> </div>
	</div>

</div>

  <hr>
  <footer>
	<p>&copy; Qualcomm 2016</p>
  </footer>
</div>
 
<spring:url value="/resources/core/js/hello.js" var="coreJs" />
<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <spring:url value="/resources/core/js/angular/angular.min.js" var="angularJs" />
 <spring:url value="/resources/core/js/angular_hello.js" var="angularHelloJs" />
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${angularJs}"></script>
<script src="${angularHelloJs}"></script>

 
</body>
</html>