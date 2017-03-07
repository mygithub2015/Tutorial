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
<div style="margin:20px;">
	<fieldset>
		<legend>Questions And Answers</legend>
		<c:if test="${!empty listOfQnsAns}">
			<table>
				<c:forEach items="${listOfQnsAns}" var="qnsAns">
					<tr>
						<table style="border-width 1px;">
							<tr>
								<td><b>${qnsAns.question}</b></td>
								
							</tr>
							<tr>
								<td>
								<input type="radio" name="optionsA" value="${qnsAns.optionA}"> A. ${qnsAns.optionA}
								 </td>
							</tr>
							<tr>
								<td>
								<input type="radio" name="optionsB" value="${qnsAns.optionB}">
								B. ${qnsAns.optionB}</td>
								
							</tr>
							<tr>
								<td>
								<input type="radio" name="optionsC" value="${qnsAns.optionC}">
								C. ${qnsAns.optionC}
								</td>
							</tr>
							<tr>
								<td><input type="radio" name="optionsD"
									value="${qnsAns.optionD}"> D. ${qnsAns.optionD}</td>

							</tr>
							<tr>
							<td colspan="2"> Answer: <b>${qnsAns.answer}</b> </td>
							</tr>
							<tr>
							<td colspan="2"> Explanations: ${qnsAns.explanations} </td>
							</tr>
							<tr>
							<td colspan="2"> Related Links: ${qnsAns.relatedLinks} </td>
							</tr>
							
						</table>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</fieldset>
	</div>
 <jsp:include page="Footer.jsp" />

</body>
</html>