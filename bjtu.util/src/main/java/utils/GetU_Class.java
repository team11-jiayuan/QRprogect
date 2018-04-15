package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import bean.U_CLASS;
import myFactory.MySqlSessionFactory;
import myMapper.ClassMapper;

public class GetU_Class {
	public static void main(String[] args) throws UnsupportedEncodingException, IOException {
		SqlSessionFactory myFactory = MySqlSessionFactory.getMyFactory();

		SqlSession openSession = myFactory.openSession();

		ClassMapper mapper = openSession.getMapper(ClassMapper.class);

		List<U_CLASS> u_classes = mapper.getAllClass();

		// 集合转化为json集合
		Gson gson = new Gson();

		String json = gson.toJson(u_classes);

		// 将json集合输出成文件
		FileOutputStream fos = new FileOutputStream(new File("d:/class.js"));

		fos.write(json.getBytes("utf-8"));

	}

}
