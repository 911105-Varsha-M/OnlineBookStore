<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id");
String bookname=request.getParameter("bookname");
String author=request.getParameter("author");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, bookname);
	ps.setString(3, author);
	ps.setString(4, category);
	ps.setString(5, price);
	ps.setString(6, active);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("addNewProduct.jsp?msg=Wrong");
	}
%>