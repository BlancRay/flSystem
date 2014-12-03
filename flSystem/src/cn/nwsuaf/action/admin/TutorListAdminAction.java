package cn.nwsuaf.action.admin;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.TutorListBean;
import cn.nwsuaf.dao.TutorListDao;

public class TutorListAdminAction extends BaseAction {
	private HashMap<String, Object> result;
	private TutorListBean tutorlist;
	private int loginName;
	private String ids;
	public TutorListDao tlDao;
	public TutorListAdminAction(){
		tlDao = new TutorListDao();
	}	
	
	/**
	 * 导师列表
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String list() throws Exception{
		result = (HashMap<String, Object>) tlDao.getTutorListByPageAndCount(getPage(), getRows());
		return Action.SUCCESS;
	}
	/**
	 * 详细
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String detail() throws Exception{
		result = (HashMap<String, Object>) tlDao.getTutorListByID(loginName);
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
			result = (HashMap<String, Object>) tlDao.edit(loginName);
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
			tlDao.save(tutorlist);
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
			tlDao.delete(ids);
		} catch (Exception e) {
			result.put("success", false);
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}
	
	public Object getResult() {
		return result;
	}

	public TutorListBean getTutorList() {
		return tutorlist;
	}

	public void setTutorList(TutorListBean tutorlist) {
		this.tutorlist = tutorlist;
	}

	public int getLoginName() {
		return loginName;
	}

	public void setLoginName(int loginName) {
		this.loginName = loginName;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
