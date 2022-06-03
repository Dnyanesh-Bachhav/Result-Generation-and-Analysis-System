// All Methods Related to Administrator
package mainController;

import beans.Admin_data;
import beans.Courses;
import beans.Exam_reg;
import beans.Invigilator_details;
import beans.StudentCourses;
import beans.Student_data;
import HelpingClasses.SessionFact;
import beans.Admin_info;
import beans.Hod_data;
import beans.Result1;
import beans.Result2;
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

public class AdminCon {
    
    private static Session session;
    private static SessionFactory sf;

    // Administrator Login Method
    
    public static Boolean login(String uname, String pword) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
//            pword=md5(pword);
        List li = session.createQuery("from Admin_data where username=:uname and password=:pword").setString("uname", uname).setString("pword", pword).list();
        System.out.println("login check hod performed");
        session.close();
//        SessionFact.close();
        //sf.close();
        return li.size() != 0;
    }

    // Get Courses Information with year/Branch/Term
    
    public static List<Courses> getCourses(int year, String branch, String term) {
        String hql;
        List<Courses> coursesList;
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            System.out.println(year);
            System.out.println(branch);
            System.out.println(term);
            if (branch.equals("") && term.equals("")) {
                hql = "from Courses where year='" + year + "'";
            } else if (term.equals("")) {
                hql = "from Courses where year='" + year + "' and programme='" + branch + "'";
            } //        else if((term.equals("")) && (branch.length() > 0))
            //        {
            //        hql = "from Courses where programme='"+branch+"'";
            //        }
            else {
                hql = "from Courses where year='" + year + "' and programme='" + branch + "' and term='" + term + "'";
            }

            tx = session.beginTransaction();
            coursesList = session.createQuery(hql).list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
           
                session.close();
            
            //        SessionFact.close();
        }

        return coursesList;
    }
    
    // Create New Admin Method 
    
    public static boolean createNewAdmin(String Uname, String password) {
        Transaction tx = null;
        Admin_data obj;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            obj = new Admin_data();
            obj.setUsername(Uname);
            obj.setPassword(password);
            session.save(obj);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return obj != null;
    }

    // Get Student Information Year/Branch/Term
    
    public static List<Student_data> getStudents(int year, String branch, String term) {
        String hql;
        Transaction tx = null;
        List<Student_data> StudentsList;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            if (branch.equals("") && term.equals("")) {
                hql = "from Student_data where year='" + year + "'";
            } else if (term.equals("")) {
                hql = "from Student_data where year='" + year + "' and programme='" + branch + "'";
            } //        else if((term.equals("")) && (branch.length() > 0))
            //        {
            //        hql = "from Courses where programme='"+branch+"'";
            //        }
            else {
                hql = "from Student_data where year='" + year + "' and programme='" + branch + "' and term='" + term + "'";
            }
            StudentsList = session.createQuery(hql).list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }

        return StudentsList;
    }
    
    // Get Students By Roll Number / Student Id
    
    public static List<Student_data> getStudentsByRollNo(int roll) {
        Transaction tx = null;
        List<Student_data> StudentsListByRollNo;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            StudentsListByRollNo = session.createQuery("from Student_data where rollno='" + roll + "'").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {

            if (session != null) {
                session.close();
            }
            //        SessionFact.close();
        }
        return StudentsListByRollNo;
    }

    // Get Register Courses By Roll Numbers
    
    public static List<Exam_reg> getExam_RegCoursesByRN(int roll) {
        Transaction tx = null;
        List<Exam_reg> Studentsexam_regListByRollNo;//  
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            Studentsexam_regListByRollNo = session.createQuery("from Exam_reg where regno='" + roll + "'").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return Studentsexam_regListByRollNo;
    }

    // Get Invigilators Details
    
    public static List<Invigilator_details> getInvigilators() {
        List<Invigilator_details> InvigilatorsList;
        Transaction tx = null;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            InvigilatorsList = session.createQuery("from Invigilator_details").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return InvigilatorsList;
    }

    // Get Course Name By Course Id Method
    
    public static List getCourseByCourseId(String courseId) {
        Transaction tx = null;
        List courseName;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            courseName = session.createSQLQuery("select course_name from courses where course_code='" + courseId + "'").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return courseName;
    }

    // Get Courses Table By Course Code Method
    
    public static List<Courses> getCoursesTableByCourseID(String courseId) {
        Transaction tx = null;
        List<Courses> courseName;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            courseName = session.createQuery("from Courses where course_code='" + courseId + "'").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return courseName;
    }
    
    // Get Students Academics Information Method
    
    public static List<StudentCourses> getStudentsAcademics(int roll, String course_code) {
        Transaction tx = null;
        List<StudentCourses> getAcademics;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            getAcademics = session.createQuery("from StudentCourses where Student_Id='" + roll + "' and Course_Code='" + course_code + "'").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return getAcademics;
    }

    // Register New Invigilator Method
    
    public static boolean registerInvigilator(String invigilatorId, String invigilatorPassword, String invigilatorName, String invigilatorBase, Integer department, String designation, String allowanceKey, String emailId, long contactNumber, String qualification, String experience, String specializedSubject1, String specializedSubject2, String specializedSubject3, String specializedSubject4, String address) {
        Transaction tx = null;
        Invigilator_details obj;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            obj = new Invigilator_details(invigilatorId, invigilatorPassword, invigilatorName, invigilatorBase, department, designation, allowanceKey, emailId, contactNumber, qualification, experience, specializedSubject1, specializedSubject2, specializedSubject3, specializedSubject4, address);
            session.save(obj);
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();

            //        SessionFact.close();
        }
        return true;
    }
    
    // Change Password Method

    public static Boolean changePassword(String uname, String pword) {
        Transaction tx = null;
        List li;
        Boolean bool = false;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            li = session.createQuery("from Admin_data where username=:uname").setString("uname", uname).list();
            if (li.size() != 0) {
                Admin_data sd = (Admin_data) li.get(0);
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
    
    // Get Courses Information Method
    
    public static List<Courses> getCoursesTable() {
        Transaction tx = null;
        List<Courses> list;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Courses").list();
            tx.commit();
            session.clear();
            session.flush();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {

            session.close();
            //        SessionFact.close();
        }
        return list;
    }

    // Get Course Code List Mthod
    
    public static Map<String, String> courseCodeList() {
        Transaction tx = null;
        List<Courses> list;
        Map<String, String> courseCodeList;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            System.out.println("Session Factory HashCode:= " + sf.hashCode());
            tx = session.beginTransaction();
            courseCodeList = new HashMap<>();
            list = session.createQuery("from Courses").list();
            for (Courses getCourse : list) {
                courseCodeList.put(getCourse.getCourse_code(), getCourse.getCourse_name());
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
        return courseCodeList;
    }

    // Get Course Credit List
    
    public static Map<String, Integer> courseCreditList() {
        Transaction tx = null;
        Map<String, Integer> courseCreditList;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            System.out.println("Session Factory HashCode:= " + sf.hashCode());
            tx = session.beginTransaction();
            courseCreditList = new HashMap<>();
            List<Courses> list = session.createQuery("from Courses").list();
            for (Courses getCourse : list) {
                courseCreditList.put(getCourse.getCourse_code(), getCourse.getCou_credit());
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
        return courseCreditList;
    }

    // Get Course Marks List
    
    public static Map<String, Integer> courseMarksList() {
        Transaction tx = null;
        Map<String, Integer> courseMarksList;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            System.out.println("Session Factory HashCode:= " + sf.hashCode());
            tx = session.beginTransaction();
            courseMarksList = new HashMap<>();
            List<Courses> list = session.createQuery("from Courses").list();
            for (Courses getCourse : list) {
                courseMarksList.put(getCourse.getCourse_code(), getCourse.getTotal_Marks());
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
        return courseMarksList;
    }

   // Get List of Student Courses 
   
    public static List<Object[]> getListOfStudentCourses(String courseId) {
        Transaction tx = null;
        List<Object[]> list;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            list = session.createSQLQuery("select t1.regno,t1.course_code,t2.Theory,t2.Periodic_Test,t2.Termwork,t2.Practical,t2.Oral from examreg t1 inner join student_courses t2 on t1.regno = t2.Student_Id and t1.course_code = t2.Course_Code where t1.course_code='" + courseId + "'").list();
            tx.commit();
            session.clear();
            session.flush();

        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return list;
    }

    // Get Result Method
    
    public static List<Object[]> getResult(int roll) {
        Transaction tx = null;
        List<Object[]> list;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            list = session.createSQLQuery("select t1.regno,t1.course_code,t1.ex_th,t1.ex_pt,t1.ex_tw,t1.ex_pr,t1.ex_or,t2.Theory,t2.Periodic_Test,t2.total,t2.Termwork,t2.Practical,t2.Oral from examreg t1 inner join student_courses t2 on t1.regno = t2.Student_Id and t1.course_code = t2.Course_Code where t1.regno='" + roll + "'").list();
            tx.commit();
            session.clear();
            session.flush();

        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return list;
    }
    
    // Get Result2 Another Method
    
        public static List<Object[]> getResult2(int roll,String lastSemester) {
        Transaction tx = null;
        List<Object[]> list;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            list = session.createSQLQuery("select t1.regno,t1.course_code,t1.ex_th,t1.ex_pt,t1.ex_tw,t1.ex_pr,t1.ex_or,t2.Theory,t2.Periodic_Test,t2.total,t2.Termwork,t2.Practical,t2.Oral,t1.Previous_Credits,t1.ex_reg_date from examreg t1 inner join student_courses t2 on t1.regno = t2.Student_Id and t1.course_code = t2.Course_Code where t1.regno='" + roll + "' and t1.ex_reg_date='"+ lastSemester +"'").list();
            tx.commit();
            session.clear();
            session.flush();

        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return list;
    }
    
    // Get Students For Specific Year/Branch/Term 
       
    public static List getStudentsForSpecificTermYear(int year, String branch, String term)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List getList = session.createSQLQuery("select distinct regno from examreg WHERE ex_reg_year='"+year+"' and prog='"+branch+"' and ex_reg_term='"+term+"'").list();
        tx.commit();
        session.flush();
        session.close();
        return getList;
    }
    
    // Get All Students For Result Declaration
    
    public static List getAllStudentsForResultDeclaration(String resultOfLastSemester)
    {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List getList = session.createSQLQuery("select distinct regno from examreg where ex_reg_date = '"+resultOfLastSemester+"'").list();
        tx.commit();
        session.flush();
        session.close();
        return getList;
    }
    
    // Get All Students
    
    public static List getAllStudents()
    {
        Transaction tx = null;
        List<Object[]> list;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            list = session.createSQLQuery("select t1.regno,t1.course_code,t1.ex_th,t1.ex_pt,t1.ex_tw,t1.ex_pr,t1.ex_or,t2.Theory,t2.Periodic_Test,t2.total,t2.Termwork,t2.Practical,t2.Oral from examreg t1 inner join student_courses t2 on t1.regno = t2.Student_Id and t1.course_code = t2.Course_Code").list();
            tx.commit();
            session.clear();
            session.flush();

        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return list;
    }
    
    // Get Current Examination Year 
    
    public static String getCurrentExaminationYear(){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        String currentExaminationYear = (String)session.createSQLQuery("select currentExaminationYear as value from admin_info").addScalar("value",StandardBasicTypes.STRING).uniqueResult();
        tx.commit();
        session.close();
        return currentExaminationYear;
    }
    
    // Get Information of Admin
    
    public static List<Admin_info> getAdmin_info(){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Admin_info> list = session.createQuery("from Admin_info").list();
        tx.commit();
        session.close();
        return list;
    }
    
    // Get Student Courses for Current Academics
    
    public static List<StudentCourses> getStudentCoursesForCurrentAcademics(String currentExaminationYear){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<StudentCourses> list = session.createQuery("from StudentCourses where examination='"+currentExaminationYear+"'").list();
        tx.commit();
        session.close();
        return list;
    }
    
    // Import Students from Exam_reg to Student Courses
    
    public static boolean importExam_reg(String currentExaminationYear){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Exam_reg> list = session.createQuery("from Exam_reg where ex_reg_date='"+currentExaminationYear+"'").list();
        for(Exam_reg li: list)
        {
            StudentCourses st = new StudentCourses();
            st.setStudentId(li.getRegno());
            st.setCourseCode(li.getCourse_code());
            st.setExamination(li.getEx_reg_date());
            st.setPeriodicTest("");
            st.setTheory("");
            st.setOral(0);
            st.setPractical(0);
            st.setTermwork(0);
            st.setTotal(0);
            st.setTheoryIsPass(false);
            st.setPracticalIsPass(false);
            st.setTermworkIsPass(false);
            st.setOralIsPass(false);
            st.setIsBacklog(0);
            st.setTheoryMarkSheetNumber(0);
            session.saveOrUpdate(st);
            
        }
        //session.createSQLQuery("INSERT INTO student_courses  (Student_Id,Course_Code,Examination) SELECT e.regno, e.course_code,e.exam_reg_date FROM examreg e where e.ex_reg_date='"+currentExaminationYear+"'");
        //session.createSQLQuery("update student_courses s set s.Oral = 0,s.termwork = 0,s.Theory = 0,s.Periodic_Test=0,s.Practical=0;s.examination='"+currentExaminationYear+"'");
        tx.commit();
        session.close();
        return true;
    }
    
    // Get Hod Information
    
    public static List<Hod_data> getAllHODsData(){
        Transaction tx = null;
        List<Hod_data> hodlist;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
            tx = session.beginTransaction();
            hodlist = session.createQuery("From Hod_data").list();
            tx.commit();
            session.clear();
            session.flush();
        }catch(Exception e){
            tx.rollback();
            throw e;
        }
        finally{
            session.close();
        }
        return hodlist;
    }

    // Clear The Course_result and Student_result table
    
    public static int clearResultTables(){
        Transaction tx = null;
        int val = 0;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try{
            tx = session.beginTransaction();
            Query query = session.createSQLQuery("delete from student_result");
            Query query1 = session.createSQLQuery("delete from courses_result");
            val = query.executeUpdate();
            query1.executeUpdate();
            tx.commit();
            session.clear();
            session.flush();
        }catch(Exception e){
            tx.rollback();
            throw e;
        }
        finally{
            session.close();
        }
        return val;
    }    
    
    // Get Data From Student_result table
    
    public static List<Result2> getStudent_Result(){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Result2> list = session.createQuery("from Result2").list();
        tx.commit();
        session.close();
        return list;
    }
    
    // Get Registerd Courses of Students 
    
    public static List<Exam_reg> getRegisteredCoursesByRoll(int rollNo) {
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Exam_reg> list = session.createQuery("from Exam_reg where regno='"+rollNo+"'").list();
        tx.commit();
        session.close();
        return list;
    }
    
    // get last Examination Year
    
    public static String getLastExaminationYear(){
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        String lastExaminationYear = (String)session.createSQLQuery("select lastExaminationYear as value from admin_info").addScalar("value",StandardBasicTypes.STRING).uniqueResult();
        tx.commit();
        session.close();
        return lastExaminationYear;
    }
    
    
    // Get Student From Student Result Database Table for Specific Roll No. 
    public static List<Result2> getStudent_ResultForSpecificRoll_No(int roll, String examinationYear){
      
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        Transaction tx = session.beginTransaction();
        List<Result2> list = session.createQuery("from Result2 where roll_no='"+roll+"' and examinationYear='"+examinationYear+"'").list();
        tx.commit();
        session.close();
        return list;
    }
    
    // Get Courses Result Table From Database For Specific Roll No.
    
    public static List<Result1> getCourses_ResultForSpecific_RollNo(int roll,String lastSemester) {
        Transaction tx = null;
        List<Result1> list;
        sf = SessionFact.getSessionFact();
        session = sf.openSession();
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Result1 where roll_no='" + roll + "' and examinationYear='"+ lastSemester +"'").list();
            tx.commit();
            session.clear();
            session.flush();

        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
            //        SessionFact.close();
        }
        return list;
    }
}
