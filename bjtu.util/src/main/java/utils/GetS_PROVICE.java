package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import bean.S_PROVINCE;
import bean.U_CLASS;
import myFactory.MySqlSessionFactory;
import myMapper.AddressMapper;
import myMapper.ClassMapper;

public class GetS_PROVICE {

	public static void main(String[] args) throws UnsupportedEncodingException, IOException {
		SqlSessionFactory myFactory = MySqlSessionFactory.getMyFactory();

		SqlSession openSession = myFactory.openSession();

		AddressMapper mapper = openSession.getMapper(AddressMapper.class);

		List<S_PROVINCE> s_province = mapper.getProvince();

		// 集合转化为json集合
		Gson gson = new Gson();

		String json = gson.toJson(s_province);

		// 将json集合输出成文件
		FileOutputStream fos = new FileOutputStream(new File("d:/json/s_province.js"));

		fos.write(json.getBytes("utf-8"));

	}


}
