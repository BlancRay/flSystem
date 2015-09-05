package cn.nwsuaf.util;

import java.util.ArrayList;
import java.util.HashMap;

import cn.nwsuaf.dao.SpecialtyDao;

public class DataPacked {
	/**
	 * 将学生信息数组，转换为学生信息Map
	 * 
	 * @param stus
	 * @return
	 * @throws Exception
	 */

	static public ArrayList<HashMap<String,Object>> stuInfoPacked(ArrayList<String[]> stus) throws Exception{
		 ArrayList<HashMap<String,Object>> stulist = new  ArrayList<HashMap<String,Object>>();
		 HashMap<String, Object> bMap = bigclassMap();
		 int i;
		 for(String[] tmp:stus){
			 HashMap<String,Object> stu = new HashMap<String,Object>();
			 i = 0;
			 stu.put("loginName", tmp[i++]);
			 stu.put("uName", tmp[i++]);
			 stu.put("sex", tmp[i++]);
			 stu.put("className", tmp[i++]);
			 stu.put("grade", tmp[i++]);
			 stu.put("bigClassID", bMap.get(tmp[i++]));
			 stu.put("sixGrade", tmp[i++]);
			 stu.put("creditscore", tmp[i++]);
			 stu.put("discipline", tmp[i++]);
			 stulist.add(stu);
		 }
		 return stulist;
	}
	
	/**
	 * 将学生已修课程信息转换为Map
	 * @param course 课程信息数组
	 * @return
	 */
	static public ArrayList<HashMap<String,Object>> pcoursePacked(ArrayList<String[]> course){
		ArrayList<HashMap<String,Object>> clist = new  ArrayList<HashMap<String,Object>>();
		for(String[] tmp:course){
			HashMap<String,Object> c = new HashMap<String,Object>();
			c.put("loginName", tmp[0]);
			c.put("courseID", tmp[2]);
			c.put("score", tmp[4]);
			c.put("compulsory", tmp[5]);
			
			clist.add(c);
		}
		return clist;
	}
	
	/**
	 * 将专业信息保存的Map中，专业名为key，ID为value
	 * 
	 * @return
	 * @throws Exception
	 */
	static public HashMap<String, Object> specMap() throws Exception {
		SpecialtyDao sDao = new SpecialtyDao();
		ArrayList<HashMap<String, String>> spList = sDao.specList();
		HashMap<String, Object> sMap = new HashMap<String, Object>();
		for (HashMap<String, String> s : spList) {
			sMap.put(s.get("specialtyName"), s.get("specialtyID"));
		}
		return sMap;
	}
	
	/**
	 * 将学科分类信息保存的Map中，分类名为key，ID为value
	 * @return
	 * @throws Exception 
	 */
	static public HashMap<String,Object> bigclassMap() throws Exception {
		SpecialtyDao sDao = new SpecialtyDao();
		ArrayList<HashMap<String, String>> bcList = sDao.bigClassList();
		HashMap<String,Object> sMap = new HashMap<String,Object>();
		for(HashMap<String,String> s:bcList){
			sMap.put(s.get("bigClassName"), s.get("bigClassID"));
		}
		return sMap;
	}
}
