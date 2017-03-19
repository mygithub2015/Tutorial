<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Select Course</title>



<script src="./resources/js/jquery-3.1.1.min.js">
	
</script>
</head>
<body>

	<div id="courseSelDiv">
		<form:form  id="courseForm" action ="getQuestionsAsPerCourse" method="get" commandName="course">
			<%-- <form:select  path="courseId">
				<form:option value="" label="Select a Course" />
				<form:options items="${listCourses}" /> 
				<form:option value="1">Java</form:option>
				<form:option value="2">Oracle</form:option>
				<form:option value="3">JavaScript</form:option>
				
			</form:select> --%>
			<select name="courseId">
			<option value="1">Java</option>
			<option value="2">Oracle</option>
			<option value="3">JavaScript</option>
			</select>
<!-- 			<input name="courseId">
 -->			<input type="submit"/>
		</form:form>
	</div>

	
</body>
</html>