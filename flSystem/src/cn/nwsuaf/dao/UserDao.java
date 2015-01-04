package cn.nwsuaf.dao;

public class UserDao extends BaseDao {
	/**
	 * 重置用户口令
	 * @param loginName 登录名
	 * @throws Exception
	 */
	public void resetPasswd(String loginName) throws Exception{
		update("user.resetPasswd", loginName);
	}
	
	/**
	 * 按登录名删除用户
	 * @param loginName
	 * @throws Exception
	 */
	public void deleteById(String loginName) throws Exception{
		delete("user.deleteByLoignname", loginName);
	}
	
	/**
	 * 按条件删除学生
	 * @param where
	 * @throws Exception
	 */
	public void deleteStuByWhere(String where) throws Exception{
		delete("user.deleteStudentByWhere", where);
	}
	
	/**
	 * 指定登录名是否存在
	 * @param loginname 登录名
	 * @return
	 * @throws NumberFormatException
	 * @throws Exception
	 */
	public boolean loginNameIsExist(String loginname) throws NumberFormatException, Exception{
		return Integer.parseInt(getOne("user.loginNameIsExist", loginname).toString())>0;
	}
}
