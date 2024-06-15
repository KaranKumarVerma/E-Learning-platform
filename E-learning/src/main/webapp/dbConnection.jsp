<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%! Connection con=null;
	Statement stmt=null;
%>
<% 
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tms", "root", "");
	}catch(Exception e)
	{
		System.out.println("unable to connect with the datatbase");
	}

%>
