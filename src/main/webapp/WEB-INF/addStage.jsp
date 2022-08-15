<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LILYKOI - ADD STAGE</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>

	<div class="container">
		<div class="navbar">
			<div class="ghost"></div>
			<div class="nav-links">
				<a href="/lilykoi/dashboard">Return to Dashboard</a>
			</div>
		</div>
		
		<div class="header">
			<h2>Add New Stage!</h2>
		</div>
		
<%-- 	TESTING	
		${role.companyName}
		${role.title}
		${role.id} 
		user id from session:
		${userId}
		--%>


		<div class="form">
			<div class="stage">
				<div class="form-group">
					<form:form action="/lilykoi/createStage/${role.id}" method="post" modelAttribute="newStage">

					<h3>Details:</h3>
					<br>
						<!-- modelAttribute must match ModelAttribute parameter -->
					<div class="form-group row">
					<form:label path="stage" class="col-sm-2 col-form-label">What is the next stage?</form:label>
						<div class="col-sm-10">
							<form:input path="stage"/>
		        			<br>
		        			<form:errors path="stage" class="text-danger"/>
	        			</div>
			       	 </div>
			       	 
			       	 <div class="form-group row">
						<form:label path="interviewerName" class="col-sm-2 col-form-label">Who is interviewing you?</form:label>
						<div class="col-sm-10">
							<form:input path="interviewerName"/>
		        			<br>
		        			<form:errors path="interviewerName" class="text-danger"/>
	        			</div>
			       	 </div>
			       	 
			       	 <div class="form-group row">
						<form:label path="interviewerTitle" class="col-sm-2 col-form-label">What is their role title?</form:label>
						<div class="col-sm-10">
							<form:input path="interviewerTitle"/>
		        			<br>
		        			<form:errors path="interviewerTitle" class="text-danger"/>
	        			</div>
			       	 </div>
			       	 			        			        
			       	 <div class="form-group row">
						<form:label path="interviewDate" class="col-sm-2 col-form-label">When is the interview?</form:label>
						<div class="col-sm-10">
							<form:input type="date" path="interviewDate"/>
		        			<br>
		        			<form:errors path="interviewDate" class="text-danger"/>
	        			</div>
        			</div>
        			
        			<div class="form-group row">
						<form:errors path="user" class="error"/>
						<form:input type="hidden" path="user" value="${userId}" class="form-control"/>
					</div>
					
					<div class="form-group row">
						<form:errors path="role" class="error"/>
						<form:input type="hidden" path="role" value="${role.id}" class="form-control"/>
					</div>
					
					<div class="form-group row">
						<form:errors path="rating" class="error"/>
						<form:input type="hidden" path="rating" class="form-control"/>
					</div>
        			
        			<div class="submit">
						<input type="submit" value="Submit">
					</div>
	     			</form:form> 
     			</div> <!-- form-group -->
			</div><!-- role -->
		</div><!-- form -->
	</div>

</body>
</html>