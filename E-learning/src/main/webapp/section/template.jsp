<!-- navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-naviblue container-fluid">
    <div class="container-fluid">
      <!-- Offcanvas Trigger  Start-->
      <button class="btn bg-light" id="sidebar-trigger" type="button" data-bs-toggle="offcanvas"
        data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
        <span class="bi bi-chevron-double-right"></span>
      </button>
      <!-- Offcanvas Trigger End-->
      <a class="navbar-brand fw-bold text-uppercase" href="#">E-Teaching Gurukul Admin Panel</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <form class="d-flex ms-auto">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username"
              aria-describedby="button-addon2">
            <button class="btn btn-outline-light  bg-primary" type="button" id="button-addon2">
              <i class="bi bi-search"></i>
            </button>
          </div>
        </form>

        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              <i class="bi bi-person-fill"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Change Password</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Logout</a></li>
            </ul>
          </li>
        </ul>

      </div>
    </div>
  </nav>
  <!-- navbar -->

  <!--offcanvas-->


  <div class="offcanvas offcanvas-start sidebar-nav" tabindex="-1" id="offcanvasExample"
    aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title fw-bold" id="offcanvasExampleLabel">Dashboard</h5>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close" id="sidebar-close"></button>
    </div>
    <div class="offcanvas-body">
      <div  class="text-center d-flex flex-column">
        <a href="Admin.jsp" class="fw-bold fs-5 mt-2">Dashboard</a> 
        <a href="Student.jsp" class="fw-bold fs-5 mt-2">Students</a>
        <a class="fw-bold fs-5 mt-2">Courses</a>
        <a href="AddNewCourse.jsp" class="fw-bold fs-5 mt-2">Add New Course</a>
        <a href="AddNewLecture.jsp" class="fw-bold fs-5 mt-2">Add New Lesson</a>
      </div>
      
    </div>
  </div>

  <!--offcanvas-->
