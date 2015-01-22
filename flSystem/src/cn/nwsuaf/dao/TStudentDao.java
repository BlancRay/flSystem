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
	public HashMap<String, Object> getStuList(String where, int pg, int pgSize)
			throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("where", where);
		param.put("offset", (pg - 1) * pgSize);
		param.put("pgSize", pgSize);
		List<?> res = getList("tstudent.stulist", param);
		String num = getOne("tstudent.stuNum", param).toString();
		param.clear();
		param.put("rows", res);
		param.put("total", num);
		return param;
	}

	public HashMap<String, Object> getTtsByPageAndCount(int page, int pgSize)
			throws Exception {
		System.out.println("tsDao.list.getlist");
		params = new HashMap<String, Object>();
		page = page > 0 ? page : 1;
		System.out.println(page);
		params.put("offset", (page - 1) * pgSize);
		params.put("pgSize", pgSize);
		System.out.println(params.size());
		List<?> tts = getList("tstudent.getTtsByPage", params);// mapper包.方法名id
		System.out.println(tts.size());
		int count = (Integer) getOne("tstudent.getCount");
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("total", count);
		res.put("rows", tts);
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