package com.eteachinggurukul.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String uname;
	String uemail;
	String upass;
	String uphone;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		uname=request.getParameter("name");
		uemail=request.getParameter("email");
		upass=request.getParameter("pass");
		uphone=request.getParameter("contact");
		RequestDispatcher dispatcher=null;
		Connection conn=null;
		PrintWriter pw=response.getWriter();
		pw.println("name:"+uname+" email:"+uemail+" pass"+upass+" contact"+uphone);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tms?useSSL=false", "root", "");
			String sql="insert into tmsuser (uname,email,pass,phone)values(?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upass);
			pst.setString(4, uphone);
			int rowCount=pst.executeUpdate();
			dispatcher =request.getRequestDispatcher("Registration.jsp");
			if(rowCount>0) {
				request.setAttribute("status", "success");
				
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);}
		catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
