package cn.nwsuaf.dao;

import java.util.HashMap;
import java.util.List;


public class TtsDao extends BaseDao {

	public HashMap<String, Object> getTtsList(String where, int pg, int pgSize)
			throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("where", where);
		param.put("offset", (pg - 1) * pgSize);
		param.put("pgSize", pgSize);
		List<?> res = getList("tts.ttslist", param);
		String num = getOne("tts.ttsNum", param).toString();
		param.clear();
		param.put("recs", res);
		param.put("num", num);
		return param;
	}
	
	public void delOnetts(int ttsID) throws Exception{
		delete("tts.deleteByttsID", ttsID);
	}

	public void addOnetts(int ttsID) throws Exception{
		System.out.println(ttsID);
		update("tts.addByttsID", ttsID);
	}
}
