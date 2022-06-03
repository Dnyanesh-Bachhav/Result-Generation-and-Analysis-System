<%-- 
    Document   : Practice
    Created on : 27 Sep, 2020, 4:10:07 PM
    Author     : DELL
--%>

<%@page import="mainController.HodCon"%>
<%@page import="beans.Exam_reg"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="HelpingClasses.SessionFact"%>
<%@page import="beans.StudentCourses"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.invigilatorsCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            
    private static Session session1;
    private static SessionFactory sf;
    String courseId = "IF6237";
    String[] array = null;
    String PT= "";
    String TH="";
    String TW="";
    String PR="";
    String OR="";
        %>
    <%
       
        int year = Integer.parseInt(request.getParameter("year"));
        String branch = request.getParameter("branch");
        String term = request.getParameter("term");
        StudentCourses stud = new StudentCourses();
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        array = HodCon.getCoursearray(year,branch,term);
       for(int i=0; i<array.length;i++){
            out.println(array[i]);
            List<Exam_reg> li = session1.createQuery("from Exam_reg where course_code='"+array[i]+"'").list();
            for(Exam_reg exam:li){
                 int roll =  exam.getRegno();
//              stud.setStudentId(roll);
//              stud.setCourseCode(courseId);
//              stud.setPeriodicTest(0);
//              stud.setTheory(0);
//              stud.setTermwork(0);
//              stud.setPractical(0);
//              stud.setOral(0);
//              stud.setExamination("");
//              stud.setIsBacklog(0);
//              stud.setTotal(0); 
//                out.println(roll+""+i++);

                
                //StudentCourses stud1 = new StudentCourses(roll,array[i],PT,TH,TW,PR,OR);
                //session1.save(stud1);
//                out.println(roll);
         }   
       }
        out.println("hi");
        tx.commit();
        session1.close();
        sf.close();

    %>    
    </body>
</html>
