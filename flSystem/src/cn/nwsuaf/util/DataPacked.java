package cn.nwsuaf.util;

import java.util.ArrayList;
import java.util.HashMap;

import cn.nwsuaf.dao.SpecialtyDao;

public class DataPacked {
	/**
	 * 将学生信息数组，转换为学生信息Map
	 * @param stus
	 * @return
	 * @throws Exception
	 */
	static public ArrayList<HashMap<String,Object>> stuInfoPacked(ArrayList<String[]> stus) throws Exception{
		 ArrayList<HashMap<String,Object>> stulist = new  ArrayList<HashMap<String,Object>>();
		 HashMap<String, Object> sMap = specMap();
		 int i;
		 for(String[] tmp:stus){
			 HashMap<String,Object> stu = new HashMap<String,Object>();
			 i = 0;
			 stu.put("loginname", tmp[i++]);
			 stu.put("uName", tmp[i++]);
			 stu.put("sex", tmp[i++]);
			 stu.put("className", tmp[i++]);
			 stu.put("grade", tmp[i++]);
			 stu.put("specialtyID", sMap.get(tmp[i++]));
			 stu.put("sixGrade", tmp[i++]);
			 
			 stulist.add(stu);
		 }
		 return stulist;
	}
	
	/**
	 * 将专业信息保存的Map中，专业名为key，ID为value
	 * @return
	 * @throws Exception 
	 */
	static public HashMap<String,Object> specMap() throws Exception{
		SpecialtyDao sDao = new SpecialtyDao();
		ArrayList<HashMap<String, String>> spList = sDao.specList();
		HashMap<String,Object> sMap = new HashMap<String,Object>();
		for(HashMap<String,String> s:spList){
			sMap.put(s.get("specialtyName"), s.get("specialtyID"));
		}
		return sMap;
	}
}
