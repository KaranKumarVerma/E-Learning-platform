<% 

	RequestDispatcher dispatcher=request.getRequestDispatcher("Login.jsp");
	if(session.getAttribute("name")==null)
	{
		dispatcher.forward(request, response);
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lecture</title>
<link rel="stylesheet" href="style/style1.css">

</head>
<body>

<%
/* Java code to recevie attribute form the requested page */
String course=request.getParameter("course-name");
%>
<%@include file="dbConnection.jsp"%>
<%!String sql = "select *from lecture where course_name= ?";
   ResultSet rs;
   PreparedStatement myStmt;
%>

    <nav><a href="Index.jsp" id="back">Back</a></nav>
    <div id="wrapper">
        <div class="container">
            <div class="menu">
                
            <% 	
				try{
					myStmt = con.prepareStatement(sql);
					myStmt.setString(1, course);
					rs = myStmt.executeQuery();
					
					while (rs.next()) {
				%>
                <div class="lectureNav" onclick="updateLecture('<%=rs.getString("video_link")%>')"><%=rs.getString("lecture_name")%></div>              
            	 <% }
					}catch(Exception e) {
						System.out.println("Some problem to execute the query...." + e.getMessage());
					}
				%>
            </div>
            <div class="content">
                <iframe id="lecture"width="560" height="315" src="" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                <div id="heading"><%=course%></div>
            </div>

        </div>
    </div>
    <script>
        function updateLecture(emsrc){
            document.getElementById("lecture").src=emsrc;
        }
        
    </script>




</body>
</html>