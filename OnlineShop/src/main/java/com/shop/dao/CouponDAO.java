package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.model.Coupon;

public interface CouponDAO {
	public List<Coupon> getListCoupon(int index) throws SQLException;

	public Boolean insertCoupon(Coupon coupon) throws SQLException;

	public int countCoupon() throws SQLException;

	public boolean updateCoupon(Coupon coupon) throws SQLException;

	public boolean deleteCoupon(String couponID) throws SQLException;

	public Coupon getCouponbyID(String code) throws SQLException;
	
	public boolean decreasedCoupon(String id) throws SQLException;
}
