<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Song</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<h1>${sSong.title}</h1>
		<a href="/dashboard">Dashboard</a>
	</header>
	<main>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Title:</th>
					<th>Artist:</th>
					<th>Rating</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${ sSong.title }</td>
					<td>${ sSong.artist }</td>
					<td>${ sSong.rating }</td>
				</tr>
			</tbody>
		</table>

		<form action="/songs/${ id }/delete" method="post">
			<input type="hidden" name="_method" value="delete"> <input
				type="submit" value="Delete">
		</form>
	</main>
</body>
</html>