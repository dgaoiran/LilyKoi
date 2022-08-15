<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LILYKOI - DASHBOARD</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>

	<div class="container">
		<div class="navbar">
				<div class="ghost-2"></div>
				<a href="/logout">logout</a>
		</div> <!-- navbar -->	
		<div class="header">
				<h1>Welcome, <c:out value="${loggedInUser.firstName}"/>!</h1>
		</div>
		
		<div class="ghost"></div>
		
		<div class="bio">
			<h2>My Desired Salary:
			<br>
			<span id="desiredSal">$<c:out value="${loggedInUser.desiredSalary}"/>k</span><span id="yearly"> <b>per year</b></span>
			</h2>
			<div class="navTools">
				<input id="start" type="button" onclick="location.href='/lilykoi/newRole';" value="Add New Application">
			</div>
		</div>

		<div class="ghost"></div>
		

<%-- 		<div class="applied">
			<h3>Submitted Applications</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Company</th>
						<th>Role Title</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="thisUser" value="${loggedInUser}"/>
					<c:forEach var="applied" items="${interviews}">
						<tr>
							<c:if test="${applied.user.id == thisUser.id}">
								<td><c:out value="${applied.role.companyName}"/></td>
								<td><a href="/lilykoi/viewRole/${applied.role.id}"><c:out value="${applied.role.title}"/></a></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			 --%>
			
			<div class="applied">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Company</th>
						<th>Role Title</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="applied" items="${roles}">
						<tr>
							<td><c:out value="${applied.companyName}"/></td>
							<td><a href="/lilykoi/viewRole/${applied.id}"><c:out value="${applied.title}"/></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>		
	</div><!-- container -->



</body>
</html>