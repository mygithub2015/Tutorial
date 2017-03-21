<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions And Answers</title>
<script src=".resources/js/jquery-3.1.1.min.js">
	
</script>
<script>
	var tim;
	var min = '2';//'${sessionScope.min}';
	var sec = '00';//'${sessionScope.sec}';
	var f = new Date();

	function examTimer() {
		if (parseInt(sec) > 0) {

			document.getElementById("showtime").innerHTML = "<b>Time Remaining</b>:<b>"
					+ min + "</b> Minutes ,<b>" + sec + "</b> Seconds";
			sec = parseInt(sec) - 1;
			tim = setTimeout("examTimer()", 1000);
		} else {

			if (parseInt(min) == 0 && parseInt(sec) == 0) {
				document.getElementById("showtime").innerHTML = "<b>Time Remaining</b>: <b>"
						+ min + "</b> Minutes ,<b>" + sec + "</b> Seconds";
				alert("Time Up");
				//   document.questionForm.minute.value=0;
				// document.questionForm.second.value=0;
				document.questionForm.submit();

			}

			if (parseInt(sec) == 0) {
				document.getElementById("showtime").innerHTML = "<b>Time Remaining</b>: <b>"
						+ min + " </b>Minutes ,<b>" + sec + "</b> Seconds";
				min = parseInt(min) - 1;
				sec = 59;
				tim = setTimeout("examTimer()", 1000);
			}

		}
	}
</script>
</head>
<body onload="">

	<jsp:include page="Header.jsp" />


	<div style="text-align: right; margin:20px;">	<c:if test="${empty listOfUserAnswers}">
			<span  id="showtime"></span>
			<script>
			examTimer();
			</script>
		</c:if>
	</div>
	<div id="contentsDiv" style="margin: 20px; text-align: center;">
		<c:url var="submitQns" value="showQuestionsAnswers"></c:url>
		

		<form:form action="${submitQns}" modelAttribute="answerList"
			method="post" id="questionForm" name="questionForm">
			<fieldset style="display: inline-block;">
				<legend>Questions And Answers</legend>

				<c:if test="${!empty questionList.listOfQnsAns}">


					<table>
						<c:forEach items="${questionList.listOfQnsAns}" var="qnsAns"
							varStatus="loop">
							<c:set var="ans" scope="session"
								value="${listOfUserAnswers[loop.index].answer}" />
							<%-- <c:out value="${ans}" /> --%>
							<!-- <tr> -->
							<!-- 						<table style="border-width 1px;">-->

							<c:choose>
								<c:when test="${ans eq 'A'}">
									<tr>
										<td colspan="2"><input type="hidden"
											name="userAnswer[${loop.index}].questionId"
											value="${qnsAns.questionId}"></td>

									</tr>
									<tr>
										<td colspan="2"><b>${loop.count}. ${qnsAns.question}</b></td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="A" checked>
											A. ${qnsAns.optionA}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="B"> B.
											${qnsAns.optionB}</td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="C"> C.
											${qnsAns.optionC}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="D"> D.
											${qnsAns.optionD}</td>

									</tr>
								</c:when>
								<c:when test="${ans eq 'B'}">
									<tr>
										<td colspan="2"><input type="hidden"
											name="userAnswer[${loop.index}].questionId"
											value="${qnsAns.questionId}"></td>

									</tr>
									<tr>
										<td colspan="2"><b>${loop.count}. ${qnsAns.question}</b></td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="A"> A.
											${qnsAns.optionA}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="B" checked>
											B. ${qnsAns.optionB}</td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="C"> C.
											${qnsAns.optionC}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="D"> D.
											${qnsAns.optionD}</td>

									</tr>
								</c:when>
								<c:when test="${ans eq 'C'}">
									<tr>
										<td colspan="2"><input type="hidden"
											name="userAnswer[${loop.index}].questionId"
											value="${qnsAns.questionId}"></td>

									</tr>
									<tr>
										<td colspan="2"><b>${loop.count}. ${qnsAns.question}</b></td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="A"> A.
											${qnsAns.optionA}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="B"> B.
											${qnsAns.optionB}</td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="C" checked>
											C. ${qnsAns.optionC}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="D"> D.
											${qnsAns.optionD}</td>

									</tr>
								</c:when>
								<c:when test="${ans eq 'D'}">
									<tr>
										<td colspan="2"><input type="hidden"
											name="userAnswer[${loop.index}].questionId"
											value="${qnsAns.questionId}"></td>

									</tr>
									<tr>
										<td colspan="2"><b>${loop.count}. ${qnsAns.question}</b></td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="A"> A.
											${qnsAns.optionA}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="B"> B.
											${qnsAns.optionB}</td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="C"> C.
											${qnsAns.optionC}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="D" checked>
											D. ${qnsAns.optionD}</td>

									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2"><input type="hidden"
											name="userAnswer[${loop.index}].questionId"
											value="${qnsAns.questionId}"></td>

									</tr>
									<tr>
										<td colspan="2"><b>${loop.count}. ${qnsAns.question}</b></td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="A"> A.
											${qnsAns.optionA}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="B"> B.
											${qnsAns.optionB}</td>

									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="C"> C.
											${qnsAns.optionC}</td>
									</tr>
									<tr>
										<td colspan="2"><input type="radio"
											name="userAnswer[${loop.index}].answer" value="D"> D.
											${qnsAns.optionD}</td>

									</tr>
								</c:otherwise>
							</c:choose>
							<c:if test="${ans != null}">
								<tr>
									<td colspan="2">Your Answer: <b><c:out value="${ans}" /></b>
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
									<td colspan="2">Related Links: ${qnsAns.relatedLinks} <%-- 									<c:out value="${(ans eq 'A')?'A':(ans eq 'B')?'B':(ans eq 'C')?'C':'D' }"/>   --%>
									</td>
								</tr>
							</c:if>
							<!-- </table> -->
							<!-- 	</tr> -->
						</c:forEach>
						<tr align="center">
							<td colspan="2"><input type="reset" value="reset" />
								&nbsp;&nbsp; <input type="submit" value="submit" /></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${empty  questionList.listOfQnsAns}">
					<h4 style="color: red;">Sorry! no questions have been added
						yet. We promise to do it very soon...</h4>
				</c:if>
			</fieldset>
		</form:form>

	</div>

	<jsp:include page="Footer.jsp" />

</body>
</html>