package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import bean.S_CITY;
import bean.S_PROVINCE;
import myFactory.MySqlSessionFactory;
import myMapper.AddressMapper;

public class GetS_CITY {

	public static void main(String[] args) throws UnsupportedEncodingException, IOException {
		SqlSessionFactory myFactory = MySqlSessionFactory.getMyFactory();

		SqlSession openSession = myFactory.openSession();

		AddressMapper mapper = openSession.getMapper(AddressMapper.class);

		List<S_PROVINCE> provinces = mapper.getProvince();

		for (int i = 0; i < provinces.size(); i++) {

			int id = provinces.get(i).getProvinceID();

			List<S_CITY> citys = mapper.getCity(id);

			// 集合转化为json集合
			Gson gson = new Gson();
			String json = gson.toJson(citys);

			// 将json集合输出成文件
			FileOutputStream fos = new FileOutputStream(new File("d:/json/city_" + id + ".js"));

			fos.write(json.getBytes("utf-8"));
		}
	}
}
