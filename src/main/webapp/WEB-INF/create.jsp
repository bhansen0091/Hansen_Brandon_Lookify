<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Song</title>
</head>
<body>
	<header>
		<h1>Create Song Form</h1>
		<a href="/dashboard">Dashboard</a>
	</header>
	<main>
		<form:form action="/songs/create" method="post" modelAttribute="song" >
			<p>
				<form:label path="title">Title:</form:label>
				<form:errors path="title"/>
				<form:input path="title"/>
			</p>
			
			<p>
				<form:label path="artist">Artist:</form:label>
				<form:errors path="artist"/>
				<form:input path="artist" />
			</p>
			
			<p>
				<form:label path="rating">Rating:</form:label>
				<form:errors path="rating" />
				<form:input type="number" path="rating"/>
			</p>
			<input type="submit"/>
		</form:form>
	
	</main>

</body>
</html>