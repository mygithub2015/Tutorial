<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3> Your answers are as follows...</h3>
<div>
		<c:forEach items="${listOfUserAnswers}" var="userAns" >
		Question id: <c:out value="${userAns.questionId}"/><br/>
		Answer: <c:out value="${userAns.answer}"/><br/>
		</c:forEach>
		</div>
</body>
</html>