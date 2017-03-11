<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#header {
	background: #6699ff;
	color: white;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 1px;
	margin-right: 20px;
}

.subheader1 {
	border-radius: 1px;
	border-width: 1px;
}

#logo {
	width: 237px;
}

#menuDiv {
	margin-top: 8px;
	margin-bottom: 8px;
	margin-left: 885px;
	margin-right: 20px;
	display: table;
	float: right;
}

/*for menu*/
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
	display: table-row;
}

li {
	float: left;
	border-right: 1px solid #bbb;
}

li:last-child {
	border-right: none;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li

 

a


:hover


:not

 

(
.active

 

)
{
background-color


:

 

#111


;
}
.active {
	background-color: #4CAF50;
}
</style>
<script src=".resources/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<div id="header">
			<table style="width: 1528px; height: 184px">

				<tr>
					<td><img id="logo" alt="image"
						src="./resources/images/skillfunda.jpg"
						style="width: 243px; height: 144px"></td>

					<td style="width: 1291px;">
						<h1>Online Tutorial - Must for beginners</h1>
					</td>
				</tr>
			</table>
		</div>

		<div>
			<div id="menuDiv">
				<ul style="">

					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a class="active" href="#home">Home</a></li>
						<li><a class="adminLink" href="addCourse">Add a Course</a></li>
						<li><a class="adminLink" href="AddQuestionsAnswers">Add
								Qns & Ans</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<li><a class="active" href="#home">Home</a></li>
						<li><a class="userLink" href="showQuestionsAnswers">Show
								Qns & Ans</a></li>
						<li><a class="userLink" href="#contactUs">Contact Us</a></li>
					</sec:authorize>

				</ul>
			</div>


		</div>
		 <div id ="loginDiv" style="text-align:right; clear:both;">
<c:if test="${pageContext.request.userPrincipal.name == null}">
			<a id="login" href ="./login">Login</a>
		</c:if> 
	
 </div>
 <div style="text-align: right; clear:both; ">
 
 <c:if test="${pageContext.request.userPrincipal.name != null}">
			
				User : <b><i>${pageContext.request.userPrincipal.name} </i></b> | <a
					href="javascript:formSubmit()"> Logout</a>
			
			</c:if>
<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
					
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
 </div>

	</header>
</body>
</html>