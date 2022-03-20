package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.shop.dao.DepartmentDAO;
import com.shop.model.Department;
import com.shop.utils.DBConnection;
import com.shop.utils.SQLCommand;

public class DepartmentDAOImpl implements DepartmentDAO {
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;

	@Override
	public List<Department> getListDepartments(int index) throws SQLException {
		List<Department> departments = new ArrayList<>();
		Department department = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_DEPARTMENTS);
			pre.setInt(1, index);
			pre.setInt(2, index);
			rs = pre.executeQuery();
			while (rs.next()) {
				department = new Department();
				department.setDepartmentId(rs.getInt("DepartmentID"));
				department.setDeparttmentName(rs.getString("DepartmentName"));
				department.setDepartnemtDesc(rs.getString("DepartmentDesc"));
				departments.add(department);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return departments;
	}
	
	@Override
	public List<Department> getListAllDepartments() throws SQLException {
		List<Department> departments = new ArrayList<>();
		Department department = null;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_LIST_ALL_DEPARTMENT);
			rs = pre.executeQuery();
			while (rs.next()) {
				department = new Department();
				department.setDepartmentId(rs.getInt("DepartmentID"));
				department.setDeparttmentName(rs.getString("DepartmentName"));
				department.setDepartnemtDesc(rs.getString("DepartmentDesc"));
				departments.add(department);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return departments;
	}

	@Override
	public boolean getDeleteDepartments(int id) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			System.out.println(id);
			pre = con.prepareStatement(SQLCommand.GET_DELETE_DEPARTMENTS);
			pre.setInt(1, id);
			check = pre.executeUpdate() == 1;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return check;
	}

	@Override
	public boolean getInsertDepartments(Department department) throws SQLException {
		boolean check = false;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_INSERT_DEPARTMENTS);
			pre.setString(1, department.getDeparttmentName());
			pre.setString(2, department.getDepartnemtDesc());
			check = pre.executeUpdate() == 1;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return check;
	}
	
	@Override
	public int getCountDepartments() throws SQLException {
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(SQLCommand.GET_COUNT_DEPARTMENTS);
			rs = pre.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return 0;
	}

	public static void main(String[] args) throws SQLException {
		DepartmentDAO dao = new DepartmentDAOImpl();
		List<Department> list = dao.getListDepartments(2);
		for (Department department : list) {
			System.out.println(department.toString());
		}
//		if(check == true) {
//			System.out.println("true");
//		} else {
//			System.out.println("false");
//		}
	}

	@Override
	public int countAccountByID(int id) throws SQLException {
		String sql = "SELECT COUNT(*) FROM Account A, Department D WHERE D.DepartmentID = A.Role AND D.DepartmentID = ?";
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			pre = con.prepareStatement(sql);
			pre.setInt(1, id);
			rs = pre.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pre != null) {
				pre.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
}
