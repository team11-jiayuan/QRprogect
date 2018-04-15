package bean;

import java.util.Date;

public class S_PROVINCE {
	private int ProvinceID;
	private String ProvinceName;
	private Date DateCreated;
	private Date DateUpdated;
	public int getProvinceID() {
		return ProvinceID;
	}
	public void setProvinceID(int provinceID) {
		ProvinceID = provinceID;
	}
	public String getProvinceName() {
		return ProvinceName;
	}
	public void setProvinceName(String provinceName) {
		ProvinceName = provinceName;
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
