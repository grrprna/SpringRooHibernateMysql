// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.jpa.data;

import com.springroo.jpa.data.Employee;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Employee_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Employee.entityManager;
    
    public static final List<String> Employee.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager Employee.entityManager() {
        EntityManager em = new Employee().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Employee.countEmployees() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Employee o", Long.class).getSingleResult();
    }
    
    public static List<Employee> Employee.findAllEmployees() {
        return entityManager().createQuery("SELECT o FROM Employee o", Employee.class).getResultList();
    }
    
    public static List<Employee> Employee.findAllEmployees(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Employee o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Employee.class).getResultList();
    }
    
    public static Employee Employee.findEmployee(Integer empId) {
        if (empId == null) return null;
        return entityManager().find(Employee.class, empId);
    }
    
    public static List<Employee> Employee.findEmployeeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Employee o", Employee.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Employee> Employee.findEmployeeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Employee o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Employee.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Employee.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Employee.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Employee attached = Employee.findEmployee(this.empId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Employee.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Employee.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Employee Employee.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Employee merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
