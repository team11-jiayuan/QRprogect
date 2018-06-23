package com.quezu.pojo;

import java.math.BigDecimal;
import java.util.Date;

import com.quezu.util.BasePojo;

public class Product extends BasePojo {

	private static final long serialVersionUID = 1L;
	
	//物品id
	private Integer id;
	//物主id
	private Integer userId;
	//物品名称
	private String productName;
	//物品描述
	private String description;
	//首选图片
	private String primaryImg;
	//物品数量
	private Integer amount;
	//物品分类
	private String category;
	//物品子类
	private String subCategory;
	//所在省
	private String provinceID;
	//所在市
	private String cityID;
	//所在区
	private String districtID;
	//租赁方式
	private String mode;
	//押金
	private BigDecimal deposit;
	//租金
	private BigDecimal rent;
	//发布时间
	private Date publishTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrimaryImg() {
		return primaryImg;
	}
	public void setPrimaryImg(String primaryImg) {
		this.primaryImg = primaryImg;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getProvinceID() {
		return provinceID;
	}
	public void setProvinceID(String provinceID) {
		this.provinceID = provinceID;
	}
	public String getCityID() {
		return cityID;
	}
	public void setCityID(String cityID) {
		this.cityID = cityID;
	}
	public String getDistrictID() {
		return districtID;
	}
	public void setDistrictID(String districtID) {
		this.districtID = districtID;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public BigDecimal getDeposit() {
		return deposit;
	}
	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}
	public BigDecimal getRent() {
		return rent;
	}
	public void setRent(BigDecimal rent) {
		this.rent = rent;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
}
