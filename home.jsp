<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Image</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<b>Upload | <a href="/project-servlet-mysql/uploadImage?page=view">View</a></b>
	<br />
	<br />

	<form action="uploadImage" method="post" enctype="multipart/form-data">
		<table style="with: 80%">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" required="required" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" required="required" /></td>
			</tr>
			<tr>
				<td>Contact No</td>
				<td><input type="text" name="contact" required="required" /></td>
			</tr>
			<tr>
				<td>Image Upload (UPTO 16mb)</td>
				<td><input type="file" name="photo" required="required" /></td>
			</tr>
		</table>
		<br /> <input type="submit" />
	</form>
</body>
</html>