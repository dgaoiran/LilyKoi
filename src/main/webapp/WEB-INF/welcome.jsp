<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LILYKOI - LOGIN AND REGISTRATION</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
	
	<div class="container">
		<div class="header">
			<h1>LilyKoi</h1>
		</div>
		
		<div class="form">
			<div class="login">
				<form:form action="/login" method="post" modelAttribute="newLogin">
				<div class="form-group">
					<h4>Login</h4>
						<!-- modelAttribute must match ModelAttribute parameter -->
					<div class="form-group row">
			        	<form:label path="email" class="col-sm-2 col-form-label">Email:</form:label>
			        	<div class="col-sm-10">
			        		<form:input path="email"/>
			        		<br>
			        		<form:errors path="email" class="text-danger"/>
		        		</div>
			        </div>
      			</div> <!-- form-group row -->

				<div class="form-group row">
		        	<form:label path="password" class="col-sm-2 col-form-label">Password:</form:label>
		        	<div class="col-sm-10">
		        		<form:input path="password" type="password"/>
		        		<br>
		        		<form:errors path="email" class="text-danger"/>
	        		</div>
		        </div>

    			<div class="submit">
					<input type="submit" value="Login">
				</div>
				</form:form> 
			</div><!-- login -->
			
			<br>
			
			<div class="registration">
			<form:form action="/register" method="post" modelAttribute="newUser">
				<div class="form-group">
					<h4>Register</h4>
					<div class="form-group row">
			        	<form:label path="firstName" class="col-sm-2 col-form-label">First Name:</form:label>
		        		<div class="col-sm-10">
			        		<form:input path="firstName"/>
			        		<br>
		        		<form:errors path="firstName" class="text-danger"/>
	        			</div>
        			</div>
        			
    				<div class="form-group row">
			        	<form:label path="lastName" class="col-sm-2 col-form-label">Last Name:</form:label>
		        		<div class="col-sm-10">
			        		<form:input path="lastName"/>
			        		<br>
		        		<form:errors path="lastName" class="text-danger"/>
	        			</div>
        			</div>

					<div class="form-group row">
			        	<form:label path="email" class="col-sm-2 col-form-label">Email:</form:label>
			        	<div class="col-sm-10">
			        		<form:input path="email" type="email"/>
			        		<br>
			        		<form:errors path="email" class="text-danger"/>
	        			</div>
        			</div>
        			
        			<div class="form-group row">
			        	<form:label path="desiredSalary" class="col-sm-2 col-form-label">Salary Goal:</form:label>
		        		<div class="col-sm-10">
			        		<form:input path="desiredSalary" type="number"/>
			        		<br>
		        		<form:errors path="desiredSalary" class="text-danger"/>
	        			</div>
        			</div>

					<div class="form-group row">
			        	<form:label path="password" class="col-sm-2 col-form-label">Password:</form:label>
			       		<div class="col-sm-10">
			        		<form:input path="password" type="password"/>
			        		<br>
			        		<form:errors path="password" class="text-danger"/>
	        			</div>
        			</div>

					<div class="form-group row">
			        	<form:label path="confirm" class="col-sm-2 col-form-label">Confirm Password:</form:label>
		        		<div class="col-sm-10">
			        		<form:input path="confirm" type="password"/>
			        		<br>
			        		<form:errors path="confirm" class="text-danger"/>
	        			</div>
        			</div>

   					<div class="submit">
						<input type="submit" value="Register">
					</div>
				</div>
				</form:form>	
			</div><!-- registration -->
		</div> <!-- form -->

	</div> <!-- container -->

</body>
</html>