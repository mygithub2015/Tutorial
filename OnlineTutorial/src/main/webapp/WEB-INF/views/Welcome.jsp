<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	<c:if test="${message == 'This is default page!'}">
			<a id="login" href ="./login">Login</a>
		</c:if> 
	

	<sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			document.getElementById("login").style.visibility = "hidden";
		
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
		<%-- <c:if test="${pageContext.request.userPrincipal.name == null}">
			<a href ="/login">Login</a>
		</c:if> --%>


	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<c:url value="/admin" var="adminPageUrl" />
		<form action="${adminPageUrl}" method="get" id="adminPageForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	<script type="text/javascript">
		document.getElementById("login").style.visibility = "hidden";
		document.getElementById("adminPageForm").submit();
	</script>
	</sec:authorize>
</body>
</html>