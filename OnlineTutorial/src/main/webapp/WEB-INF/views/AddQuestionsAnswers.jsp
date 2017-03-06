<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Questions And Answers</title>
</head>
<body>
	<h2>
		Add Questions And Answers
	</h2>
	<c:url var="addAction" value="/AddQuestionsAnswers"></c:url>
	<div id="questionAnswerDiv">
		<fieldset>
			<legend>Questions And Answers</legend>
			<form:form action="${addAction}" commandName="questionsAnswers">
				<table>
					<tr>
						<td><form:label path="courseId">
								<spring:message text="Course ID:" />
							</form:label></td>
						<td><form:input path="courseId" size="8" /></td>
					</tr>

					<tr>
						<td><form:label path="question">
								<spring:message text="question:" />
							</form:label></td>
						<td><form:input path="question" size="40" /></td>
					</tr>

					<!-- options -->
					<tr>
						<td><form:label path="optionA">
								<spring:message text="option A:" />
							</form:label></td>
						<td><form:input path="optionA" size="20" /></td>
					</tr>
					<tr>
						<td><form:label path="optionB">
								<spring:message text="option B:" />
							</form:label></td>
						<td><form:input path="optionB" size="20" /></td>
					</tr>
					<tr>
						<td><form:label path="optionC">
								<spring:message text="option C:" />
							</form:label></td>
						<td><form:input path="optionC" size="20" /></td>
					</tr>
					<tr>
						<td><form:label path="optionD">
								<spring:message text="option D:" />
							</form:label></td>
						<td><form:input path="optionD" size="20" /></td>
					</tr>

					<tr>
						<td><form:label path="answer">
								<spring:message text="answer" />
							</form:label></td>
						<td><form:input path="answer" size="8" /></td>
					</tr>

					<tr>
						<td><form:label path="explanations">
								<spring:message text="explanations" />
							</form:label></td>
						<td><form:input path="explanations" size="40" /></td>
					</tr>

					<tr>
						<td><form:label path="relatedLinks">
								<spring:message text="relatedLinks" />
							</form:label></td>
						<td><form:input path="relatedLinks" size="40" /></td>
					</tr>

					<tr>
						<td colspan="2" align="right"><input type="submit"
							value="<spring:message text="Add Qns Ans"/>" /></td>
					</tr>

				</table>
			</form:form>
		</fieldset>
	</div>

</body>
</html>