package cn.nwsuaf.dao;

import java.util.HashMap;
import java.util.List;

public class TStudentDao extends BaseDao {

	private HashMap<String, Object> params;

	/**
	 * 学生列表
	 * 
	 * @param where
	 * @param pg
	 * @param pgSize
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> getStuList(String loginName)
			throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		List<?> res = getList("tstudent.stulist", loginName);
//		String num = getOne("tstudent.stuNum", loginName).toString();
		param.clear();
		param.put("recs", res);
//		param.put("num", num);
		return param;
	}

	public HashMap<String, Object> getAllStuList(String loginName)
			throws Exception {
		params = new HashMap<String, Object>();
		List<?> tts = getList("tstudent.getAllStu", loginName);// mapper包.方法名id
//		String count = getOne("tstudent.getSelectedCount", loginName).toString();
		HashMap<String, Object> res = new HashMap<String, Object>();
//		res.put("num", count);
		res.put("recs", tts);
		return res;
	}

	/**
	 * 按学号删除学生
	 * 
	 * @param stuId
	 *            学号
	 * @throws Exception
	 */
	public void delete(String ids) throws Exception {
		params = new HashMap<String, Object>();
		params.put("studentid", ids);
		delete("TStudent.deleteByStudentid", params);
	}
}