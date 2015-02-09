package cn.nwsuaf.action.student;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.TutorBean;
import cn.nwsuaf.dao.TutorDao;
//学生查询导师，显示所有导师列表
public class STutorAction extends BaseAction {
	private HashMap<String, Object> result;
	private TutorBean stutor;
	private int stutortID;
	private TutorDao stDao;

	public STutorAction() {
		stDao = new TutorDao();
	}

	/**
	 * 导师列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		result = (HashMap<String, Object>) stDao.getTtsByPageAndCount(getPage(), getRows());
		return Action.SUCCESS;
	}

	public TutorBean getStutor() {
		return stutor;
	}

	public void setStutor(TutorBean stutor) {
		this.stutor = stutor;
	}

	public int getStutortID() {
		return stutortID;
	}

	public void setStutortID(int stutortID) {
		this.stutortID = stutortID;
	}

	public TutorDao getStDao() {
		return stDao;
	}

	public void setStDao(TutorDao stDao) {
		this.stDao = stDao;
	}

	public HashMap<String, Object> getResult() {
		return result;
	}



}
