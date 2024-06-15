<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
	
	RequestDispatcher dispatcher=request.getRequestDispatcher("AdminLogin.jsp");
	if(session.getAttribute("name")==null)
	{
		dispatcher.forward(request, response);
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Lecture</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="style/style.css">
</head>

<body>
	<!--//including dbConnection.jsp file so that we can use database connectivity and perform some operation on database-->
	<%@include file="dbConnection.jsp"%>
	<%!String sql="select course_name from course" ; 
	   ResultSet rs;
	%>
	<% 
		try{ 
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
		%>

	<input type="hidden" id="status" value=<%=request.getAttribute("status")%>>
	<div class="container-fluid">
		<!--including template.jsp file that contain navbar and sidebar code  -->
		<%@include file="section/template.jsp"%>
		<main>
			<div class="container bg-gradient">
				<!-- form for adding new course to the page -->

				<form action="addLecture" method="post">
					<!-- Option Type Input (Dropdown) for Course Type -->
					<div class="mb-3">
						<!-- Text Input for Course Name -->
						<label for="course-type" class="form-label">Select Course Type:</label>
						<select id="course-type" class="custom-select" name="course" class="form-control" required>
						<% while (rs.next()) { %>
							<option value="<%=rs.getString(1)%>">
								<%=rs.getString(1)%>
							</option>
							<% } %>
						</select>

						<%}catch(Exception e){ 
							System.out.println("Unable to fetch Course Details"); 
							}
						%> 

					</div>

					<!-- Lecture name -->
					<div class="mb-3">
						<label for="lecture-name" class="form-label">Lecture Name:</label>
						<input type="text" id="course-name" name="lecture" class="form-control" placeholder="Enter Lecture Title" required>
					</div>

					<!--Lecture Video Link -->
					<div class="mb-3">
						<label for="course-code" class="form-label">Lecture Video Link:</label> 
						<input type="text" id="course-code" name="video" class="form-control" placeholder="Enter Lecture Video Link" required>
					</div>

					<!--Lecture Notes Link: -->
					<div class="mb-3">
						<label for="student-name" class="form-label">Lecture Notes Link:</label>
						<input type="text" id="student-name" name="notes" class="form-control" placeholder="Enter Lecture Notes Link">
					</div>

					<!-- Description of the lecture -->
					<div class="mb-3">
						<label for="description" class="form-label">Description of Lecture</label>
						<textarea class="form-control" name="description" placeholder="Enter Lecture Description" id="description" ></textarea>
					</div>
					<!-- Submit Button -->
					<button type="submit" class="btn btn-primary">Add new
						Lecture</button>
				</form>
				<!-- Course add form end -->
			</div>
		</main>
	</div>
			
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			var status = document.getElementById("status").value;
			if (status == "success") {
				swal("congrats","lecture Added Successfully","success")
			}
			if (status == "failed") {
				swal("Sorry","unable to add lecture","error")
			}
		</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>