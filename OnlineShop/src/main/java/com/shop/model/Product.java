package com.shop.model;

import java.time.LocalDateTime;

public class Product {
	private int stt;
	private int productID;
	private int categoryId;
	private String cateName;
	private String productName;
	private String image;
	private String description;
	private LocalDateTime createdDate;
	private String issuingCompany;
	private LocalDateTime publicationDate;
	private int coverType;
	private String publishingCompany;
	private int quantity;
	private double price;
	private int numberPage;

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int stt, int productID, int categoryId, String productName, String image, String description,
			LocalDateTime createdDate, String issuingCompany, LocalDateTime publicationDate, int coverType,
			String publishingCompany, int quantity, double price, int numberPage) {
		super();
		this.stt = stt;
		this.productID = productID;
		this.categoryId = categoryId;
		this.productName = productName;
		this.image = image;
		this.description = description;
		this.createdDate = createdDate;
		this.issuingCompany = issuingCompany;
		this.publicationDate = publicationDate;
		this.coverType = coverType;
		this.publishingCompany = publishingCompany;
		this.quantity = quantity;
		this.price = price;
		this.numberPage = numberPage;
	}
	

	public Product(int stt, int productID, String cateName, String productName, int quantity, double price) {
		super();
		this.stt = stt;
		this.productID = productID;
		this.cateName = cateName;
		this.productName = productName;
		this.quantity = quantity;
		this.price = price;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public Product(int productID, int categoryId, String productName, String image, String description,
			LocalDateTime createdDate, String issuingCompany, LocalDateTime publicationDate, int coverType,
			String publishingCompany, int quantity, double price, int numberPage) {
		super();
		this.productID = productID;
		this.categoryId = categoryId;
		this.productName = productName;
		this.image = image;
		this.description = description;
		this.createdDate = createdDate;
		this.issuingCompany = issuingCompany;
		this.publicationDate = publicationDate;
		this.coverType = coverType;
		this.publishingCompany = publishingCompany;
		this.quantity = quantity;
		this.price = price;
		this.numberPage = numberPage;
	}

	public Product(int categoryId, String productName, String image, String description, LocalDateTime createdDate,
			String issuingCompany, LocalDateTime publicationDate, int coverType, String publishingCompany, int quantity,
			double price, int numberPage) {
		super();
		this.categoryId = categoryId;
		this.productName = productName;
		this.image = image;
		this.description = description;
		this.createdDate = createdDate;
		this.issuingCompany = issuingCompany;
		this.publicationDate = publicationDate;
		this.coverType = coverType;
		this.publishingCompany = publishingCompany;
		this.quantity = quantity;
		this.price = price;
		this.numberPage = numberPage;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}



	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public String getIssuingCompany() {
		return issuingCompany;
	}

	public void setIssuingCompany(String issuingCompany) {
		this.issuingCompany = issuingCompany;
	}

	public LocalDateTime getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(LocalDateTime publicationDate) {
		this.publicationDate = publicationDate;
	}

	public int getCoverType() {
		return coverType;
	}

	public void setCoverType(int coverType) {
		this.coverType = coverType;
	}

	public String getPublishingCompany() {
		return publishingCompany;
	}

	public void setPublishingCompany(String publishingCompany) {
		this.publishingCompany = publishingCompany;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getNumberPage() {
		return numberPage;
	}

	public void setNumberPage(int numberPage) {
		this.numberPage = numberPage;
	}

	@Override
	public String toString() {
		return "Product [stt=" + stt + ", productID=" + productID + ", categoryId=" + categoryId + ", productName="
				+ productName + ", image=" + image + ", description=" + description + ", createdDate=" + createdDate
				+ ", issuingCompany=" + issuingCompany + ", publicationDate=" + publicationDate + ", coverType="
				+ coverType + ", publishingCompany=" + publishingCompany + ", quantity=" + quantity + ", price=" + price
				+ ", numberPage=" + numberPage + "]";
	}

}
