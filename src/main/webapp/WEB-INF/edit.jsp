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
<title>LILYKOI - EDIT PAGE</title>
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
		<br>
		<div class="subtitle">
			<div class="subRole">
				<h1>${thisStage.role.title}</h1>
				<h2>${thisStage.role.companyName}</h2>
			</div>
			<div class="subNumbers">
				<h2>Estimated Salary: <span id="estSal">$${thisStage.role.minSalary} - $${thisStage.role.maxSalary}</span></h2>
			</div>
		</div>
		<br>
		
		<div class="ghost"></div>
		<br>
<%--  		TESTING
		${thisStage.interviewerName}
		${thisStage.interviewDate} --%>
		<div class="form">
			<div class="dateBanner">
				<c:set var="stageDate" value="${thisStage.interviewDate}"/>
				<c:choose>
					<c:when test="${stageDate != null}">
						<h4><span id="isScheduled">CURRENTLY SCHEDULED ON</span> <fmt:formatDate pattern="MM-dd-yyyy" value="${stageDate}"/></h4>
					</c:when>
					<c:otherwise>
						<p id="isNotScheduled">NOT YET SCHEDULED</p>
					</c:otherwise>
				</c:choose>
			</div>
			<br>	
			
		<!-- currently only works for stages with 1 interviewer -->
			<!-- section per interviewer -->
			<div class="form-group">
				<form:form action="/lilykoi/editStage/${thisStage.id}/${thisStage.role.id}" method="POST" modelAttribute="editStage">
					<input type="hidden" name="_method" value="put">
					<div class="form-group row">
						<form:label path="interviewDate" class="col-sm-2 col-form-label"><p id="changeDate">Change date:</p></form:label>
 						<div class="col-sm-10">
							<form:input type="date" path="interviewDate" value="${scheduledDate}"/>
		        			<br>
		        			<form:errors path="interviewDate" class="text-danger"/>
 	        			</div>
        			</div>
        			
        						       	 
      	 		     <div class="form-group row">
      	 		     	<form:label path="stage" class="col-sm-2 col-form-label">Interview Stage:</form:label>
	      	 		     <div class="col-sm-10">
							<form:input path="stage" value="${thisStage.stage}"/>
							<br>
							<form:errors path="stage" class="text-danger"/>
						</div>
			       	 </div>
        			
        			<div class="form-group row">
						<form:label path="interviewerName" class="col-sm-2 col-form-label">You are meeting with:</form:label>
						<div class="col-sm-10">
							<form:input path="interviewerName" value="${thisStage.interviewerName}"/>
		        			<br>
		        			<form:errors path="interviewerName" class="text-danger"/>
	        			</div>
			       	 </div>
			       	 
        			<div class="form-group row">
						<form:label path="interviewerTitle" class="col-sm-2 col-form-label">Their role is:</form:label>
						<div class="col-sm-10">
							<form:input path="interviewerTitle" value="${thisStage.interviewerTitle}"/>
		        			<br>
		        			<form:errors path="interviewerTitle" class="text-danger"/>
	        			</div>
			       	 </div>
        			
					<div class="form-group row">
						<form:label path="pros" class="col-sm-2 col-form-label">List all Pros:</form:label>
						<form:input path="pros" value="${thisStage.pros}" />
	        			<br>
	        			<form:errors path="pros" class="text-danger"/>
		       		</div>
		       		<br>

		       		<div class="form-group row">
						<form:label path="cons" class="col-sm-2 col-form-label">List all Cons:</form:label>
						<form:input path="cons" name="cons" value="${thisStage.cons}"/>
	        			<br>
	        			<form:errors path="cons" class="text-danger"/>
		       		</div>
		       		<br>
		       		
		 		       		
		       		<!-- HIDDEN ROUTES -->
		       		<div class="form-group row">
						<form:errors path="user" class="error"/>
						<form:input type="hidden" path="user" value="${userId}" class="form-control"/>
					</div>
					
 					<div class="form-group row">
						<form:errors path="role" class="error"/>
						<form:input type="hidden" path="role" value="${thisStage.role.id}" class="form-control"/>
					</div>
					
					<div class="form-group row">
						<form:errors path="rating" class="error"/>
						<form:input type="hidden" path="rating" class="form-control"/>
					</div>

		       		
		       		<div class="submit">
						<input type="submit" value="Submit">
					</div>
				</form:form>
			</div>
		
			
		</div>
	</div><!-- container -->
</body>
</html>