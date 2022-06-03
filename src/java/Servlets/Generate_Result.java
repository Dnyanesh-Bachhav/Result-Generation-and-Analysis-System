/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.Admin_info;
import beans.Result1;
import beans.Result2;
import beans.Student_data;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mainController.AdminCon;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Generate_Result", urlPatterns = {"/Generate_Result"})
public class Generate_Result extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        out.print("<h1 style='color: darkedred;padding: 10px;border: 2px solid black;padding-left: 400px;'>Return to main Page after this<br/> page completes it's loading....</h1>");
        int rollno;
        int currentCredits = 0;
        int backlogCount = 0;
        int grandTotal = 0;
        int outOfMarks = 0;
        String result = "";
        String resultOfLastSemester = "";
        int counter = 0;
        Result1 r1 = null;
        Result2 r2 = null;
        Session session1 = null;
        SessionFactory sf = null;
        Transaction tx = null;
        List<Object[]> list;
        int previous_credits = 0;

        Map<String, String> courseNameList = AdminCon.courseCodeList();
        Map<String, Integer> courseCreditList = AdminCon.courseCreditList();
        Map<String, Integer> courseMarksList = AdminCon.courseMarksList();
        List<Admin_info> getCurrents = AdminCon.getAdmin_info();
        for (Admin_info current : getCurrents) {
            resultOfLastSemester = current.getLastExaminationYear();
        }
        List listOfStudents = AdminCon.getAllStudentsForResultDeclaration(resultOfLastSemester);
        Collections.sort(listOfStudents);
        //listOfStudents.sort(c);
        //out.print("Hello World...!!!");
        out.println(listOfStudents.size());
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        for (Object li : listOfStudents) {
            String currentTerm = "";
            int currentYear = 0;
            String department = "";
            String examinationYear = "";
            tx = session1.beginTransaction();
            counter++;
            rollno = (Integer) li;
            out.println(counter + ". " + rollno);
            List<Student_data> student = AdminCon.getStudentsByRollNo(rollno);
            r1 = new Result1();
            r2 = new Result2();
            for (Student_data data : student) {
                currentTerm = data.getTerm();
                department = data.getProgramme();
                currentYear = data.getYear();

                r2.setStudent_name(data.getS_name());
                r2.setRoll_no(Integer.parseInt(data.getRollno()));
                r2.setTerm(currentTerm);
                r2.setDepartment(department);
                r2.setYear(currentYear);

                r1.setTerm(currentTerm);
                r1.setDepartment(department);
                r1.setYear(currentYear);
            }

            List< Object[]> list2 = AdminCon.getResult2(rollno, resultOfLastSemester);
            for (Object[] o1 : list2) {
                int val = (Integer) o1[9];
                int isTheory = (Integer) o1[2];
                int isPT = (Integer) o1[3];
                grandTotal += val + (Integer) o1[10] + (Integer) o1[11] + (Integer) o1[12];
                outOfMarks += courseMarksList.get(o1[1].toString());
                if (val >= 40) {
                    currentCredits += courseCreditList.get(o1[1].toString());
                } else if (isTheory == 0 && isPT == 0) {
                    currentCredits += courseCreditList.get(o1[1].toString());
                } else {
                    if (isTheory == 1) {
                        backlogCount++;
                    }
                }
                previous_credits = (Integer) o1[13];
                examinationYear = (String) o1[14];
//                if(!(1 == (Integer) o1[2]) && !(1 == (Integer) o1[3]))
//                {

                //}
                //else{
                // Set Theory                
                if ((1 == (Integer) o1[2])) {
                    r1.setIsTheory(true);
                    r1.setTheory(o1[7].toString());
                } else {

                    r1.setIsTheory(false);
                    r1.setTheory("--");
                }

                // Set Periodic Test                
                if ((1 == (Integer) o1[3])) {
                    r1.setIsPeriodic_Test(true);
                    r1.setPeriodic_test(o1[8].toString());
                } else {
                    int num = Integer.parseInt(o1[8].toString());
                    if (num > 0) {
                        r1.setIsPeriodic_Test(false);
                        r1.setPeriodic_test(o1[8].toString());
                    } else {
                        r1.setIsPeriodic_Test(false);
                        r1.setPeriodic_test("--");
                    }

                }
                //}

                // Set Termwork     
                if ((1 == (Integer) o1[4])) {
                    r1.setIsTheory(true);
                    r1.setTermwork(o1[10].toString());
                } else {
                    r1.setIsTermwork(false);
                    r1.setTermwork("--");
                }

                // Set Practical    
                if ((1 == (Integer) o1[5])) {
                    r1.setIsPractical(true);
                    r1.setPractical(o1[11].toString());
                } else {
                    r1.setIsPractical(false);
                    r1.setPractical("--");
                }

                // Set Oral    
                if ((1 == (Integer) o1[6])) {
                    r1.setIsOral(true);
                    r1.setOral(o1[12].toString());
                } else {
                    r1.setIsOral(false);
                    r1.setOral("--");
                }

                r1.setCourse_id(o1[1].toString());
                r1.setRoll_no((Integer) o1[0]);
                r1.setCredits(courseCreditList.get(o1[1].toString()));
                r1.setOutof_marks(courseMarksList.get(o1[1].toString()));
                r1.setTotal_marks(val + (Integer) o1[10] + (Integer) o1[11] + (Integer) o1[12]);
                r1.setExaminationYear(examinationYear);
                r1.setCourse_name(courseNameList.get(o1[1]));
                if (val > 0) {
                    r1.setTotalOfPT_Theory(String.valueOf(val));
                } else {
                    r1.setTotalOfPT_Theory("--");
                }

                if ((1 == (Integer) o1[2]) && (1 == (Integer) o1[3])) {
                    if (val >= 40) {
                        r1.setIsPass(true);
                        r1.setGain_credits(courseCreditList.get(o1[1].toString()));
                        r1.setIsBacklog(false);
                    } else {
                        r1.setIsPass(false);
                        r1.setIsBacklog(true);
                    }
                } else {
                    r1.setIsPass(true);
                    r1.setGain_credits(courseCreditList.get(o1[1].toString()));
                    r1.setIsBacklog(false);
                }
                out.println(courseNameList.get(o1[1].toString()) + " " + o1[1] + " " + courseCreditList.get(o1[1].toString()) + " " + o1[7] + " " + o1[8] + " " + o1[9] + " " + o1[10] + " " + o1[11] + " " + o1[12]);
                if (backlogCount > 0 && backlogCount < 10) {
                    result = "ATRNC";
                } else if (backlogCount == 0) {
                    result = "PASS";
                } else {
                    result = "DTRNC";
                }
                session1.saveOrUpdate(r1);
                r1 = null;
                r1 = new Result1();
                r1.setTerm(currentTerm);
                r1.setDepartment(department);
                r1.setYear(currentYear);

            }

            r2.setCurrent_credits(currentCredits);
            r2.setTotal_marks(grandTotal);
            r2.setOutof_marks(outOfMarks);
            r2.setPrevious_credits(previous_credits);
            r2.setTotal_credits(previous_credits + currentCredits);
            r2.setRequired_credits(200 - (previous_credits + currentCredits));
            r2.setRemark(result);
            r2.setBacklog_count(backlogCount);
            r2.setExaminationYear(examinationYear);
            session1.saveOrUpdate(r2);
            currentCredits = 0;
            backlogCount = 0;
            grandTotal = 0;
            outOfMarks = 0;
            result = "";
            tx.commit();
        }

    }

    @Override
    public String getServletInfo() {
        return "This servlet is used to generate result of all branches and all years at the same time.";
    }// </editor-fold>

}
