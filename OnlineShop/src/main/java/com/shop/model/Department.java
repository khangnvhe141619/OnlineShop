/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.model;

/**
 *
 * @author leduc
 */
public class Department {
    private int departmentId;
    private String departtmentName;
    private  String departnemtDesc;

    public Department() {
    }

    public Department(int departmentId, String departtmentName, String departnemtDesc) {
        this.departmentId = departmentId;
        this.departtmentName = departtmentName;
        this.departnemtDesc = departnemtDesc;
    }
    
    public Department(String departtmentName, String departnemtDesc) {
		super();
		this.departtmentName = departtmentName;
		this.departnemtDesc = departnemtDesc;
	}

	public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDeparttmentName() {
        return departtmentName;
    }

    public void setDeparttmentName(String departtmentName) {
        this.departtmentName = departtmentName;
    }

    public String getDepartnemtDesc() {
        return departnemtDesc;
    }

    public void setDepartnemtDesc(String departnemtDesc) {
        this.departnemtDesc = departnemtDesc;
    }

    @Override
    public String toString() {
        return "Department{" + "departmentId=" + departmentId + ", departtmentName=" + departtmentName + ", departnemtDesc=" + departnemtDesc + '}';
    }
    
}
