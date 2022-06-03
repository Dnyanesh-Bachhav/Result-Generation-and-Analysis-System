<%-- 
    Document   : Mechanical_Engineering
    Created on : 29 Aug, 2020, 3:52:13 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
   
      body {
   font-family: 'Karla', sans-serif;
    font-size: 1.2vw;
    padding : 5%;
}
   .jumbotron{
      background-color: #1e88e5;
      color: #ffffff;
      padding-top: 30px;
      padding-bottom: 30px;
      margin-top: 6.5vw;
    }


  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 50%;
  }

@media only screen and (max-width: 600px) {
     body{
        font-family: 'Karla', sans-serif;
    font-size: 4.2vw; 
    }
 @media only screen and (max-width: 600px) {
      #section5{
        margin-top: 85vw;
    }
    
  </style>
    </head>
    <body>
        <br><br><br>

  <div class="container">
   <div class="row">
     <div class="col-md-6">
      <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
    <li data-target="#myCarousel" data-slide-to="6"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i1.jpg" alt="Los Angeles"  class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i2.jpg" alt="Chicago" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i3.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i4.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i5.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i6.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i7.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i8.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i9.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i10.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i11.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i12.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i13.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i14.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i15.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i16.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i17.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i18.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i19.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i20.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/me/profile/i21.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    
    
    
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>
     
<div class="col-md-6">
 <div id="accordion1">
  <div class="card">
    <div class="card-header">
      <a class="card-link" data-toggle="collapse" href="#collapseOne">
       Vision
      </a>
      </div>
    <div id="collapseOne" class="collapse show" data-parent="#accordion1">
      <div class="card-body" align="justify">
        <span><i class="fa fa-quote-left" ></i></span>The Department envisions being the center for excellence in training and entrepreneurship development in the field of emerging areas in Mechanical Engineering like automation and robotics. The department shall be the center for innovation and business incubation leading to entrepreneurial activity.<span><i class="fa fa-quote-right"></i></span>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
        Mission
      </a>
      </div>
      <div id="collapseTwo" class="collapse" data-parent="#accordion1">
        <div class="card-body" align="justify">
           <span><i class="fa fa-quote-left" ></i></span>
          Department of Mechanical  Engineering is committed <br>
          M1. Imparting the quality education and enhancing their skills to develop competitive mechanical engineers.<br>M2. Develop a entrepreneur, innovators and lifelong learners for socioeconomic development of nation.<br>M3. Establish the effective learning environment for achieving academic excellence with modern teaching 
          learning processes. <span><i class="fa fa-quote-right" ></i></span>
        </div>
      </div>
    </div>
  </div>
 </div>
 </div>
</div>
<br><br>
        
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>









