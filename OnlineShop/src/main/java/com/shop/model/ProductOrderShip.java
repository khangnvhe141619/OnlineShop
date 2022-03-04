package com.shop.model;

public class ProductOrderShip {
	private double total;
	private String description;
	private String image;
	private String productName;
	private double price;
	private int quantity;
	private int productID;
	
	public ProductOrderShip() {
		// TODO Auto-generated constructor stub
	}

	public ProductOrderShip(double total, String description, String image, String productName, double price,
			int quantity, int productID) {
		super();
		this.total = total;
		this.description = description;
		this.image = image;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.productID = productID;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	@Override
	public String toString() {
		return "ProductOrderShip [total=" + total + ", description=" + description + ", image=" + image
				+ ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", productID="
				+ productID + "]";
	}

	
}