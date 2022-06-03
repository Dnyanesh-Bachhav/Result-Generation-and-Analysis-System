/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;


/**
 *
 * @author DELL
 */
public class student{
    private int regno;
    private int Theory,Practical,Oral,Periodic_Test,Termwork;
    private String course_code;

    public int getRegno() {
        return regno;
    }

    public void setRegno(int regno) {
        this.regno = regno;
    }

    public int getTheory() {
        return Theory;
    }

    public void setTheory(int Theory) {
        this.Theory = Theory;
    }

    public int getPractical() {
        return Practical;
    }

    public void setPractical(int Practical) {
        this.Practical = Practical;
    }

    public int getOral() {
        return Oral;
    }

    public void setOral(int Oral) {
        this.Oral = Oral;
    }

    public int getPeriodic_Test() {
        return Periodic_Test;
    }

    public void setPeriodic_Test(int Periodic_Test) {
        this.Periodic_Test = Periodic_Test;
    }

    public int getTermwork() {
        return Termwork;
    }

    public void setTermwork(int Termwork) {
        this.Termwork = Termwork;
    }

    public String getCourse_code() {
        return course_code;
    }

    public void setCourse_code(String course_code) {
        this.course_code = course_code;
    }
}
