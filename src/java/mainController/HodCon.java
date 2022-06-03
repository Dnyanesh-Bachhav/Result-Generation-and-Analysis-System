/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainController;

import beans.Courses;
import beans.Exam_reg;
import beans.Invigilator_details;
import beans.StudentCourses;
import HelpingClasses.SessionFact;
import beans.Admin_data;
import beans.Hod_data;
import beans.message;
import beans.Student_data;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

/**
 *
 * @author tppat
 */
public class HodCon {

    private static Session session;
    private static SessionFactory sf;

    // Login Method for HOD
    
    public static Boolean login(String uname, String pword) {
        List li = null;
        sf = SessionFact.getSessionFact();              //sessionFactory creation
        session = sf.openSession();

        try {
            System.out.println("login check hod started");
            li = session.createQuery("from Hod_data where username=:uname and password=:pword and user='hod'").setString("uname", uname).setString("pword", pword).list();
            System.out.println("login check hod performed");
        } catch (Exception e) {
        } finally {
            session.close();
            //sf.close();
        }
        if (!li.isEmpty()) {
            return true;
        } else {
            return false;
        }

    }
    
    // Search Student by Roll No

    public static List studentSearch(String rollno) {
        List li = null;
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            li = session.createQuery("from Student_data where rollno=:rollno").setString("rollno", rollno).list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        //sf.close();
        if (!li.isEmpty()) {
            return li;
        } else {
            return null;
        }

    }
    
    // Get Courses By Year/Branch/Term
    
    public static List<Courses> getCourses(int year, String branch, String term) {
        List<Courses> coursesList = null;
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            coursesList = session.createQuery(" from Courses where year='" + year + "' and programme='" + branch + "' and term='" + term + "'").list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        if (coursesList != null) {
            return coursesList;
        } else {
            return null;
        }

    }

    // Get Courses By Course Code
    
    public static List<Courses> getCourseByCourseId(String courseId) {
        List courseName = null;
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            courseName = session.createSQLQuery("select course_name from Courses where course_code='" + courseId + "'").list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        if (courseName != null) {
            return courseName;
        } else {
            return null;
        }

    }

    // Get Registered Students By Roll No
    
    public static List<Exam_reg> getExam_RegCoursesByRN(String roll) {
        Transaction tx = null;
        List<Exam_reg> Studentsexam_regListByRollNo = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            Studentsexam_regListByRollNo = session.createQuery("from Exam_reg where regno='" + roll + "'").list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        if (Studentsexam_regListByRollNo != null) {
            return Studentsexam_regListByRollNo;
        } else {
            return null;
        }

    }

    // Get Course By Course Code for Specific Department
    
    public static List<Courses> getCoursesBycode(String code) {
        List coursesList = null;
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            coursesList = session.createSQLQuery("select course_name from Courses where department='" + code + "'").list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        if (coursesList != null) {
            return coursesList;
        } else {
            return null;
        }
    }
    
    // Get Academics Data of Student
    
    public static List<StudentCourses> getAcademicsData(String roll, String course_code) {
        Transaction tx = null;
        List<StudentCourses> getAcademics = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            getAcademics = session.createQuery("from StudentCourses where Student_Id='" + roll + "' and Course_code='" + course_code + "'").list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        if (getAcademics != null) {
            return getAcademics;
        } else {
            return null;
        }
    }

    // Add Invigilator For Perticular Department
    
    public boolean addInvigilator(String invigilator_id, String invigilator_name, String qualification, String experience, String designation, long contactNumber, String address, String email, String allowanceKey, String invigilatorBase, int department, String ssubject1, String ssubject2, String ssubject3, String ssubject4, String password) {
        Transaction tx = null;

        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            Invigilator_details invigilator = new Invigilator_details();
            invigilator.setInvigilatorId(invigilator_id);
            invigilator.setInvigilatorPassword(password);
            invigilator.setInvigilatorName(invigilator_name);
            invigilator.setInvigilatorBase(invigilatorBase);
            invigilator.setDepartment(department);
            invigilator.setDesignation(designation);
            invigilator.setAllowanceKey(allowanceKey);
            invigilator.setContactNumber(contactNumber);
            invigilator.setEmailId(email);
            invigilator.setQualification(qualification);
            invigilator.setExperience(experience);
            invigilator.setSpecializedSubject1(ssubject1);
            invigilator.setSpecializedSubject2(ssubject2);
            invigilator.setSpecializedSubject3(ssubject3);
            invigilator.setSpecializedSubject4(ssubject4);
            invigilator.setAddress(address);
            session.save(invigilator);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        return true;
    }

    // Update Information of Invigilator By HOD
    
