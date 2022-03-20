package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Department;

public interface DepartmentDAO {
	List<Department> getListDepartments(int index) throws SQLException;
	
	boolean getDeleteDepartments(int id) throws SQLException;
	
	boolean getInsertDepartments(Department department) throws SQLException;
	
	int getCountDepartments() throws SQLException;
	
	List<Department> getListAllDepartments() throws SQLException;
	
	int countAccountByID(int id) throws SQLException;
}
