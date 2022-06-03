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
public class Admin_info {
    private int id;
    private String currentTerm;
    private String currentExaminationYear;
    private boolean isResultDeclared;
    private String lastExaminationYear;
    public Admin_info(){
        
    }
    public Admin_info(int id, String lastExaminationYear, String currentTerm, String currentExaminationYear){
        this.id = id;
        this.currentTerm = currentTerm;
        this.currentExaminationYear = currentExaminationYear;
        this.lastExaminationYear = lastExaminationYear;
    }
    public String getCurrentTerm() {
        return currentTerm;
    }

    public Admin_info(int id, String currentTerm, String currentExaminationYear) {
        this.id = id;
        this.currentTerm = currentTerm;
        this.currentExaminationYear = currentExaminationYear;
    }

    public void setCurrentTerm(String currentTerm) {
        this.currentTerm = currentTerm;
    }

    public String getCurrentExaminationYear() {
        return currentExaminationYear;
    }

    public void setCurrentExaminationYear(String currentExaminationYear) {
        this.currentExaminationYear = currentExaminationYear;
    }

    public boolean isIsResultDeclared() {
        return isResultDeclared;
    }

    public void setIsResultDeclared(boolean isResultDeclared) {
        this.isResultDeclared = isResultDeclared;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastExaminationYear() {
        return lastExaminationYear;
    }

    public void setLastExaminationYear(String lastExaminationYear) {
        this.lastExaminationYear = lastExaminationYear;
    }
        
}
