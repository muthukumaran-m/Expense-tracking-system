<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("id");
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "5555");
		statement = connection.createStatement();
		String sql = "select * from ets.expenses where id=" + id + ";";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body
	style="margin: 0% 10%; background-image: url(http://blog.hostbaby.com/wp-content/uploads/2013/07/scuffedstatic_blue_1920x1234.jpg); color: black;">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html"
					style="color: floralwhite;">Expense Tracking System</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="index.html">Home</a></li>
				<li><a href="addentry.html">New Entry</a></li>
				<li class="active"><a href="trace.html">Trace Expenses</a></li>
				<li><a href="about.html">About</a></li>
			</ul>
		</div>
	</nav>
	<h1 style="color: floralwhite;">Update Expense data</h1>
	<form class="form-horizontal" method="post" action="uptpro.jsp">
		<input type="hidden" name="id" value="<%=resultSet.getString("id")%>">
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="date">Date:</label> <input type="date" name="dt"
				style="width: 174px;" value="<%=resultSet.getString(1)%>">
		</div>
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="amt">Amount:</label> <input type="number" name="amt"
				value="<%=resultSet.getString(2)%>">
		</div>
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="desc">Description:</label> <input type="text" name="des"
				value="<%=resultSet.getString(3)%>">
		</div>
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="loc">Location:</label> <input type="text" name="loc"
				value="<%=resultSet.getString(4)%>">
		</div>
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="whom">To whome:</label> <input type="text" name="py"
				value="<%=resultSet.getString(5)%>">
		</div>
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="mode">To Mode Of Payment:</label> <input type="text" name="who"
				value="<%=resultSet.getString(6)%>">
		</div>
		<div class="form-group">
			<label style="color: floralwhite;" class="control-label col-sm-2"
				for="cato">Catagory:</label> <input type="text" name="cat"
				value="<%=resultSet.getString(7)%>">

		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button name="b1" style="margin: 1%;" type="submit"
					class="btn btn-default"">Update</button>
			</div>
		</div>
	</form>
	<%
		}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>