    public boolean updateinvigilator(String invigilator_id, String invigilator_name, String qualification, String experience, String designation, long contactNumber, String address, String email, String allowanceKey, String invigilatorBase, int department, String ssubject1, String ssubject2, String ssubject3, String ssubject4, String password) {
        Transaction tx = null;

        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            Query q = session.createSQLQuery("");
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    // Get Invigilators Details
    
    public static List<Invigilator_details> getInvigilatordetails(int dept_code) {
        Transaction tx = null;
        List<Invigilator_details> listdetails = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            listdetails = session.createQuery("from Invigilator_details where department=:dept_code").setInteger("dept_code", dept_code).list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
//        catch(Exception e)
//        {
//            if(tx !=null){
//                tx.rollback();
//            }
//            e.printStackTrace();
//        }
        if (listdetails != null) {
            return listdetails;
        } else {
            return null;

        }

    }

    // Get Invigilators Details By Id
    
    public static List<Invigilator_details> getInvigilatordetailsById(String invigilatorId) {
        Transaction tx = null;
        List<Invigilator_details> details = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            details = session.createQuery("from Invigilator_details where invigilatorId='" + invigilatorId + "'").list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }

//        catch(Exception e)
//        {
//            if(tx !=null){
//                tx.rollback();
//            }
//            e.printStackTrace();
//        }
        if (details != null) {
            return details;
        } else {
            return null;
        }

    }

        // Change HOD Password Method

    public static Boolean changeHodPwd(String uname, String pword) {
        Transaction tx = null;
        List li;
        Boolean bool = false;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            li = session.createQuery("from Hod_data where username=:uname").setString("uname", uname).list();
            if (li.size() != 0) {
                Hod_data sd = (Hod_data) li.get(0);
                sd.setPassword(pword);
                session.merge(sd);
                System.out.println("Password updation done successfully in stu account");
                tx.commit();
                session.clear();
                session.flush();
                bool = true;
            }
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {

            session.close();
            //        SessionFact.close();
        }
        //sf.close();
        return bool;
    }

    // Get Details of HOD
    
    public static List<Hod_data> getHodData(String name) {
        Transaction tx = null;
        List<Hod_data> details = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
        tx = session.beginTransaction();
        details = session.createQuery("from Hod_data where username=:name").setString("name", name).list();
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return details;
    }

    // Get Array of Course
    
    public static String[] getCoursearray(int year, String branch, String term) {
        String[] coursearray = null;
        int i = 0;
        Transaction tx =null;
        List<Courses> coursesList =null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
       try{
        tx = session.beginTransaction();
        coursesList = session.createQuery(" from Courses where year='" + year + "' and programme='" + branch + "' and term='" + term + "'").list();
        tx.commit();
       
        for (Courses li : coursesList) {
            coursearray[i] = li.getCourse_code();
            i++;
        }}catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
       }
        return coursearray;

    }

    // Send Message To Invigilator Related To department
    
    public static boolean message(String message, String from, String to, String Date) {
        Transaction tx = null;
        
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
       try{
        tx = session.beginTransaction();
        message message1 = new message();
        message1.setMsg(message);
        message1.setSender(from);
        message1.setReceiver(to);
        message1.setDate(Date);
        message1.setStatus(Boolean.FALSE);
        session.save(message1);
        tx.commit();
       }catch(Exception e){
       tx.rollback();
       }finally{
        session.close();
       }
        return true;
    }

    // Get Register Students and Marks By Roll No 
    
    public static List<StudentCourses> getRegStudentAndMarks(String roll) {
        Transaction tx =null;
        List<StudentCourses> getStudentsAndMarks = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
       try{
        tx = session.beginTransaction();
        getStudentsAndMarks = session.createQuery("from StudentCourses st where StudentId=:roll").list();
        tx.commit();}catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
       }
        if (getStudentsAndMarks != null) {
            return getStudentsAndMarks;
        } else {
            return null;
        }
    }

    // Get Code of All Branch
    
    public static Map<String, Integer> getAllbranchcode(String Program) {
        Map<String, Integer> getcourses = new HashMap<>();
        Transaction tx= null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
       try{
        tx = session.beginTransaction();
        List<Courses> list = session.createQuery("From Courses where programme=:Program").setString("Program", Program).list();
        for (Courses li : list) {
            getcourses.put(li.getProgramme(), li.getDepartment());

        }
        tx.commit();
       }catch(Exception e){
       tx.rollback();
       }finally{
        session.close();
       }
        return getcourses;
    }

    // Get All Courses
    
    public static Map<String, String> getAllCourses() {
        Map<String, String> getcourses = new HashMap<>();
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
       try{
        tx = session.beginTransaction();
        List<Courses> list = session.createQuery("From Courses").list();
        for (Courses li : list) {
            getcourses.put(li.getCourse_code(), li.getCourse_name());

        }
        tx.commit();
       }catch(Exception e){
       tx.rollback();
       }finally{
        session.close();
       }
        return getcourses;
    }

    // Get Courses By Department Code
    
    public static List getAllCourses1(int dept_code) {

        Transaction tx = null;
        List<Courses> listcourses = null;
        try {
            session = SessionFact.getSessionFact().openSession();
            tx = session.beginTransaction();
            listcourses = session.createQuery("from Courses where department=:dept_code").setInteger("dept_code", dept_code).list();
            tx.commit();

        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        }
        session.close();
        return listcourses;

    }

    // Get Courses Name By Course Code
    
    public static List<Courses> getCourse(String course_code) {
        Transaction tx = null;
        List coursename = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
        tx = session.beginTransaction();
        coursename = session.createQuery("from Courses where course_code='" + course_code + "'").list();
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return coursename;
    }

    // Get All Students of Related Department
    
    public static List<Student_data> getAllStudents(String program) {
        Transaction tx = null;
        List<Student_data> liststudent = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
        tx = session.beginTransaction();
        liststudent = session.createQuery("from Student_data where programme=:program").setString("program", program).list();
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }

