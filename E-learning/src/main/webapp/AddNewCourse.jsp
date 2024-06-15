<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
		<title>Add New Course</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
		<link rel="stylesheet" href="style/style.css">
	</head>

	<body>
		<input type="hidden" id="status" value=<%=request.getAttribute("status")%>>
		<div class="container-fluid">
			<!--including template.jsp file that contain navbar and sidebar code  -->
			<%@include file="section/template.jsp" %>
				<main>
					<div class="container">
						<!-- form for adding new course to the page -->


						<form method="post" action="addCourse">
							<div class="mb-3">
								<label for="course_name" class="form-label">Course Name</label>
								<input type="text" name="course" class="form-control" id="course_name"
									placeholder="enter the course name" required>
							</div>
							<div class="mb-3">
								<label for="description" class="form-label">Description of
									course</label>
								<textarea class="form-control" name="description" placeholder="Enter course description"
									id="description" required></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Add new
								course</button>
						</form>


						<!-- Course add form end -->
					</div>
				</main>
		</div>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			var status = document.getElementById("status").value;
			if (status == "success") {
				swal("congrats","Course Created Successfully","success")
			}
			if (status == "failed") {
				swal("please","Do not use course name that already exists in system","error")
			}
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

	</body>

	</html>