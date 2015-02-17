package cn.nwsuaf.action.notice;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.NoticeBean;
import cn.nwsuaf.dao.NtDao;

public class NtAction extends BaseAction {
	private NtDao nDao;
	private HashMap<String, Object> result;
	private NoticeBean notice;
	private int noticeID;

	public NtAction(){
		nDao = new NtDao();
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

	public NtDao getnDao() {
		return nDao;
	}

	public void setnDao(NtDao nDao) {
		this.nDao = nDao;
	}

	public HashMap<String, Object> getResult() {
		return result;
	}

/*	public void setResult(HashMap<String, Object> result) {
		this.result = result;
	}*/

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
	
}
