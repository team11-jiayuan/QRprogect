package myFactory;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * 单例模式获取工厂*/
public class MySqlSessionFactory {
	private static SqlSessionFactory mySqlSessionFactory = null;

	private static String resource = "mybatis-config.xml";

	private MySqlSessionFactory() {
	}

	// 获取sqlsessionfactory
	public static SqlSessionFactory getMyFactory() {

		if (mySqlSessionFactory == null) {
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();

			InputStream resourceAsStream = MySqlSessionFactory.class.getClassLoader().getResourceAsStream(resource);

			mySqlSessionFactory = sqlSessionFactoryBuilder.build(resourceAsStream);

		}
		return mySqlSessionFactory;
	}
}
