<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*"%>

<%
	String dt = null;
	dt = request.getParameter("edate");
	String amount = null;
	amount = request.getParameter("amount");
	String desr = null;
	desr = request.getParameter("descr");
	String loca = null;
	loca = request.getParameter("loca");
	String payee = null;
	payee = request.getParameter("payee");
	String paymode = null;
	paymode = request.getParameter("paymode");
	String catag = null;
	catag = request.getParameter("catag");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "5555");
		Statement st = con.createStatement();
		int i = st.executeUpdate("insert into ets.expenses values('" + dt + "','" + amount + "','" + desr
				+ "','" + loca + "','" + payee + "','" + paymode + "','" + catag + "','" + 0 + "')");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
	out.println("Data insrted Successfully!!");
	request.getRequestDispatcher("addentry.html").include(request, response);
%>
