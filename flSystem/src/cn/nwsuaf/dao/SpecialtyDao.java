package cn.nwsuaf.dao;

import java.util.ArrayList;
import java.util.HashMap;

public class SpecialtyDao extends BaseDao {
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,String>> specList() throws Exception{
		return (ArrayList<HashMap<String, String>>) getList("baseInfo.specInfo");
	}
}
