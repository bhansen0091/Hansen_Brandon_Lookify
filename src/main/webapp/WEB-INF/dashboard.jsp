<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Lookify</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>
	<header>
		<h1>Welcome to Lookify</h1>
		<div>
			<a href="/songs/new">Add Song</a>		
		</div>
		<div>
			<form action="/search" method="post">
				<div class="form-group">
					<label class="form-control">
						<input name="artist" type="text" />
						<input type="submit" value="Search Artist"/>
					</label>
				</div>
			</form>
		</div>
	</header>
	<main>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Title</th>
					<th>Artist</th>
					<th>rating</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${ allSongs }' var='song'>
					<tr>
						<td>
							<h5>
								<a href="/songs/${song.id}">${ song.title }</a> 
							</h5>
						</td>
						<td>
							<h5>${song.artist}</h5>
						</td>
						<td>
							<h5>${song.rating}</h5>
						</td>
						<td><a href="/songs/${song.id}/delete"> Delete </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		
	</main>
</body>

</html>