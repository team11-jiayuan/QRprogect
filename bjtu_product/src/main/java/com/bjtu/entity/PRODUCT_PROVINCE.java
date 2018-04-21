package com.bjtu.entity;

public class PRODUCT_PROVINCE {
	private int Id;
	private String shp_mch;
	private String shp_tp;
	private int flbh;
	private int yh_id;
	private int shp_zt;
	private int province_id;
	private int city_id;
	private int district_id;
	private S_PROVINCE province;
	private S_CITY city;
	private S_DISTRICT district;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getShp_mch() {
		return shp_mch;
	}
	public void setShp_mch(String shp_mch) {
		this.shp_mch = shp_mch;
	}
	public String getShp_tp() {
		return shp_tp;
	}
	public void setShp_tp(String shp_tp) {
		this.shp_tp = shp_tp;
	}
	public int getFlbh() {
		return flbh;
	}
	public void setFlbh(int flbh) {
		this.flbh = flbh;
	}
	public int getYh_id() {
		return yh_id;
	}
	public void setYh_id(int yh_id) {
		this.yh_id = yh_id;
	}
	public int getShp_zt() {
		return shp_zt;
	}
	public void setShp_zt(int shp_zt) {
		this.shp_zt = shp_zt;
	}
	public int getProvince_id() {
		return province_id;
	}
	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	public int getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(int district_id) {
		this.district_id = district_id;
	}
	public S_PROVINCE getProvince() {
		return province;
	}
	public void setProvince(S_PROVINCE province) {
		this.province = province;
	}
	public S_CITY getCity() {
		return city;
	}
	public void setCity(S_CITY city) {
		this.city = city;
	}
	public S_DISTRICT getDistrict() {
		return district;
	}
	public void setDistrict(S_DISTRICT district) {
		this.district = district;
	}
	
}
