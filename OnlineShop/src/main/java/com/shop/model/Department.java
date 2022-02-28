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
    
}
