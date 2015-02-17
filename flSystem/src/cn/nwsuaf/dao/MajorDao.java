package cn.nwsuaf.dao;

import java.util.HashMap;
import java.util.List;

public class MajorDao extends BaseDao {
	/**
	 *  学生信息列表
	 * @param where 筛选条件
	 * @param pg  待显示的页面
	 * @param pgSize  每页显示的记录条数
	 * @return 包含记录条数（num），及记录列表（recs）的map
	 * @throws Exception
	 */
	public HashMap<String,Object> getMajorList(String where,int pg,int pgSize) throws Exception{
		 HashMap<String,Object> param = new HashMap<String,Object>();
		 param.put("where", where);
		 param.put("offset",(pg - 1)*pgSize);
		 param.put("pgSize", pgSize);
		 List<?> res = getList("major.majorlist", param);
		 String num = getOne("major.majorNum", param).toString();
		 param.clear();
		 param.put("recs", res);
		 param.put("num", num);
		 return param;
	 }
	
	/**
	 * 指定学生信息
	 * @param loginName
	 * @return map 学生详细信息
	 * @throws Exception
	 */
	public Object getMajorById(int specialtyID) throws Exception{
		return getOne("major.majorByid", specialtyID);
	}
	
	/**
	 * 保存修改或添加
	 * @param stuInfo 学生信息
	 * @throws Exception
	 */
	public void save(HashMap<String,String> majorInfo) throws Exception{
		String oldID = majorInfo.get("oldspecialtyID");
		if( oldID == null || "".equals(oldID)){
			insert("major.majorInsert", majorInfo);
		}
		else{
			update("major.majorUpdate", majorInfo);
		}
	}
	

	/**
	 * 按学号删除学生
	 * @param stuId 学号
	 * @throws Exception
	 */
	public void delOneMajor(int specialtyID) throws Exception{
		delete("major.deleteByspecialtyID", specialtyID);
	}
	
	
}