/**
 * 系统公告
 * Date：2014-9-9
 * @author 邹青
 */
package cn.nwsuaf.dao;

import java.util.HashMap;
import java.util.List;

import cn.nwsuaf.bean.NoticeBean;

public class NoticeDao extends BaseDao {
	private HashMap<String,Object> params;
	
	/**
	 * 编辑公告
	 * @param noticeID
	 * @return
	 * @throws Exception
	 */
	public Object edit(int noticeID) throws Exception{
		return getById("notice.noticeEdit", noticeID);
	}
	
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
		List<?> notices = getList("notice.getNoticeByPage", params);
		int count  = (Integer) getOne("notice.getCount");
		
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
		update("notice.noticeUpdateSkim", noticeID);
		return getById("notice.getNoticeByID", noticeID);
	}
	
	/**
	 * 保存通知
	 * @param notice 通知内容
	 * @throws Exception
	 */
	public void save(NoticeBean notice) throws Exception{
		if(notice.getNoticeID() == 0){
			insert("notice.noticeInsert", notice);
		}
		else{
			update("notice.noticeUpdate", notice);
		}
	}
	
	/**
	 * 删除通知
	 * @param ids id列表
	 * @throws Exception
	 */
	public void delete(String ids) throws Exception{
		params = new  HashMap<String,Object>();
		params.put("ids", ids);
		delete("notice.noticeDelete", params);
	}
}
