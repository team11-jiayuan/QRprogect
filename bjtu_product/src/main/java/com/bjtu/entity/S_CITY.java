package com.bjtu.entity;

import java.util.Date;

public class S_CITY {
	private int CityID;
	private String CityName;
	private String ZipCode;
	private String ProvinceID;
	private Date DateCreated;
	private Date DateUpdated;
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
	}
	public String getCityName() {
		return CityName;
	}
	public void setCityName(String cityName) {
		CityName = cityName;
	}
	public String getZipCode() {
		return ZipCode;
	}
	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}
	public String getProvinceID() {
		return ProvinceID;
	}
	public void setProvinceID(String provinceID) {
		ProvinceID = provinceID;
	}
	public Date getDateCreated() {
		return DateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		DateCreated = dateCreated;
	}
	public Date getDateUpdated() {
		return DateUpdated;
	}
	public void setDateUpdated(Date dateUpdated) {
		DateUpdated = dateUpdated;
	}

}
