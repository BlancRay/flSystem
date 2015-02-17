package cn.nwsuaf.action.admin;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.NoticeBean;
import cn.nwsuaf.dao.NoticeDao;

public class NoticeAdminAction extends BaseAction {
	private NoticeDao nDao;
	private HashMap<String, Object> result;
	private NoticeBean notice;
	private int noticeID;
	private String ids;

	public NoticeAdminAction(){
		nDao = new NoticeDao();
	}
	
	/**
	 * 公告列表
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String list() throws Exception{
		result = (HashMap<String, Object>) nDao.getNoticeByPageAndCount(getPage(), getRows());
		return Action.SUCCESS;
	}
	
	/**
	 * 详细
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String detail() throws Exception{
		result = (HashMap<String, Object>) nDao.getNoticeByID(noticeID);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 编辑公告
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String edit(){
		try {
			result = (HashMap<String, Object>) nDao.edit(noticeID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}
	
	/**
	 * 保存修改（添加、修改）
	 * @return
	 */
	public String save(){
		result = new HashMap<String, Object>();
		try {
			nDao.save(notice);
			result.put("success", true);
			result.put("message", "保存成功");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("message", e.getMessage());
		}
		return Action.SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		result = new HashMap<String, Object>();
		result.put("success", true);
		try {
			nDao.delete(ids);
		} catch (Exception e) {
			result.put("success", false);
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}
	
	public Object getResult() {
		return result;
	}

	public NoticeBean getNotice() {
		return notice;
	}

	public void setNotice(NoticeBean notice) {
		this.notice = notice;
	}

	public int getNoticeID() {
		return noticeID;
	}

	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
