package com.shop.model;
//123
public class Category {
	private int stt;
	private int categoryID;
	private String categoryName;

	public Category() {
		// TODO Auto-generated constructor stub
	}

	
	public Category(String categoryName) {
		super();
		this.categoryName = categoryName;
	}
	


	public Category(int categoryID, String categoryName) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}


	public Category(int stt,int categoryID, String categoryName) {
		super();
		this.stt=stt;
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	@Override
	public String toString() {
		return "Category [stt=" + stt + ", categoryID=" + categoryID + ", categoryName=" + categoryName + "]";
	}

	
}
