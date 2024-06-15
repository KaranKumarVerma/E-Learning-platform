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

@WebServlet("/addLecture")
public class AddNewLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
	PreparedStatement stmt;
	
	//Data Member in the Class
	String courseName;
	String lectureName;
	String videoLink;
	String notesLink;
	String description;
	
    public AddNewLecture() {
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
		lectureName=(String)request.getParameter("lecture");
		videoLink=(String)request.getParameter("video");
		notesLink=(String)request.getParameter("notes");
		description=(String)request.getParameter("description");
		
		RequestDispatcher dispatcher=null;
		try {
			stmt=con.prepareStatement("insert into lecture(course_name,lecture_name,video_link,notes_link,lecture_description)values(?,?,?,?,?);");
			stmt.setString(1, courseName);
			stmt.setString(2, lectureName);
			stmt.setString(3, videoLink);
			stmt.setString(4, notesLink);
			stmt.setString(5, description);
	
			int count=stmt.executeUpdate();
			dispatcher =request.getRequestDispatcher("AddNewLecture.jsp");
			if(count>0) {
				request.setAttribute("status", "success");
				
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			dispatcher =request.getRequestDispatcher("AddNewlecture.jsp");
			request.setAttribute("status", "failed");
			dispatcher.forward(request, response);
			System.out.println("course can not be added");
		}
	}

}
