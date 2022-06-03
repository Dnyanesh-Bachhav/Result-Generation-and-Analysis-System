<%-- 
    Document   : ViewResult
    Created on : 7 Aug, 2020, 9:10:29 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

  <html> 
  <head>
  <title>Button Form</title> 
<style>
 TH{
 
   color:#ffffff; 
   font-size:14 Arial;
   } 
 TD{
      border:1 solid #FF00FF;
     font-size:12 Arial; 
   } 
</style>
  </head> 
  <body>
 
  <FORM NAME="Button Example" METHOD="POST" ACTION="viewResult1.jsp"> 
<table width='30%' cellpadding=4 cellspacing=0 align=center>
<!-- <td  rowspan = 2 align= center><img src = "resultsbook.gif">  </td> -->
<tr style="  background-color:#7B0099; " ><th colspan=2 >	<font size= 5 >RESULT SUMMER-2020</font></th></tr>
<tr style="  background-color:#7B0099; " ><th colspan=2 >	<font size= 2 >(Result of I-Even/II-Even Regular Students Only)</font></th></tr> 
<!-- <tr style="  background-color:#7B0099; " ><th colspan=2 >	<font size= 2 >(Result after error Modifications will be displayed within 4 Days)</font></th></tr> -->

<!-- <tr style="  background-color:#7B0099; " ><th colspan=2 >	<font size= 2 >Result will be declared on 27/07/2020 @ 5.00 pm</font></th></tr> -->


    <tr>
        <td><font color = blue>Enter Roll Number</font></td>
        <td><INPUT TYPE="text" NAME= "rollnumber" VALUE="">	</td>
    </tr>
    <tr>
        <td><!--<a href="name.asp">Search Rollno of Student</a>--></td>
        <td><INPUT TYPE="SUBMIT" VALUE="Submit" Name="Submit"><INPUT TYPE="RESET" VALUE="Clear Form"></td>
    </tr>
   
</table>
</form> 

</body>
</html>

</!DOCTYPE html>
<html>
<head>
	<title>Button Form</title>
<style>
 TH{
   
   color:#ffffff; 
   font-size:14 Arial;
   } 
 TD{
      border:1 solid #FF00FF;
     font-size:12 Arial; 
   } 
</style>
</head>
<body>
</body>
</html>
<DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<!--<input type="submit" name="sample" value="Home" align="center">    
-->
<table>
</table>

<table cellspacing=0 align=center>
<!-- <td  rowspan = 2 align= center><img src = "resultsbook.gif">  </td>  <tr><th colspan=2 >	<font size= 5 >Result SUMMER-2018</font></th></tr>
 <tr><td><font color = blue>Enter Roll Number</font></td><td><INPUT TYPE="text" NAME= "examno" VALUE="">	</td></tr>

 <tr><td></td><td><form><INPUT TYPE="SUBMIT" VALUE="Home" Name="Sample" onclick="window.location.herf='C:\xampp\htdocs\Files\W-2016\res_code\res.html'">    <INPUT TYPE="Submit" VALUE="Print"></form></td></tr>


 -->
  <script type="text/javascript">
  	function visit()
  	{
  		window.location=' index.html' ;
  	}
  	function prt()
	{
		window.print();
	}
  </script>
  <div style="text-align: center ">
 

</div>


</table>


</body>
</html>
 <script type="text/javascript">
    function printArea(areaName)
    {
        var printContents = document.getElementById(areaName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;

        window.print();
		document.body.innerHTML = originalContents;
    }   
</script>