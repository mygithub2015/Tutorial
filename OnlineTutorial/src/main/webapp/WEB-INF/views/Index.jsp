<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>

<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
    border-right:1px solid #bbb;
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

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
</style>
</head>
<body>
<div id="menuDiv">
<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="addCourse">Add a Course</a></li>
  <li><a href="AddQuestionsAnswers">Add Qns & Ans</a></li>
  <li><a href="showQuestionsAnswers">Show Qns & Ans</a></li>
  <li><a href="#contactUs">Contact Us</a></li>	
</ul>
</div>
</body>
</html>
