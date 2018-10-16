<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Trace | Expense Tracking System</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body
	style="margin: 0% 10%; background-image: url(http://blog.hostbaby.com/wp-content/uploads/2013/07/scuffedstatic_blue_1920x1234.jpg); color: floralwhite;">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html"
					style="color: floralwhite;">Expense Tracking System</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="index.html">Home</a></li>
				<li><a href="process.jsp">New Entry</a></li>
				<li class="active"><a href="trace.html">Trace Expenses</a></li>
				<li><a href="about.html">About</a></li>
			</ul>
		</div>
	</nav>
	<h1>Retrieve All data</h1>
	<table border="5" class="table">
		<tr>
			<th scope="col">Date</th>
			<th scope="col">Amount</th>
			<th scope="col">Description</th>
			<th scope="col">Location</th>
			<th scope="col">To Whome</th>
			<th scope="col">Mode</th>
			<th scope="col">Catagory</th>
			<th scope="col">Action</th>

		</tr>
		<tbody>
			<%
				try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "5555");
						Statement st = con.createStatement();
						String sql = "select * from ets.expenses order by id desc";
					ResultSet resultSet = st.executeQuery(sql);
					while (resultSet.next()) {
			%>
			<tr>
				<td><%=resultSet.getString(1)%></td>
				<td><%=resultSet.getDouble(2)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td><%=resultSet.getString(4)%></td>
				<td><%=resultSet.getString(5)%></td>
				<td><%=resultSet.getString(6)%></td>
				<td><%=resultSet.getString(7)%></td>
				<td><a href="delete.jsp?id=<%=resultSet.getInt("id")%>"><button
							type="button" class="delete">Delete</button></a> <a
					href="edit.jsp?id=<%=resultSet.getInt("id")%>"><button
							type="button" class="edit">Edit</button></a></td>
			</tr>
			<%
				}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</tbody>
	</table>
</body>
</html>