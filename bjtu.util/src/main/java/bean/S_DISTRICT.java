package bean;

import java.util.Date;

public class S_DISTRICT {
	private String DistrictID;
	private String DistrictName;
	private int CityID;
	private Date DateCreated;
	private Date DateUpdated;
	public String getDistrictID() {
		return DistrictID;
	}
	public void setDistrictID(String districtID) {
		DistrictID = districtID;
	}
	public String getDistrictName() {
		return DistrictName;
	}
	public void setDistrictName(String districtName) {
		DistrictName = districtName;
	}
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
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
