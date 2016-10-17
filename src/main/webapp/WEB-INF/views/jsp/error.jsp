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
	 Unauthorized request.
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