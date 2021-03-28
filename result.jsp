<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Image Upload Acknowledgement</title>
</head>
<body>
<b> <a href="/project-servlet-mysql/uploadImage?page=home">Upload</a> | <a href="/project-servlet-mysql/uploadImage?page=view">View</a></b>
	<br />
	<br />
<%
String message = request.getParameter("message");
if(message != null){
	out.print(message);
}
%>
</body>
</html>