package myMapper;

import java.util.List;

import bean.S_CITY;
import bean.S_DISTRICT;
import bean.S_PROVINCE;

public interface AddressMapper {
	// 获取省
	public List<S_PROVINCE> getProvince();

	// 获取市
	public List<S_CITY> getCity(int id);
	// 获取市
	public List<S_CITY> getCitys();

	// 获取地区
	public List<S_DISTRICT> getDistrict(int id);

}
