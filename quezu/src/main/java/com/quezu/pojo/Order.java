package com.quezu.pojo;

import java.math.BigDecimal;
import java.util.Date;

import com.quezu.util.BasePojo;

public class Order extends BasePojo {

	private static final long serialVersionUID = 1L;
	//订单id
	private String id;
	//物品id
	private String productId;
	//物主id
	private Integer ownerId;
	//承租人id
	private Integer renterId;
	//订单状态
	private Integer status;
	//租用时长(天/月)
	private Integer daysOrMonths;
	//申请延长的天数/月数
	private Integer extendDate;
	//起租日期
	private Date startTime;
	//结束日期
	private Date stopTime;
	//合计金额
	private BigDecimal total;
	//订单最后更新时间
	private Date updateTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}
	public Integer getRenterId() {
		return renterId;
	}
	public void setRenterId(Integer renterId) {
		this.renterId = renterId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDaysOrMonths() {
		return daysOrMonths;
	}
	public void setDaysOrMonths(Integer daysOrMonths) {
		this.daysOrMonths = daysOrMonths;
	}
	public Integer getExtendDate() {
		return extendDate;
	}
	public void setExtendDate(Integer extendDate) {
		this.extendDate = extendDate;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getStopTime() {
		return stopTime;
	}
	public void setStopTime(Date stopTime) {
		this.stopTime = stopTime;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
