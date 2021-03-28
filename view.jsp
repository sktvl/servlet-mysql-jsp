<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Place your Image Id</title>
</head>
<body>
	<b>View | <a href="/project-servlet-mysql/uploadImage?page=home">Upload</a></b>
	<br />
	<br />
	<% 	String id = request.getParameter("id");  %>
	<form action="" method="get">
		<input type="text" name="id" required="required"
			placeholder="enter image id.." /><br /> <br /> <input
			type="submit" />
	</form>
	<%@page import="java.io.ByteArrayOutputStream"%>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.sql.Blob"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.util.Base64"%>

	<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "employees";
	String userId = "root";
	String password = "";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>

	<h2 align="center">
		<font><strong>Retrieve data from database in jsp</strong></font>
	</h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>id</b></td>
			<td><b>First Name</b></td>
			<td><b>Last Name</b></td>
			<td><b>Contact</b></td>
		</tr>
		<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM tbl_employee";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=resultSet.getString("id")%></td>
			<td><%=resultSet.getString("first_name")%></td>
			<td><%=resultSet.getString("last_name")%></td>
			<td><%=resultSet.getString("contact")%></td>

		</tr>

		<%
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	
</body>
</html>