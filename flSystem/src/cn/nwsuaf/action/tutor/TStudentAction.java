package cn.nwsuaf.action.tutor;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.TStudentBean;
import cn.nwsuaf.dao.TStudentDao;

public class TStudentAction extends BaseAction {
	private HashMap<String, Object> result;
	private TStudentBean tstudent;
	private int tstudentID;
	private TStudentDao tsDao;

	public TStudentAction() {
		tsDao = new TStudentDao();
	}

	/**
	 * 学生列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		result = (HashMap<String, Object>) tsDao.getTtsByPageAndCount(getPage(), getRows());
		return Action.SUCCESS;
	}

	public HashMap<String, Object> getResult() {
		return result;
	}

/*	public void setResult(HashMap<String, Object> result) {
		this.result = result;
	}*/

	public TStudentBean getTstudent() {
		return tstudent;
	}

	public void setTstudent(TStudentBean tstudent) {
		this.tstudent = tstudent;
	}

	public int getTstudentID() {
		return tstudentID;
	}

	public void setTstudentID(int tstudentID) {
		this.tstudentID = tstudentID;
	}

	public TStudentDao getTsDao() {
		return tsDao;
	}

	public void setTsDao(TStudentDao tsDao) {
		this.tsDao = tsDao;
	}

}
