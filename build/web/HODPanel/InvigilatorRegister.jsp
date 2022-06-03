
<!--Register New Invigilator--> 

<%@page import="beans.Courses"%>
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
<html lang="en">
    <head>
        <title>Update Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style type="text/css">
            .container{
                margin-top: 40px;
                border: 1px solid gray;
                border-radius: 20px;
            }
            h2{
                font-size: 25px;
                padding-left: 100px;
            }

        </style>
    </head>
    <body>
        <%!
            private static Session s;
            private static SessionFactory sf;

        %>

    <center><h2>Add Invigilator's Details</h2></center>
    <center><h4 style="color: grey; margin-left: 80px">Basic info,Such as your name that you use on your account.</h4></center>
    <div class="container border border-dark rounded-lg">
        <h2>Profile</h2>
        <form class="form-horizontal"  action="../Controller/newInvigilator.jsp" method="post"> 
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Invigilator Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control border-0"  id="invigilatorName" placeholder="Enter Invigilator Name" name="invigilatorName" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">Invigilator Id:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control border-0"  id="id" placeholder="Enter Invigilator Id" name="id" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Invigilator Base:</label>
                <div class="col-sm-10">
                    <select name="invigilatorBase">
                        <option value="indigenous">Indigenous</option>
                        <option value="external">External</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Experience:</label>
                <div class="col-sm-10">
                    <input type="text" required="" class="form-control border-0"  id="experience" placeholder="Enter Experience" name="experience">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Designation:</label>
                <div class="col-sm-10">
                    <input type="text" required="" class="form-control border-0"  id="designation" placeholder="Enter Your Designation" name="designation">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Email:</label>
                <div class="col-sm-10">
                    <input type="Email" required="" class="form-control border-0"  id="email" placeholder="Enter Your Email" name="emailId">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Contact:</label>
                <div class="col-sm-10">
                    <input type="number" required="" class="form-control border-0"  id="contact" placeholder="Enter Your Contact" name="contactNumber">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Qualification:</label>
                <div class="col-sm-10">
                    <input type="text" required="" class="form-control border-0"  id="qualification" placeholder="Enter Your Qualification" name="qualification">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">BirthYear:</label>
                <div class="col-sm-10">
                    <input type="text" required="" class="form-control border-0"  id="allowanceKey" placeholder="Enter Your BirthYear" name="allowanceKey">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Address:</label>
                <div class="col-sm-10">
                    <input type="text" required="" class="form-control border-0"  id="address" placeholder="Enter Your Address" name="address">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Department:</label>
                <div class="col-sm-10">
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
                        <option value='01'>Interior Designing And Decoration</option>
                    </select>

                </div>
            </div>
            <%List<Courses> result;%>
            <%

                sf = SessionFact.getSessionFact();
                s = sf.openSession();

                Transaction t = s.getTransaction();//Creation of Transaction

                t.begin(); // Beginning of Transaction

                //StudentCoursesId select_Row=new StudentCoursesId(roll_No,course_Code);
                // Get all available records 
            //           String hql = "SELECT DISTINCT course_name FROM Courses  ORDER BY course_name";
                String hql = "from Courses";

                Query query = s.createQuery(hql);
                result = query.list();
                t.commit();

                s.close();
            %>

            <div class="form-group">
                <label class="control-label col-sm-2">Specialized Subject1:</label>
                <div class="col-sm-10">          
                    <select name="specializedSubject1">
                        <option value="None" default>None</option>
                        <%   for (Courses course : result) {%>
                        <option value='<%=course.getCourse_code()%>'><%=course.getCourse_name() + " " + course.getCourse_code()%></option>
                        <%}%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" >Specialized Subject2:</label>
                <div class="col-sm-10">          
                    <select name="specializedSubject2">
                        <option value="None" default>None</option>
                        <%   for (Courses course : result) {%>
                        <option value='<%=course.getCourse_code()%>'><%=course.getCourse_name() + " " + course.getCourse_code()%></option>
                        <%}%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Specialized Subject3:</label>
                <div class="col-sm-10">          
                    <select name="specializedSubject3">
                        <option value="None" default>None</option>
                        <%   for (Courses course : result) {%>
                        <option value='<%=course.getCourse_code()%>'><%=course.getCourse_name() + " " + course.getCourse_code()%></option>
                        <%}%>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="control-label col-sm-2">Specialized Subject4:</label>
                <div class="col-sm-10">          
                    <select name="specializedSubject4">
                        <option value="None" default>None</option>
                        <%   for (Courses course : result) {%>
                        <option value='<%=course.getCourse_code()%>'><%=course.getCourse_name() + " " + course.getCourse_code()%></option>
                        <%}%>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-10">          
                    <input required="" type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
                </div>
            </div>
            <div class="form-group">        
                <div class="col-sm-offset-2 col-sm-10 ">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
            </div>
        </form>
    </div>
    
</body>
</html>