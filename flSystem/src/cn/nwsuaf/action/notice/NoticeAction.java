package cn.nwsuaf.action.notice;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.NoticeBean;
import cn.nwsuaf.dao.NoticeDao;

public class NoticeAction extends BaseAction {
	private NoticeDao nDao;
	private int noticeID;
	private NoticeBean notice;
	private HashMap<String, Object> result;

	public NoticeAction(){
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
	 * 公告详细
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String detail() throws Exception{
		result = (HashMap<String, Object>) nDao.getNoticeByID(noticeID);
		return Action.SUCCESS;
	}
	
	
	public HashMap<?, ?> getResult() {
		return result;
	}

	public int getNoticeID() {
		return noticeID;
	}

	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}

	public NoticeBean getNotice() {
		return notice;
	}

	public void setNotice(NoticeBean notice) {
		this.notice = notice;
	}
}
