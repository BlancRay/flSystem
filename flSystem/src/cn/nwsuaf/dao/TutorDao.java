package cn.nwsuaf.dao;

import java.util.HashMap;
import java.util.List;

public class TutorDao extends BaseDao {

	private HashMap<String, Object> params;
	
	
	public HashMap<String, Object> getTtsByPageAndCount(int page, int pgSize)
			throws Exception {
		params = new HashMap<String, Object>();
		page = page > 0 ? page : 1;
		params.put("offset", (page - 1) * pgSize);
		params.put("pgSize", pgSize);
		List<?> tts = getList("tutorlist.getTutorListByPage", params);// mapper包.方法名id
		int count = (Integer) getOne("tutorlist.getCount");
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("total", count);
		res.put("rows", tts);
		return res;
	}
}
