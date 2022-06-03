<%-- 
    Document   : Information_Technology
    Created on : 30 Aug, 2020, 6:54:01 PM
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
    <body><br><br><br>
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
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img1.jpg" alt="Los Angeles"  class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img2.jpg" alt="Chicago" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img3.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img4.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img5.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img6.jpg" alt="New York" width="1100" height="300" class="img-fluid">
    </div>
    <div class="carousel-item">
      <img src="https://gpnashik.ac.in/assets/img/Dept/if/profile/img7.jpg" alt="New York" width="1100" height="300" class="img-fluid">
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
        <span><i class="fa fa-quote-left" ></i></span>To emerge as a center of excellence in the domain of Information Technology and be the player in Digital India, having capability of producing technically proficient manpower which is competent of making significant contributions as entrepreneurs or professionals to the industry and society.<span><i class="fa fa-quote-right"></i></span>
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
           Department of Information Technology is committed<br>
           M1. To impart quality engineering education and enhance problem solving skills. <br>
           M2. To develop innovative skills.<br> 
           M3. To encourage student for employable, entrepreneurial and life-long learning skill.<br>M4. To mold student for integrity and ethics.<br>
           M5. To provide leadership with social sensitivity for the betterment of the society,humanity and country as a whole.<br><span><i class="fa fa-quote-right" ></i></span>
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
