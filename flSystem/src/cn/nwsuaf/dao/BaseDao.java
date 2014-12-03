/**
 * 数据库操作基类
 * Create By ZQ
 * Date：2014-9-1
 */
package cn.nwsuaf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BaseDao {
	
	public SqlSession getSqlSession() throws Exception{
		SqlSessionFactory sf = SqlMapperFactory.getSqlSessionFactory();
		if(sf == null){
			throw new Exception("创建SqlSessionFactory实例失败");
		}
		SqlSession session = sf.openSession();
		if(session == null){
			throw new Exception("打开SQL会话失败");
		}
		return session;
	}
	
	/**
	 * 得到列表
	 * @param map SQL映射
	 * @return  map列表
	 * @throws Exception
	 */
	protected List<?> getList(String map) throws Exception{
		SqlSession session = getSqlSession();
		try{
			return session.selectList(map);
		}
		finally{
			session.close();
		}
	}
	/**
	 * 得到列表，带参数
	 * @param map SQL映射
	 * @param params 查询参数
	 * @return map列表
	 * @throws Exception
	 */
	protected List<?> getList(String map,Object params) throws Exception{
		SqlSession session = getSqlSession();
		try{
			return session.selectList(map,params);
		}
		finally{
			session.close();
		}
	}
	
	/**
	 * 得到一个对象
	 * @param map SQL映射
	 * @return 单个查询结果
	 * @throws Exception
	 */
	protected Object getOne(String map) throws Exception{
		SqlSession session = getSqlSession();
		try{
			return session.selectOne(map);
		}
		finally{
			session.close();
		}
	}
	
	/**
	 * 得到一个对象
	 * @param map SQL映射
	 * @param params 查询参数
	 * @return 单个查询结果
	 * @throws Exception
	 */
	protected Object getOne(String map,Object params) throws Exception{
		SqlSession session = getSqlSession();
		try{
			return session.selectOne(map,params);
		}
		finally{
			session.close();
		}
	}
	
	/**
	 * 插入一条记录
	 * @param map SQL映射
	 * @param params 待插入对象
	 * @throws Exception
	 */
	protected void insert(String map,Object params) throws Exception{
		SqlSession session = getSqlSession();
		try{
			session.insert(map, params);
			session.commit();
		}
		finally{
			session.close();
		}
	}
	
	
	/**
	 * 更新一条记录
	 * @param map SQL映射
	 * @param params 待更新对象
	 * @throws Exception
	 */
	protected void update(String map,Object params) throws Exception{
		SqlSession session = getSqlSession();
		try{
			session.update(map, params);
			session.commit();
		}
		finally{
			session.close();
		}
	}
	
	/**
	 * 删除记录
	 * @param map SQL映射
	 * @throws Exception
	 */
	protected void delete(String map)throws Exception{
		SqlSession session = getSqlSession();
		try{
			session.delete(map);
			session.commit();
		}
		finally{
			session.close();
		}
	}
	
	/**
	 * 删除记录 带参数
	 * @param map SQL映射
	 * @param params 删除参数
	 * @throws Exception
	 */
	protected void delete(String map,Object params)throws Exception{
		SqlSession session = getSqlSession();
		try{
			session.delete(map,params);
			session.commit();
		}
		finally{
			session.close();
		}
	}
	
	/**
	 * 通过id查找
	 * @param map SQL映射
	 * @throws Exception
	 */
	protected Object getById(String type,Object id) throws Exception{
		SqlSession session = getSqlSession();
		try {
			return session.selectOne(type,id);
		} finally {
			session.close();
		}
	}
	
	/**
	 * 通过参数查找（类型分类用）
	 * @param map SQL映射
	 * @throws Exception 
	 */
	protected List<?> getByParameter(String type,Object value) throws Exception{
		SqlSession session = getSqlSession();	
		try {
			return session.selectList(type,value);
		} catch(Exception ex)
		{
			System.out.println("出错了："+ex.getMessage());
			return null;
		}
		finally {
			session.close();
		}
	}
	
}
