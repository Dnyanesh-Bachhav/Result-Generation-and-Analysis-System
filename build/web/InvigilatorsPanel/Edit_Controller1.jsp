<%-- 
    Document   : Edit_Controller1
    Created on : 28 Sep, 2020, 6:20:49 PM
    Author     : DELL
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="beans.StudentCourses"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="HelpingClasses.SessionFact"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
        <%!
            private static Session session1;
            private static SessionFactory sf;
int pt,th,tw,or,pr;
        %>
        <%
            JSONArray list = new JSONArray();
            JSONObject obj = new JSONObject();
            
        //response.setContentType("application/json");
        //Gson gson = new Gson();
        int roll = Integer.parseInt(request.getParameter("sid"));
        String courseId = request.getParameter("courseId");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<StudentCourses> getStudentCourses = session1.createQuery("from StudentCourses where studentId='"+roll+"' and courseCode='"+courseId+"'").list();
        tx.commit();
        session1.close();
        sf.close();
        
     
       
        for(StudentCourses st: getStudentCourses)
        {
            pt = Integer.parseInt(st.getPeriodicTest());
            th = Integer.parseInt(st.getTheory());
            tw = st.getTermwork();
            pr = st.getPractical();
            or = st.getOral();
            obj.put("pt", pt+"");
            obj.put("th", th+"");
            obj.put("tw", tw+"");
            obj.put("pr", pr+"");
            obj.put("or", or+"");
            list.add(obj);
            //out.print(gson.toJson(st));
            //System.out.println(obj.toString());
        }
        //String jString = JSONObject.toJSONString(obj);
//        out.flush();
//        out.close();
        out.println(list.toJSONString());
        out.flush();
//response.setContentType("application/json");
//response.getWriter().print(obj);
//out.flush();
//out.println(jString);

        
        
        %>
