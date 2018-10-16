<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306";%>
<%!String user = "root";%>
<%!String psw = "5555";%>
<%
	String id = request.getParameter("id");
	String date = request.getParameter("dt");
	String amt = request.getParameter("amt");
	String des = request.getParameter("des");
	String loc = request.getParameter("loc");
	String py = request.getParameter("py");
	String who = request.getParameter("who");
	String cat = request.getParameter("cat");

	if (id != null) {
		Connection con = null;
		PreparedStatement ps = null;
		int personID = Integer.parseInt(id);
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, psw);
			String sql = "Update ets.expenses set entrydate=?,amount=?,description=?,location=?,payee=?,mode=?,catagory=?,id="
					+ id + " where id=" + id + "";
			ps = con.prepareStatement(sql);
			ps.setString(1, date);
			ps.setString(2, amt);
			ps.setString(3, des);
			ps.setString(4, loc);
			ps.setString(5, py);
			ps.setString(6, who);
			ps.setString(7, cat);
			int i = ps.executeUpdate();
			if (i > 0) {
				out.print("Record Updated Successfully");
			} else {
				out.print("There is a problem in updating Record.");
			}
		} catch (SQLException sql) {
			request.setAttribute("error", sql);
			out.println(sql);
		}
		request.getRequestDispatcher("traceAll.jsp").include(request, response);
	}
%>