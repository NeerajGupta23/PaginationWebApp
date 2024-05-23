<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="./index.css">
</head>

<body>
	<h2>Pagination Application</h2>
	<form action="./pagination/first" method="post">
		<table align="center">
			<tr>
				<th>Enter Page Size</th>
				<td><input type="number" name="pageSize" placeholder="123"></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>

</html>