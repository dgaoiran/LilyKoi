<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LILYKOI - NEW ROLE</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
	
	<div class="container">
		<div class="navbar">
			<div class="ghost-2"></div>
			<div class="nav-links">
				<a href="/lilykoi/dashboard">Return to Dashboard</a>
			</div>
		</div>
		
		<div class="header">
			<h2>Add New Application</h2>
		</div>
		
		<div class="form">
			<div class="role">
				<div class="form-group">
					<form:form action="/lilykoi/createRole" method="post" modelAttribute="newRole">

						<h3>Enter the job details below:</h3>
						<br>
							<!-- modelAttribute must match ModelAttribute parameter -->
						<div class="form-group row">
				        	<form:label path="title" class="col-sm-2 col-form-label">Title:</form:label>
				        	<div class="col-sm-10">
				        		<form:input path="title"/>
				        		<br>
				        		<form:errors path="title" class="text-danger"/>
			        		</div>
				        </div>
				        
				        <div class="form-group row">
				        	<form:label path="companyName" class="col-sm-2 col-form-label">Company:</form:label>
				        	<div class="col-sm-10">
				        		<form:input path="companyName"/>
				        		<br>
				        		<form:errors path="companyName" class="text-danger"/>
			        		</div>
				        </div>
				        
				        <div class="form-group row">
				        	<form:label path="minSalary" class="col-sm-2 col-form-label">Min Salary:</form:label>
				        	<div class="col-sm-10">
				        		<form:input path="minSalary" type="number"/>
				        		<br>
				        		<form:errors path="minSalary" class="text-danger"/>
			        		</div>
				        </div>
				        
				        <div class="form-group row">
				        	<form:label path="maxSalary" class="col-sm-2 col-form-label">Max Salary:</form:label>
				        	<div class="col-sm-10">
				        		<form:input path="maxSalary" type="number"/>
				        		<br>
				        		<form:errors path="maxSalary" class="text-danger"/>
			        		</div>
				        </div>
				        <br>
		          		<div class="submit">
							<input type="submit" value="Submit">
						</div>
	     			</form:form> 
     			</div> <!-- form-group -->
			</div><!-- role -->
		</div><!-- form -->
	</div><!-- container -->
	

</body>
</html>