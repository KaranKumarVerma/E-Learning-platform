  package com.eteachinggurukul.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/addCourse")
public class AddNewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	PreparedStatement stmt;
	
//	Data Member in the class
	
	String courseName;
	String courseDescription;
	
	public AddNewCourse(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tms", "root", "");
		}catch(Exception e){
			System.out.println("unable to connect with the datatbase");
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		courseName=(String)request.getParameter("course");
		courseDescription=(String)request.getParameter("description");
		RequestDispatcher dispatcher=null;
		try {
			stmt=con.prepareStatement("insert into course(course_name,course_description)values(?,?);");
			stmt.setString(1, courseName);
			stmt.setString(2, courseDescription);
	
			int count=stmt.executeUpdate();
			dispatcher =request.getRequestDispatcher("AddNewCourse.jsp");
			if(count>0) {
				request.setAttribute("status", "success");
				
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			dispatcher =request.getRequestDispatcher("AddNewCourse.jsp");
			request.setAttribute("status", "failed");
			dispatcher.forward(request, response);
			System.out.println("course can not be added");
		}
		
	}

}

