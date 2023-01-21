<?php session_start(); ?>
<html>

<?php require ("header.php");?>

  <body class="bg-white" id="top">
    <!-- Navbar -->
    <nav
      id="navbar-main"
      class="
        navbar navbar-main navbar-expand-lg
        bg-default
        navbar-light
        position-sticky
        top-0
        shadow
        py-0
      "
    >
      <div class="container">
        <ul class="navbar-nav navbar-nav-hover align-items-lg-center">
          <li class="nav-item dropdown">
            <a href="index.php" class="navbar-brand mr-lg-5 text-white">
                               <img src="assets/img/logo.png" />
            </a>
          </li>
        </ul>

        <button
          class="navbar-toggler bg-white"
          type="button"
          data-toggle="collapse"
          data-target="#navbar_global"
          aria-controls="navbar_global"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon text-white"></span>
        </button>
        <div class="navbar-collapse collapse bg-default" id="navbar_global">
          <div class="navbar-collapse-header">
            <div class="row">
              <div class="col-10 collapse-brand">
                <a href="index.html">
                  <img src="assets/img/logo.png" />
                </a>
              </div>
              <div class="col-2 collapse-close bg-danger">
                <button
                  type="button"
                  class="navbar-toggler"
                  data-toggle="collapse"
                  data-target="#navbar_global"
                  aria-controls="navbar_global"
                  aria-expanded="false"
                  aria-label="Toggle navigation"
                >
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>

          <ul class="navbar-nav align-items-lg-center ml-auto">
		  
		   
			
							  <li class="nav-item">
			   <div class="dropdown show ">
		  <a class="nav-link dropdown-toggle text-white " href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                  <span class="text-white nav-link-inner--text">
                        <i class="text-white fas fa-sign-in-alt"></i> Login</span>
		  </a>

		  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			<a class="dropdown-item" href="loginstud.php">Student</a>
			<a class="dropdown-item" href="login.php">Faculty</a>
		  </div>
		</div>
			</li>
			
		  


            <li class="nav-item">
              <a href="signup.php" class="nav-link">
                <span class="text-white nav-link-inner--text"
                  ><i class="text-white fas fa-user-plus"></i> Sign Up</span>
              </a>
            </li>

          
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
  
  

<div class="wrapper" >


      <div class="page-header">
          <div class="page-header-image" style="background-image: url('assets/img/home.jpg')"></div>
        <div class="container shape-container d-flex align-items-center py-lg">
          <div class="col px-0">
            <div class="row align-items-center justify-content-center">
              <div class="col-lg-6 text-center">
                <h1 class="text-white display-1">Welcome </h1>
                <h4 class="text-white display-1">Put you knowledge to the test </h4>
                <div class="btn-wrapper mt-4">
                  <a href="signup.php"   class="btn btn-warning btn-icon mt-3 mb-sm-0">
                    <span class="btn-inner--icon"><i class="ni ni-button-play"></i></span>
                    <span class="btn-inner--text">Get Started</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
	

<?php require("footer.php");?>

</div>	
	
</body>

</html>