package com.shop.dao;

import java.sql.SQLException;
import java.util.List;
import com.shop.model.Department;

public interface DepartmentDAO {
	List<Department> getListDepartments() throws SQLException;
	
	boolean getDeleteDepartments(int id) throws SQLException;
	
	boolean getInsertDepartments(Department department) throws SQLException;
}