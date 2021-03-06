// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.jpa.data;

import com.springroo.jpa.data.Employee;
import com.springroo.jpa.data.Phone;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

privileged aspect Phone_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "EMP_ID", referencedColumnName = "EMP_ID")
    private Employee Phone.empId;
    
    @Column(name = "PH_NO", length = 30)
    private String Phone.phNo;
    
    public Employee Phone.getEmpId() {
        return empId;
    }
    
    public void Phone.setEmpId(Employee empId) {
        this.empId = empId;
    }
    
    public String Phone.getPhNo() {
        return phNo;
    }
    
    public void Phone.setPhNo(String phNo) {
        this.phNo = phNo;
    }
    
}