//        catch(Exception e)
//        {
//            if(tx !=null){
//                tx.rollback();
//            }
//            e.printStackTrace();
//        }
        return liststudent;
    }

    // Get Course Array
    
    public static String[] courseOfArray(int year, String branch, String term) {
        Transaction tx = null;
        List<Courses> coursesList = null;
        String[] coursearray=null;
        int i = 0;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
        tx = session.beginTransaction();
        coursesList = session.createQuery(" from Courses where year='" + year + "' and programme='" + branch + "' and term='" + term + "'").list();
        tx.commit();
        tx.rollback();
        coursearray = new String[coursesList.size()];
        for (Courses li : coursesList) {
            coursearray[i] = li.getCourse_code();
            i++;
        }}catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return coursearray;

    }

    // Get count of Registered Students for specific Code
    
    public static ArrayList<Integer> getExam_regNumberByCourseId(String[] courseCode) {
       Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        ArrayList<Integer> list = new ArrayList<>();
        try{
        tx = session.beginTransaction();
        for(int i = 0; i < courseCode.length; i++) {
            Integer count = (Integer) session.createSQLQuery("select COUNT(*) as count from examreg where course_code='" + courseCode[i] + "'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
            list.add(count);
        }
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return list;
    }
    
    // Update Data of HOD
    
    public static boolean updateHodData(int shift,String usertype,String fname,String lname,String username,String program,String education){
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
            tx = session.beginTransaction();
            Hod_data data = new Hod_data( shift, usertype, fname, lname, username, program, education);
            data.setShift(shift);
            data.setUser(usertype);
            data.setFname(fname);
            data.setLname(lname);
            data.setUsername(username);
            data.setProgramme(program);
            data.setEducation(education);
            session.save(data);
            tx.commit();
        }catch(Exception e){
            tx.rollback();
        }finally{
            session.close();
        }
        return true;
    }
    
    
         // Get count of Registered Students for specific Code
    
    public static ArrayList<Integer> getPendingStudentsByCourseCode(String[] courseCode) {
       Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        ArrayList<Integer> list = new ArrayList<>();
        try{
        tx = session.beginTransaction();
        for(int i = 0; i < courseCode.length; i++) {
            Integer count = (Integer) session.createSQLQuery("select COUNT(DISTINCT roll_no) as count from courses_result where course_id='" + courseCode[i] + "' AND isBacklog='"+1+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
            list.add(count);
        }
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return list;
    }
    
        public static ArrayList<Integer> getPassStudentsByCourseCode(String[] courseCode) {
       Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        ArrayList<Integer> list = new ArrayList<>();
        try{
        tx = session.beginTransaction();
        for(int i = 0; i < courseCode.length; i++) {
            Integer count = (Integer) session.createSQLQuery("select COUNT(DISTINCT roll_no) as count from courses_result where course_id='" + courseCode[i] + "' AND isPass='"+1+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
            list.add(count);
        }
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return list;
    }
    
       // Get count of Pending Students Count
    
    public static ArrayList<Integer> getPendingStudentsCount(int year,String branch,String term) {
       Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        ArrayList<Integer> list = new ArrayList<>();
        ArrayList<Integer> list1 = new ArrayList<>();
        for(int i=1;i<=10;i++){
            list1.add(i);
        }
        try{
        tx = session.beginTransaction();
        for(int i = 0; i <list1.size(); i++) {
            Integer count = (Integer) session.createSQLQuery("SELECT COUNT(DISTINCT roll_no) as count FROM student_result WHERE backlog_count='"+list1.get(i)+"' AND department='"+branch+"' AND year='"+year+"' AND term='"+term+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
           System.out.println(count);
            list.add(count);
           
        }
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return list;
    }
 
    
     // Get count of Pending Students Count
    
    public static ArrayList<Integer> getRemarkCount(int year,String branch,String term) {
       Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        ArrayList<Integer> list = new ArrayList<>();
        ArrayList<String> list1 = new ArrayList<>();
        list1.add("ATRNC");
        list1.add("DTRNC");
        list1.add("PASS");
        try{
        tx = session.beginTransaction();
        for(int i = 0; i <list1.size(); i++) {
            Integer count = (Integer) session.createSQLQuery("SELECT COUNT(DISTINCT roll_no) as count FROM student_result WHERE remark='"+list1.get(i)+"' AND department='"+branch+"' AND year='"+year+"' AND term='"+term+"'").addScalar("count", StandardBasicTypes.INTEGER).uniqueResult();
//           System.out.println(count);
            list.add(count);
           
        }
        tx.commit();
        }catch(Exception e){
        tx.rollback();
        }finally{
        session.close();
        }
        return list;
    }
    
   
}
