/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainController;

import HelpingClasses.SessionFact;
import beans.Courses;
import beans.Exam_reg;
import beans.Invigilator_details;
import beans.StudentCourses;
import beans.student;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;
/**
 *
 * @author DELL
 */
public class invigilatorsCon {
    
    
    private static Session session;
    private static SessionFactory sf;

    // Login Method For Invigilator
    
    public static Boolean login(String uname, String pword)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        SQLQuery q = session.createSQLQuery("select Invigilator_Id,Invigilator_Password from invigilator_details where Invigilator_Id='"+uname+"' and Invigilator_Password='"+pword+"'");
        q.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List li = q.list();
        for(Object o:li)
        {
        Map m = (Map)o;
        System.out.println(m.get("username")+":"+m.get("password"));
        }
        System.out.println("login check hod performed");
        session.close();
        if(!li.isEmpty())
            return true;
        else
            return false;
    }
    
    // Get Invigilators Details By username
    
    public static List<Invigilator_details> getInvigilatorDetails(String uname) 
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Invigilator_details> li = session.createQuery("from Invigilator_details where Invigilator_Id='"+uname+"'").list();
        tx.commit();
        session.close();
        return li;
    }
    
    // Get Course Code By Course Name
    
    public static List<Courses> getCourseCodeByCourseName(String course_name, int code) 
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Courses> li = session.createQuery("from Courses where course_name='"+course_name+"' and department='"+code+"'").list();
        tx.commit();
        session.close();
        
        return li;
    }
    
    // Get Registered Students 
    
    public static List<Exam_reg> getExam_regByCourseId(String courseCode)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Exam_reg> Studentsexam_regListByRollNo = session.createQuery("from Exam_reg where course_code='"+courseCode+"'").list();
        
        tx.commit();
        session.close();
        
        return Studentsexam_regListByRollNo;
    }
    
    // Get Students Courses By roll Number
    
    public static Map<String,Integer> getStudentCoursesByRollCode(int roll, String courseCode)
    {
        int i = 0;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<StudentCourses> getStudentCourses = session.createQuery("from StudentCourses where studentId='"+roll+"' and courseCode='"+courseCode+"'").list();
        Map<String,Integer> academicsList = new HashMap<>();
        for(StudentCourses st: getStudentCourses){
            academicsList.put("Val"+(++i), Integer.parseInt(st.getPeriodicTest()));
            academicsList.put("Val"+(++i), Integer.parseInt(st.getTheory()));
            academicsList.put("Val"+(++i), st.getTermwork());
            academicsList.put("Val"+(++i), st.getPractical());
            academicsList.put("Val"+(++i), st.getOral());
        }
        tx.commit();
        session.close();
        return academicsList;
    }
    
    // Update Marks details
    
    public static boolean updatemarksDetails(int studentId,String courseCode,int periodicTest,int theory,int practical,int oral,int termwork)
  {
      boolean flag=false;
      
       sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        String hql2 ="update StudentCourses sc set sc.periodicTest=?,sc.theory=?,sc.termwork=?,sc.practical=?,sc.oral=?   where sc.studentId=? and sc.courseCode=?";
        Query query2=session.createQuery(hql2);
                         // Set  parameters
                         query2.setParameter(0,periodicTest);
                         query2.setParameter(1,theory);
                         query2.setParameter(2, termwork);
                         query2.setParameter(3,practical);
                         query2.setParameter(4,oral);
                         query2.setParameter(5,studentId);
                         query2.setParameter(6,courseCode);


         query2.executeUpdate();
         tx.commit();
        session.close();
        
        return true;
  }
    
    // Get All Courses
    
    public static List<Object> getAllCourses() 
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Object> li = session.createSQLQuery("select *from Courses").list();
        tx.commit();
        session.close();
        return li;
    }
    
    // Get Students and Courses
    
    public static List<Object> getStudentandCourse(String courseId, int roll) 
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Object> li = session.createSQLQuery("SELECT student.Student_Id FROM exam_reg student WHERE student.Course_Code='"+courseId+"' IN (SELECT * FROM student_courses stud WHERE stud.id =: id)").setParameter("id", roll).list();
        //query.setParameter("id",2);
        tx.commit();
        session.close();
        return li;
    }
    
    // Get All Students
    
    public static List<student> getAllStudents(){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<student> li = session.createSQLQuery("select t1.regno,t1.course_code,t2.Theory,t2.Periodic_Test,t2.Termwork,t2.Practical,t2.Oral from examreg t1 inner join student_courses t2 on t1.regno = t2.Student_Id and t1.course_code = t2.Course_Code").list();
        tx.commit();
        session.close();
        return  li;
        
    }
    
    // Get Count of PT Total
    
    public static Integer getCountOfPTTotal(String courseCode)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Periodic_Test=0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        
        tx.commit();
        session.close();
        return count;
    }
    
    // Get Count of PT Marks 
    
    public static Integer getCountOfPTTotalMarksFilled(String courseCode)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Periodic_Test>0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        
        tx.commit();
        session.close();
        return count;
    }
    
    // Get Count of PT
    
    public static int[] getCountOfPT(String courseCode)
    {
        int[] array = new int[2];
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Periodic_Test=0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        Integer count2 = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Periodic_Test>0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        tx.commit();
        array[0] = count;
        array[1] = count2;
        session.close();
        return array;
    }
    
    // Get Count Of Theory
    
    public static int[] getCountOfTH(String courseCode)
    {
        int[] array = new int[2];
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Theory=0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        Integer count2 = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Theory>0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        tx.commit();
        array[0] = count;
        array[1] = count2;
        session.close();
        return array;
    }
    
    // Get Count of Practical
    
    public static int[] getCountOfPractical(String courseCode)
    {
        int[] array = new int[2];
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Practical=0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        Integer count2 = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Practical>0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        tx.commit();
        array[0] = count;
        array[1] = count2;
        session.close();
        return array;
    }
    
    // Get Count of Oral
    
    public static int[] getCountOfOral(String courseCode)
    {
        int[] array = new int[2];
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Oral=0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        Integer count2 = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Oral>0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        tx.commit();
        array[0] = count;
        array[1] = count2;
        session.close();
        return array;
    }
    
    // Get Count of Termwork
    
    public static int[] getCountOfTermwork(String courseCode)
    {
        int[] array = new int[2];
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Integer count = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Termwork=0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        Integer count2 = (Integer)session.createSQLQuery("select COUNT(*) as count from student_courses where Termwork>0 and Course_Code='"+courseCode+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
        tx.commit();
        array[0] = count;
        array[1] = count2;
        session.close();
        return array;
    }
    
    
    public static Map<String, String> courseNameByCoursCode() {
        Transaction tx = null;
        List<Courses> list;
        Map<String, String> courseNameList;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            System.out.println("Session Factory HashCode:= " + sf.hashCode());
            tx = session.beginTransaction();
            courseNameList = new HashMap<>();
            list = session.createQuery("from Courses").list();
            for (Courses getCourse : list) {
                courseNameList.put( getCourse.getCourse_code(),getCourse.getCourse_name());
                session.clear();
                session.flush();
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }

            //        SessionFact.close();
        }
        return courseNameList;
    }
}









