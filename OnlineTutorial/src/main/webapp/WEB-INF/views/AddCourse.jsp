<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<html>
<head>
	<title>Course Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Course
</h1>

<c:url var="addAction" value="addCourse" ></c:url>

<form:form action="${addAction}" commandName="course">
<table>
	<c:if test="${!empty course.courseName}">
	<tr>
		<td>
			<form:label path="courseId">
				<spring:message text="Course ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="courseId" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="courseName">
				<spring:message text="Course Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="courseName" />
		</td> 
	</tr>
	
	<tr>
		<td colspan="2">
<%-- 			<c:if test="${!empty course.courseName}">
 --%>				<input type="submit"
					value="<spring:message text="Add Course"/>" />
<%-- 			</c:if>
 --%>		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Courses List</h3>
<c:if test="${!empty listCourses}">
	<table class="tg">
	<tr>
		<th width="80">Course ID</th>
		<th width="120">Course Name</th>
		
		
	</tr>
	<c:forEach items="${listCourses}" var="course">
		<tr>
			<td>${course.courseId}</td>
			<td>${course.courseName}</td>
			
			
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>