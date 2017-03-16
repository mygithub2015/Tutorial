<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions And Answers</title>
</head>
<body>

	<jsp:include page="Header.jsp" />

	<div id="contentsDiv" style="margin: 20px; text-align: center;">
		<c:url var="submitQns" value="showQuestionsAnswers" ></c:url>

		<form:form action="${submitQns}" modelAttribute="answerList" method="post">
		<fieldset style="display: inline-block; text-align; ">
			<legend>Questions And Answers</legend>
			<c:if test="${!empty questionList.listOfQnsAns}">
				<table>
					<c:forEach items="${questionList.listOfQnsAns}" var="qnsAns" varStatus="loop">
						<!-- <tr> -->
						<!-- 						<table style="border-width 1px;">-->
						
						<tr>
						<td colspan="2"> <input type="hidden" name="userAnswer[${loop.index}].questionId" value="${qnsAns.questionId}">
						</td>
						
						</tr>
						<tr>
							<td colspan="2"><b>${loop.count}. ${qnsAns.question}</b></td>

						</tr>
						<tr>
							<td colspan="2"><input type="radio"
								name="userAnswer[${loop.index}].answer" value="${qnsAns.optionA}">
								A. ${qnsAns.optionA}</td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio"
								name="userAnswer[${loop.index}].answer" value="${qnsAns.optionB}">
								B. ${qnsAns.optionB}</td>

						</tr>
						<tr>
							<td colspan="2"><input type="radio"
								name="userAnswer[${loop.index}].answer" value="${qnsAns.optionC}">
								C. ${qnsAns.optionC}</td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio"
								name="userAnswer[${loop.index}].answer" value="${qnsAns.optionD}">
								D. ${qnsAns.optionD}</td>

						</tr>
						<tr>
							<td colspan="2">Your Answer: <b><c:out value="${listOfUserAnswers[loop.index].answer}" /></b>
							</td>
						</tr>
						<tr>
							<td colspan="2">Correct Answer: <b>${qnsAns.answer}</b>
							</td>
						</tr>
						<tr>
							<td colspan="2">Explanations: ${qnsAns.explanations}</td>
						</tr>
						<tr>
							<td colspan="2">Related Links: ${qnsAns.relatedLinks}</td>
						</tr>

						<!-- </table> -->
						<!-- 	</tr> -->
					</c:forEach>
					<tr align="center">
						<td colspan="2"><input type="reset" value="reset" />
							&nbsp;&nbsp; <input type="submit" value="submit" /></td>
					</tr>
				</table>
			</c:if>
		</fieldset>
		</form:form>
		
	</div>
	<jsp:include page="Footer.jsp" />

</body>
</html>