package cn.nwsuaf.dao;

import cn.nwsuaf.bean.LoginUserBean;

import org.apache.ibatis.session.SqlSession;

public class LoginUserDao{
	private SqlSession sqlSession;
	
	/**
	 * 用户登录
	 * @param LoginUser
	 * @return boolean
	 * @throws Exception
	 */
	public LoginUserBean login(LoginUserBean user) throws Exception{
		sqlSession = SqlMapperFactory.getSqlSessionFactory().openSession();
		LoginUserBean lu;
		try{
			lu = (LoginUserBean)sqlSession.selectOne("Login.login", user);
		}
		finally{
			sqlSession.close();
		}
		return lu;
	}
}