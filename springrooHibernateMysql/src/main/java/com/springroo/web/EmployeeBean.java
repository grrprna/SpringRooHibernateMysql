package com.springroo.web;
import com.springroo.jpa.data.Employee;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Employee.class, beanName = "employeeBean")
public class EmployeeBean {
}
