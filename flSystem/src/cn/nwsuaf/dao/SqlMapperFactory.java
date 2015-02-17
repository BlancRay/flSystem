package cn.nwsuaf.dao;

import java.io.IOException;
import java.io.Reader;
/**
 * 会话工厂
 * Creat By ZQ
 * Date：2014-2-10
 */
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapperFactory {
	private static SqlSessionFactory sqlSessionFactory = null;
	static{
		    String resource = "cn/nwsuaf/mapper/Mybatis-Config.xml";
		    try{
		    	Reader reader   = Resources.getResourceAsReader(resource);
		    	sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); 
		    	
		    }catch(IOException e){
		    	System.out.println("创建SqlSessionFactory实例失败");
		    	e.printStackTrace();
		    }
	}
	
	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
