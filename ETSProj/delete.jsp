<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.util.prefs.BackingStoreException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String id = request.getParameter("id");
	String bk = request.getParameter("bk");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "5555");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("DELETE FROM ets.expenses WHERE id=" + id + "");
		out.println("Data Deleted Successfully!");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
	request.getRequestDispatcher("traceAll.jsp").include(request, response);
%>