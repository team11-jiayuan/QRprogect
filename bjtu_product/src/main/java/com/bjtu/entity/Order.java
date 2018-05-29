package com.bjtu.entity;

import java.math.BigDecimal;

public class Order {
	/*
	 * `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `shp_id` int(11) NOT NULL,
  `order_zj` decimal(10,0) DEFAULT NULL,
  `order_yj` decimal(10,0) DEFAULT NULL,
  `order_hj` decimal(10,0) DEFAULT NULL,
  `order_kssj` date DEFAULT NULL,
  `order_jssj` date DEFAULT NULL,
  `order_day` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,*/
	private int id;
	private int customer_id;
	private int shp_id;
	private BigDecimal order_zj;
	private BigDecimal order_yj;
	private BigDecimal order_hj;
	private String order_kssj;
	private String order_jssj;
	private int order_day;
	private int order_num;
	private String order_zt;
	private int user_id;
	private String shp_mch;
	private String shp_tp;
	public Order() {
		super();
	}
	public Order(int id, int customer_id, int shp_id, BigDecimal order_zj, BigDecimal order_yj, BigDecimal order_hj,
			String order_kssj, String order_jssj, int order_day, int order_num, String order_zt, int user_id, String shp_mch, String shp_tp) {
		super();
		this.id = id;
		this.customer_id = customer_id;
		this.shp_id = shp_id;
		this.order_zj = order_zj;
		this.order_yj = order_yj;
		this.order_hj = order_hj;
		this.order_kssj = order_kssj;
		this.order_jssj = order_jssj;
		this.order_day = order_day;
		this.order_num = order_num;
		this.order_zt = order_zt;
		this.user_id = user_id;
		this.shp_mch = shp_mch;
		this.shp_tp = shp_tp;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public int getShp_id() {
		return shp_id;
	}
	public void setShp_id(int shp_id) {
		this.shp_id = shp_id;
	}
	public BigDecimal getOrder_zj() {
		return order_zj;
	}
	public void setOrder_zj(BigDecimal order_zj) {
		this.order_zj = order_zj;
	}
	public BigDecimal getOrder_yj() {
		return order_yj;
	}
	public void setOrder_yj(BigDecimal order_yj) {
		this.order_yj = order_yj;
	}
	public BigDecimal getOrder_hj() {
		return order_hj;
	}
	public void setOrder_hj(BigDecimal order_hj) {
		this.order_hj = order_hj;
	}
	public String getOrder_kssj() {
		return order_kssj;
	}
	public void setOrder_kssj(String order_kssj) {
		this.order_kssj = order_kssj;
	}
	public String getOrder_jssj() {
		return order_jssj;
	}
	public void setOrder_jssj(String order_jssj) {
		this.order_jssj = order_jssj;
	}
	public int getOrder_day() {
		return order_day;
	}
	public void setOrder_day(int order_day) {
		this.order_day = order_day;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_zt() {
		return order_zt;
	}
	public void setOrder_zt(String order_zt) {
		this.order_zt = order_zt;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	

}
