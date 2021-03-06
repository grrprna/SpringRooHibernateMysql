// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.web;

import com.springroo.jpa.data.Employee;
import com.springroo.jpa.data.Phone;
import com.springroo.web.EmployeeBean;
import com.springroo.web.util.MessageFactory;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect EmployeeBean_Roo_ManagedBean {
    
    declare @type: EmployeeBean: @ManagedBean(name = "employeeBean");
    
    declare @type: EmployeeBean: @SessionScoped;
    
    private String EmployeeBean.name = "Employees";
    
    private Employee EmployeeBean.employee;
    
    private List<Employee> EmployeeBean.allEmployees;
    
    private boolean EmployeeBean.dataVisible = false;
    
    private List<String> EmployeeBean.columns;
    
    private HtmlPanelGrid EmployeeBean.createPanelGrid;
    
    private HtmlPanelGrid EmployeeBean.editPanelGrid;
    
    private HtmlPanelGrid EmployeeBean.viewPanelGrid;
    
    private boolean EmployeeBean.createDialogVisible = false;
    
    private List<Phone> EmployeeBean.selectedPhones;
    
    @PostConstruct
    public void EmployeeBean.init() {
        columns = new ArrayList<String>();
        columns.add("empName");
        columns.add("empHireDate");
        columns.add("empSalary");
    }
    
    public String EmployeeBean.getName() {
        return name;
    }
    
    public List<String> EmployeeBean.getColumns() {
        return columns;
    }
    
    public List<Employee> EmployeeBean.getAllEmployees() {
        return allEmployees;
    }
    
    public void EmployeeBean.setAllEmployees(List<Employee> allEmployees) {
        this.allEmployees = allEmployees;
    }
    
    public String EmployeeBean.findAllEmployees() {
        allEmployees = Employee.findAllEmployees();
        dataVisible = !allEmployees.isEmpty();
        return null;
    }
    
    public boolean EmployeeBean.isDataVisible() {
        return dataVisible;
    }
    
    public void EmployeeBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid EmployeeBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void EmployeeBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid EmployeeBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void EmployeeBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid EmployeeBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void EmployeeBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid EmployeeBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText phonesCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phonesCreateOutput.setId("phonesCreateOutput");
        phonesCreateOutput.setValue("Phones:");
        htmlPanelGrid.getChildren().add(phonesCreateOutput);
        
        HtmlOutputText phonesCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phonesCreateInput.setId("phonesCreateInput");
        phonesCreateInput.setValue("This relationship is managed from the Phone side");
        htmlPanelGrid.getChildren().add(phonesCreateInput);
        
        Message phonesCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        phonesCreateInputMessage.setId("phonesCreateInputMessage");
        phonesCreateInputMessage.setFor("phonesCreateInput");
        phonesCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(phonesCreateInputMessage);
        
        OutputLabel empNameCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empNameCreateOutput.setFor("empNameCreateInput");
        empNameCreateOutput.setId("empNameCreateOutput");
        empNameCreateOutput.setValue("Emp Name:");
        htmlPanelGrid.getChildren().add(empNameCreateOutput);
        
        InputTextarea empNameCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        empNameCreateInput.setId("empNameCreateInput");
        empNameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empName}", String.class));
        LengthValidator empNameCreateInputValidator = new LengthValidator();
        empNameCreateInputValidator.setMaximum(45);
        empNameCreateInput.addValidator(empNameCreateInputValidator);
        empNameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(empNameCreateInput);
        
        Message empNameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empNameCreateInputMessage.setId("empNameCreateInputMessage");
        empNameCreateInputMessage.setFor("empNameCreateInput");
        empNameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empNameCreateInputMessage);
        
        OutputLabel empHireDateCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empHireDateCreateOutput.setFor("empHireDateCreateInput");
        empHireDateCreateOutput.setId("empHireDateCreateOutput");
        empHireDateCreateOutput.setValue("Emp Hire Date:");
        htmlPanelGrid.getChildren().add(empHireDateCreateOutput);
        
        InputText empHireDateCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        empHireDateCreateInput.setId("empHireDateCreateInput");
        empHireDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empHireDate}", String.class));
        LengthValidator empHireDateCreateInputValidator = new LengthValidator();
        empHireDateCreateInputValidator.setMaximum(30);
        empHireDateCreateInput.addValidator(empHireDateCreateInputValidator);
        empHireDateCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(empHireDateCreateInput);
        
        Message empHireDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empHireDateCreateInputMessage.setId("empHireDateCreateInputMessage");
        empHireDateCreateInputMessage.setFor("empHireDateCreateInput");
        empHireDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empHireDateCreateInputMessage);
        
        OutputLabel empSalaryCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empSalaryCreateOutput.setFor("empSalaryCreateInput");
        empSalaryCreateOutput.setId("empSalaryCreateOutput");
        empSalaryCreateOutput.setValue("Emp Salary:");
        htmlPanelGrid.getChildren().add(empSalaryCreateOutput);
        
        InputText empSalaryCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        empSalaryCreateInput.setId("empSalaryCreateInput");
        empSalaryCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empSalary}", BigDecimal.class));
        empSalaryCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(empSalaryCreateInput);
        
        Message empSalaryCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empSalaryCreateInputMessage.setId("empSalaryCreateInputMessage");
        empSalaryCreateInputMessage.setFor("empSalaryCreateInput");
        empSalaryCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empSalaryCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid EmployeeBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText phonesEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phonesEditOutput.setId("phonesEditOutput");
        phonesEditOutput.setValue("Phones:");
        htmlPanelGrid.getChildren().add(phonesEditOutput);
        
        HtmlOutputText phonesEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phonesEditInput.setId("phonesEditInput");
        phonesEditInput.setValue("This relationship is managed from the Phone side");
        htmlPanelGrid.getChildren().add(phonesEditInput);
        
        Message phonesEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        phonesEditInputMessage.setId("phonesEditInputMessage");
        phonesEditInputMessage.setFor("phonesEditInput");
        phonesEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(phonesEditInputMessage);
        
        OutputLabel empNameEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empNameEditOutput.setFor("empNameEditInput");
        empNameEditOutput.setId("empNameEditOutput");
        empNameEditOutput.setValue("Emp Name:");
        htmlPanelGrid.getChildren().add(empNameEditOutput);
        
        InputTextarea empNameEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        empNameEditInput.setId("empNameEditInput");
        empNameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empName}", String.class));
        LengthValidator empNameEditInputValidator = new LengthValidator();
        empNameEditInputValidator.setMaximum(45);
        empNameEditInput.addValidator(empNameEditInputValidator);
        empNameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(empNameEditInput);
        
        Message empNameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empNameEditInputMessage.setId("empNameEditInputMessage");
        empNameEditInputMessage.setFor("empNameEditInput");
        empNameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empNameEditInputMessage);
        
        OutputLabel empHireDateEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empHireDateEditOutput.setFor("empHireDateEditInput");
        empHireDateEditOutput.setId("empHireDateEditOutput");
        empHireDateEditOutput.setValue("Emp Hire Date:");
        htmlPanelGrid.getChildren().add(empHireDateEditOutput);
        
        InputText empHireDateEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        empHireDateEditInput.setId("empHireDateEditInput");
        empHireDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empHireDate}", String.class));
        LengthValidator empHireDateEditInputValidator = new LengthValidator();
        empHireDateEditInputValidator.setMaximum(30);
        empHireDateEditInput.addValidator(empHireDateEditInputValidator);
        empHireDateEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(empHireDateEditInput);
        
        Message empHireDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empHireDateEditInputMessage.setId("empHireDateEditInputMessage");
        empHireDateEditInputMessage.setFor("empHireDateEditInput");
        empHireDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empHireDateEditInputMessage);
        
        OutputLabel empSalaryEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        empSalaryEditOutput.setFor("empSalaryEditInput");
        empSalaryEditOutput.setId("empSalaryEditOutput");
        empSalaryEditOutput.setValue("Emp Salary:");
        htmlPanelGrid.getChildren().add(empSalaryEditOutput);
        
        InputText empSalaryEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        empSalaryEditInput.setId("empSalaryEditInput");
        empSalaryEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empSalary}", BigDecimal.class));
        empSalaryEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(empSalaryEditInput);
        
        Message empSalaryEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        empSalaryEditInputMessage.setId("empSalaryEditInputMessage");
        empSalaryEditInputMessage.setFor("empSalaryEditInput");
        empSalaryEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(empSalaryEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid EmployeeBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText phonesLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phonesLabel.setId("phonesLabel");
        phonesLabel.setValue("Phones:");
        htmlPanelGrid.getChildren().add(phonesLabel);
        
        HtmlOutputText phonesValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        phonesValue.setId("phonesValue");
        phonesValue.setValue("This relationship is managed from the Phone side");
        htmlPanelGrid.getChildren().add(phonesValue);
        
        HtmlOutputText empNameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empNameLabel.setId("empNameLabel");
        empNameLabel.setValue("Emp Name:");
        htmlPanelGrid.getChildren().add(empNameLabel);
        
        InputTextarea empNameValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        empNameValue.setId("empNameValue");
        empNameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empName}", String.class));
        empNameValue.setReadonly(true);
        empNameValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(empNameValue);
        
        HtmlOutputText empHireDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empHireDateLabel.setId("empHireDateLabel");
        empHireDateLabel.setValue("Emp Hire Date:");
        htmlPanelGrid.getChildren().add(empHireDateLabel);
        
        HtmlOutputText empHireDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empHireDateValue.setId("empHireDateValue");
        empHireDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empHireDate}", String.class));
        htmlPanelGrid.getChildren().add(empHireDateValue);
        
        HtmlOutputText empSalaryLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empSalaryLabel.setId("empSalaryLabel");
        empSalaryLabel.setValue("Emp Salary:");
        htmlPanelGrid.getChildren().add(empSalaryLabel);
        
        HtmlOutputText empSalaryValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        empSalaryValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{employeeBean.employee.empSalary}", String.class));
        htmlPanelGrid.getChildren().add(empSalaryValue);
        
        return htmlPanelGrid;
    }
    
    public Employee EmployeeBean.getEmployee() {
        if (employee == null) {
            employee = new Employee();
        }
        return employee;
    }
    
    public void EmployeeBean.setEmployee(Employee employee) {
        this.employee = employee;
    }
    
    public List<Phone> EmployeeBean.getSelectedPhones() {
        return selectedPhones;
    }
    
    public void EmployeeBean.setSelectedPhones(List<Phone> selectedPhones) {
        if (selectedPhones != null) {
            employee.setPhones(new HashSet<Phone>(selectedPhones));
        }
        this.selectedPhones = selectedPhones;
    }
    
    public String EmployeeBean.onEdit() {
        if (employee != null && employee.getPhones() != null) {
            selectedPhones = new ArrayList<Phone>(employee.getPhones());
        }
        return null;
    }
    
    public boolean EmployeeBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void EmployeeBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String EmployeeBean.displayList() {
        createDialogVisible = false;
        findAllEmployees();
        return "employee";
    }
    
    public String EmployeeBean.displayCreateDialog() {
        employee = new Employee();
        createDialogVisible = true;
        return "employee";
    }
    
    public String EmployeeBean.persist() {
        String message = "";
        if (employee.getEmpId() != null) {
            employee.merge();
            message = "message_successfully_updated";
        } else {
            employee.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Employee");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEmployees();
    }
    
    public String EmployeeBean.delete() {
        employee.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Employee");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEmployees();
    }
    
    public void EmployeeBean.reset() {
        employee = null;
        selectedPhones = null;
        createDialogVisible = false;
    }
    
    public void EmployeeBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
