<% 
	
	RequestDispatcher dispatcher=request.getRequestDispatcher("AdminLogin.jsp");
	if(session.getAttribute("name")==null)
	{
		dispatcher.forward(request, response);
	}

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="style/style.css">
</head>
<body>

	<!--//including dbConnection.jsp file so that we can use database connectivity and perform some operation on database-->
	<%@include file="dbConnection.jsp"%>
	<%!String sql = "select *from tmsuser";
	int size = 0;
	int count = 0;
	ResultSet rs;%>
	<div class="container-fluid">
		<%@include file="section/template.jsp"%>
		<main>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone</th>
					</tr>
				
				<%
				try {
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr class="">
				<td><%=rs.getString("uname")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("phone")%></td>
				</tr>
				<%
				}
				size = count;
				count = 0;
				} catch (Exception e) {
				System.out.println("Some problem to execute the query...." + e.getMessage());

				} finally {
				rs.close();
				}
				%>
			</thead>
		</main>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
</body>
</html>
