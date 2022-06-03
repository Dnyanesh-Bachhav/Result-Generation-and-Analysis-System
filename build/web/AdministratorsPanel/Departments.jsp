<!--All Departments access Page-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
<head>
<title>Departments</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<style>
body{
font-family: 'FuturaLT-Book';
}
h1,
h2,
h3,
h4,
h5,
h6 {
  color: #363636;
  line-height: 1.3;
  font-weight: 400; 
  }
  h2{
  font-size: 20px;
  }
  a,
a:hover,
a:focus {
  -webkit-transition-duration: 500ms;
  transition-duration: 500ms;
  text-decoration: none;
  outline: 0 solid transparent;
  color: #141414;
  font-weight: 400;
  font-size: 14px; }
</style>

</head>
<body>
    
    <!-- For Departments-->
<center>
<div id="Departments" class="container-fluid" style="background-color:lightcyan;">            
  <h1 style="font-size:55px;color:blue">Departments</h1>
  <br> 
  <div class="row slideanim">
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/ce_profile" target="_blank"><span class="fas fa-city" style="font-size:72px;color:#191970;"></span>
     <h2>Civil Engineering</h2></a>
        </div>
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/me_profile" target="_blank"><span class="fas fa-cogs" style="font-size:72px;color:#191970;"></span>
            <h2>Mechanical Engineering</h2></a>
      
    </div>
    <div class="col-sm-4">
     <a href="https://gpnashik.ac.in/Department/ps_profile" target="_blank" method="post"><span class="fas fa-filter" style="font-size:72px;color:#191970;" ></span>
         <h2>Plastic Engineering</h2></a>     
      
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/ee_profile" target="_blank"><span class="fas fa-lightbulb" style="font-size:72px;color:#191970;"></span>
            <h2>Electrical Engineering</h2></a>
      
    </div>
    <div class="col-sm-4">
      <a href="https://gpnashik.ac.in/Department/if_profile" target="_blank"><span class="fas fa-laptop" style="font-size:72px;color:#191970;"></span>
          <h2>Information Technology</h2></a>
      
    </div>
  <div class="col-sm-4">
      <a href="https://gpnashik.ac.in/Department/cm_profile" target="_blank"><span class="fas fa-code" style="font-size:72px;color:#191970;"></span>
        <h2>Computer Technology</h2></a>
      
    </div>
  </div>
    <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
     <a href="https://gpnashik.ac.in/Department/entc_profile" target="_blank"><span class="fas fa-plug" style="font-size:72px;color:#191970;"></span>
          <h2>Electronics And Telecommunication</h2></a>
      
    </div>
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/ae_profile" target="_blank"><span class="fa fa-car" style="font-size:72px;color:#191970;"></span>
            <br height="10"></br>
      <h2>Automobile Engineering</h2></a>
      
    </div>
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/ddgm_profile" target="_blank"><span class="fas fa-cut"style="font-size:72px;color:#191970;"></span>
    <h2>Dress Designing & Garment Manufacturing</h2></a>
      
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/idd_profile" target="_blank"><span class="fas fa-paint-roller"style="font-size:72px;color:#191970;"></span>
            <h2>Interior Designing & Decoration</h2></a>
      
       </div>
    <div class="col-sm-4">
        <a href="https://gpnashik.ac.in/Department/science_profile" target="_blank"><span class="fas fa-vial"style="font-size:72px;color:#191970;"></span>
          <h2>Science & Humanity</h2></a>
      
       </div>
    <div class="col-sm-4">
      <a href="#"><span class="fas fa-chalkboard-teacher "  style="font-size:72px;color:#191970;"></span>
          <h2>Other</h2></a>
    </div>
    
  </div>
</div>
</center>
    

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
