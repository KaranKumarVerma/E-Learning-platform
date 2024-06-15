<% 

	RequestDispatcher dispatcher=request.getRequestDispatcher("Login.jsp");
	if(session.getAttribute("name")==null)
	{
		dispatcher.forward(request, response);
	}

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>E-teaching gurukul</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />

	<style>
	
	#course-card{
		overflow-x:auto;
		display:flex;
	}
	.card{
		flex-shrink:0;
		margin:3px;
	}
	</style>
 



</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">E-Teaching Gurukul</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#course">Courses</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>			
				
					<!-- Password update, Logout option -->
				
				
				<ul class="navbar-nav mb-2 mb-lg-0">
          			<li class="nav-item nav-item mx-0 mx-lg-1 dropdown">
            		<a class="nav-link py-3 px-0 px-lg-3 dropdown-toggle bg-danger rounded" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              		aria-expanded="false">
              			<%=session.getAttribute("name") %>
            		</a>
            		<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
              			<li><a class="dropdown-item" href="#">Change Password</a></li>
              			<li><a class="dropdown-item" href="#">Another action</a></li>
              			<hr class="dropdown-divider">
              			<li><a class="dropdown-item" href="logout">Logout</a></li>
               			
             	 
            		</ul>
          			</li>
        		</ul>
				
				<!-- dropdown Section -->
				
				
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-dark bg-gradient text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/avataaars.svg"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To E-teaching gurukul</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Networking - Java
				Development - Web Development - Python</p>
		</div>
	</header>
	
	
	
	<!-- Course Section Start -->
	<section class="page-section mb-0" id="course">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary">Course</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
	
	
	
			<!-- card area display flex -->
			<div class="" id="course-card">
			
			<!-- Java Code for generation of course card -->
			<%@include file="dbConnection.jsp"%>
			<%!String sql = "select *from course";
			ResultSet rs;
			%>
			
			<% 
			try{
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
			%>
			<div class="card text-white bg-dark" style="width: 18rem;">
  				<img src="assets/img/portfolio/coding.jpg" class="card-img-top" alt="...">
 				<div class="card-body">
    				<h5 class="card-title"><%=rs.getString("course_name") %></h5>
    				<p class="card-text"><%=rs.getString("course_description") %></p>
    				<form method="post" action="Lecture.jsp">
    					
    					<input type="hidden" name="course-name" value="<%=rs.getString("course_name")%>">
    					<input type="submit" class="btn btn-primary" value="Start Learning">
    				</form>
  				</div>
			</div>
			<% }
				}catch(Exception e) {
				System.out.println("Some problem to execute the query...." + e.getMessage());

				}finally {
				rs.close();
				}
			%>
			
			
			</div>
		<!-- card area end here -->
		<!-- Course Content -->
		
		</div>
	</Section>
	
	
	
	
	<!-- Course Section End -->
	
	
	
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">Welcome to eTeaching Gurukul! My name is Karan Kumar Verma, and I am a student of Computer Applications. I am excited to introduce you to this innovative platform designed to revolutionize the way we learn and teach.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">eTeaching Gurukul is an online learning platform that aims to provide a comprehensive and flexible space for educators and students alike. Whether you are a teacher looking to share your knowledge or a student eager to learn, eTeaching Gurukul offers a variety of courses and lectures across different subjects and levels.</p>
				</div>
			</div>
			<!-- About Section Button-->
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light"
					href="https://startbootstrap.com/theme/freelancer/"> <i
					class="fas fa-download me-2"></i> Free Download!
				</a>
			</div>
		</div>
	</section>
	
	<!-- About Section End -->
	
	
	
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact
				Me</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">Full name</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">A
								name is required.</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email"
								placeholder="name@example.com"
								data-sb-validations="required,email" /> <label for="email">Email
								address</label>
							<div class="invalid-feedback" data-sb-feedback="email:required">An
								email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email
								is not valid.</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="tel"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="phone">Phone number</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">A
								phone number is required.</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
							<textarea class="form-control" id="message" type="text"
								placeholder="Enter your message here..." style="height: 10rem"
								data-sb-validations="required"></textarea>
							<label for="message">Message</label>
							<div class="invalid-feedback" data-sb-feedback="message:required">A
								message is required.</div>
						</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl disabled" id="submitButton"
							type="submit">Send</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						492001 Raipur Chhattisgarh <br /> India,
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!">
					<i class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!">
					<i class="fab fa-fw fa-twitter"></i></a> 
					<a class="btn btn-outline-light btn-social mx-1" href="#!">
					<i class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/in/karan-verma-458b15241/"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Us</h4>
					<p class="lead mb-0">
						We are Student of Master's Of computer Application. This project is an academic project that we developed to demonstrate our learning.
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your website 2023-24</small>
		</div>
	</div>
		<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>
