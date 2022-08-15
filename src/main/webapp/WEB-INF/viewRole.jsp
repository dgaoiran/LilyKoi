<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LILYKOI - VIEW ROLE</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
	
	<div class="container">
		<div class="navbar">
			<div class="destroy">

			</div>
			<div class="nav-links">
				<a href="/lilykoi/viewRole/${role.id}/addStage">Add Interview Stage</a>
				<a href="/lilykoi/dashboard">Return to Dashboard</a>
			</div>
		</div>
		<br>
	
		<div class="viewHeader">
			<h1>${role.title}</h1>
			<div class="subtitle">
				<h2>${role.companyName}</h2>
				<h4>Salary Range: $${role.minSalary} - $${role.maxSalary}</h4>
			</div>
		</div> <!-- header -->
		<br> 
		
		<div class="ghost"></div>
		
		<div class="prosCons">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Pros</th>
						<th>Cons</th>
						<th>Stage</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="thisStage" items="${role.interviewStages}">
<%-- 					<c:set var="stageDate" value="${thisStage.interviewDate}"/> --%>
						<tr>
							<c:choose>
								<c:when test="${thisStage.pros != null}">
									<td><c:out value="${thisStage.pros}"/></td>
								</c:when>										
								<c:otherwise>
									<td><p>None</p></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${thisStage.cons != null}">
									<td><c:out value="${thisStage.cons}"/></td>
								</c:when>										
								<c:otherwise>
									<td><p>None</p></td>
								</c:otherwise>
							</c:choose>
							<td><c:out value="${thisStage.stage}"/></td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		
		<div class="listStages">
			<h4>All interviews:</h4>
			<table class="table table-bordered">
					<thead>
						<tr>
							<th>Interviewer</th>
							<th>Stage</th>
							<th>Interview Date:</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="oneRole" items="${role.interviewStages}">
							<tr>
								<td><c:out value="${oneRole.interviewerName}"/></td>
								<td><c:out value="${oneRole.stage}"/></td>
								<td><fmt:formatDate pattern="MM-dd-yyyy" value="${oneRole.interviewDate}"/></td>
								<td><a href="/lilykoi/editStage/${oneRole.id}">Edit</a></td>
								<td>
								<form action="/destroyStage/${oneRole.id}" method="post">
									<input type="hidden" name="_method" value="delete">
				 					<input type="submit" value="Delete This Stage">
								</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
		</div>
		
		
		<%-- <div class="upcoming">
		
			<p>Upcoming</p>
			<!-- this will require a for loop and logic to show interviews with current date or completed -->
			<p>The next step of your interview is with
				<c:forEach var="thisStage" items="${role.interviewStages}">
					<tr>
						<td><c:out value="${thisStage.interviewerName}"/></td>
					</tr>
				</c:forEach>
			
			on <c:forEach var="thisStage" items="${role.interviewStages}">
					<tr>
						<td><c:out value="${thisStage.interviewDate}"/></td>
					</tr>
				</c:forEach>.</p>
			<p>${role.interviewStages}</p> [[TEST LOCATION]]
		</div> <!-- upcoming --> 
		--%>	

	</div> <!-- container -->

</body>
</html>