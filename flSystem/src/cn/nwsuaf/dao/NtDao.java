/**
 * 系统公告
 * Date：2014-9-9
 * @author 邹青
 */
package cn.nwsuaf.dao;

import java.util.HashMap;
import java.util.List;

public class NtDao extends BaseDao {
	private HashMap<String,Object> params;
	/**
	 * 通知列表
	 * @param page 页面 
	 * @param pgSize 页面大小
	 * @return 指定页面通知记录及总记录条数
	 * @throws Exception
	 */
	public HashMap<?,?> getNoticeByPageAndCount(int page,int pgSize) throws Exception{
		params = new  HashMap<String,Object>();
		page = page>0?page:1;
		params.put("offset", (page - 1)*pgSize);
		params.put("pgSize", pgSize);
		List<?> notices = getList("nt.getNoticeByPage", params);//mapper包.方法名id
		int count  = (Integer) getOne("nt.getCount");
		HashMap<String, Object> res = new HashMap<String,Object>();
		res.put("total", count);
		res.put("rows", notices);
		return res;
	}
	
	/**
	 * 通知详细
	 * @param noticeID 通知ID
	 * @return 通知详细
	 * @throws Exception
	 */
	public Object getNoticeByID(int noticeID) throws Exception{
		update("nt.noticeUpdateSkim", noticeID);
		return getById("nt.getNoticeByID", noticeID);
	}
}
