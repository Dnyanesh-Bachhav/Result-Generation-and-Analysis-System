
<!--Add Invigilator Page-->
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<%@page import="HelpingClasses.SessionFact"%>
<%--@page errorPage="ErrorPage.jsp"--%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <style>
            body{
                margin: 5%;
            }
        </style>
    </head>
    <body>
        <%!
    private static Session s;
    private static SessionFactory sf;

        %>
  <br/><br/>
  <div>
   <div>
       <h2>Add An Invigilator</h2><br>
    </div>
      <div style="border: 1px solid black;">
      <form action="../Controller/newInvigilatorRegister.jsp" method="post" style="margin-left: 50px;">
        <div id="input_container">
    <label>Name </label><br>
    <input type="text" class="form-control" style="width: 500px;" name="invigilatorName" placeholder="Enter the invigilator's name" required>
    </div>
    <label>Id</label><br>
  <input type="text" class="form-control" style="width: 500px;"  name="id" placeholder="Enter the invigilator's id" required><br>
  <label>Qualification</label><br>
  <input type="text" class="form-control" style="width: 500px;" name="qualification" placeholder="Enter the qualification" required>
    <br/>
    <label>Experience</label><br>
  <input type="text" class="form-control" style="width: 500px;" name="experience" placeholder="Enter the experience (in months)" required>
    <br/>
    <label>Designation</label><br>
  <input type="text" class="form-control" style="width: 500px;" name="designation" placeholder="Enter the designation" required>
    <br/>
  <label>Contact No </label><br>
  <input type="text" name="contactNumber" class="form-control" style="width: 500px;" placeholder="Enter the contact number" required><br>
  <label>Address </label><br>
  <input type="text" name="address" class="form-control" style="width: 500px;" placeholder="Enter the address" required><br>
   <label>Email Id</label><br>
    <input type="text" name="emailId"  class="form-control" style="width: 500px;" placeholder="Enter the Email Id"><br>
    
    <label>Birth Year (Allowance Key)</label><br>
    <input type="text" name="allowanceKey" class="form-control" style="width: 500px;" placeholder="Enter your birth year e.g.- 2000"><br>
    
    <label>Invigilator's Base</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="invigilatorBase">
        <option value="indigenous">Indigenous</option>
        <option value="external">External</option>
      </select>
      <br/><br/><label>Department :</label>&nbsp;
    <select name="department"> 
      <option value='11'>Civil Engineering I Shift</option>
      <option value='12'>Civil Engineering II Shift</option>
      <option value='21'>Mechanical Engineering I Shift</option>
      <option value='22'>Mechanical Engineering II Shift</option>
      <option value='31'>Plastic Engineering</option>
      <option value='41'>Electrical Engineering</option>
      <option value='51'>Information Technology</option>
      <option value='61'>Computer Technology</option>
      <option value='71'>Electronics And Telecommunication Engineering I Shift</option></html>
      <option value='72'>Electronics And Telecommunication Engineering II Shift</option>
      <option value='81'>Automobile Engineering</option>
      <option value='91'>Dress Designing And Garment Manufacturing</option>
      <option value='01'>Interior 
          Designing And Decoration</option>
    </select>
   
      <br/>
      <%!List<String> result;%>
<%          
           
            sf = SessionFact.getSessionFact();
            s = sf.openSession();
           
           Transaction t=s.getTransaction();//Creation of Transaction
          
           t.begin(); // Beginning of Transaction
           
            
         //StudentCoursesId select_Row=new StudentCoursesId(roll_No,course_Code);
                                // Get all available records 
                                
            
           String hql = "SELECT DISTINCT course_name FROM Courses  ORDER BY course_name";
           Query query = s.createQuery(hql);
             result = query.list();
      t.commit();
          
                   s.close();
            %>
      
      
  <div class="col" style="width: 500px;">
    <div class="col1" style="width: 50%; padding-right: 30px ">
        <label>Specialized Subject 1</label>
        <select name="specializedSubject1">
            <option value="None" default>None</option>
                 <%   for(String course : result)
                    {%>
                        <option value='<%=course%>'><%=course%></option>
                    <%}%>
                   </select>
    </div>
    <div class="col2" style="width: 50%;padding-right: 30px "">
        <label>Specialized Subject 2</label>
        <select name="specializedSubject2">
            <option value="None" default>None</option>
                 <%   for(String course : result)
                    {%>
                        <option value='<%=course%>'><%=course%></option>
                    <%}%>
                   </select>
    </div>
  </div>
  <div class="col" style="width: 500px;">
    <div class="col1" style="width: 50%; padding-right: 30px ">
        <label>Specialized Subject 3</label>
        <select name="specializedSubject3">
            <option value="None" default>None</option>
                 <%   for(String course : result)
                    {%>
                        <option value='<%=course%>'><%=course%></option>
                    <%}%>
                   </select>
    </div>
    <div class="col2" style="width: 50%;padding-right: 30px "">
        <label>Specialized Subject 4</label>
        <select name="specializedSubject4">
            <option value="None" default>None</option>
                 <%   for(String course : result)
                    {%>
                        <option value='<%=course%>'><%=course%></option>
                    <%}%>
                   </select>
    </div>
  </div><br>
    <label>Password : </label><br>
  <input type="password" class="form-control" style="width: 500px;" name="password" placeholder="Enter the password" required>
  <br>
  <button class="button"><span>Submit </span></button>
  <br>
  <br>
      </form>
      </div>                   
</div>
    </body>
</html>
