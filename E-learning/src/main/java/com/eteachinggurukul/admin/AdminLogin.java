package com.eteachinggurukul.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminValidation")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//Data Member
	String uname;
	String upass;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	uname=(String) request.getParameter("username");
    	upass=(String) request.getParameter("password");
    	HttpSession session=request.getSession();
    	RequestDispatcher dispatcher= null;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tms?useSSL=false","root","");
    		PreparedStatement pst= con.prepareStatement("select * from admin where uname= ? and pass= ?");
    		pst.setString(1, uname);
    		pst.setString(2, upass);
    		ResultSet rs=pst.executeQuery();
    		if(rs.next())
    		{
    			session.setAttribute("name", rs.getString("uname"));
    			dispatcher=request.getRequestDispatcher("Admin.jsp");
    		}
    		else {
    			request.setAttribute("status", "failed");
    			dispatcher=request.getRequestDispatcher("AdminLogin.jsp");
    		}
    		dispatcher.forward(request, response);
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    		System.out.println("there is some database problem...");
    	}
	}


}
