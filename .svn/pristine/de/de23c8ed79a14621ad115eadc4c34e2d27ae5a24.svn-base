package cn.nwsuaf.action.student;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.dao.StudentDao;

public class StudentAction extends BaseAction {
	
	private StudentDao stuDao;
	private String loginName;
	private HashMap<String,Object> self_Rec;
	
	private HashMap<String,Object> result = new  HashMap<String,Object>();
	
	@SuppressWarnings("unchecked")
	public StudentAction(){
		stuDao = new StudentDao();
		HashMap<String, Object> usr = (HashMap<String,Object>)getSession().getAttribute("loginUser");
		loginName = usr.get("loginName").toString();
		result.put("success", true);
	}
	
	@SuppressWarnings("unchecked")
	public String personInfo(){
		try {
			self_Rec = (HashMap<String, Object>) stuDao.getStuById(loginName);
			Object pcourse = stuDao.pcourseList(loginName);
			self_Rec.put("pcourse", pcourse);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "personInfo";
	}
	
	/**
	 * 更新个人信息
	 * @return
	 */
	public String persionSave(){
		try {
			stuDao.personUpdate(self_Rec);
		} catch (Exception e) {
			e.printStackTrace();
			setError(e.getMessage());
		}
		return "jsonAction";
	}
	
	/**
	 * 自荐书
	 * @return
	 */
	public String getSelfRec(){
		try {
			self_Rec = stuDao.getStuSelfRec(loginName);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "selfRec";
	}

	public String saveSelfRec(){
		try {
			 stuDao.updateStuSelfRec(self_Rec);
		} catch (Exception e) {
			e.printStackTrace();
			setError(e.getMessage());
		}
		return "jsonAction";
	}
	
	private void setError(String msg){
		result.put("success", false);
		result.put("errMsg", msg);
	}
	
	public HashMap<String,Object> getSelf_Rec() {
		return self_Rec;
	}

	public void setSelf_Rec(HashMap<String,Object> self_Rec) {
		this.self_Rec = self_Rec;
	}

	public HashMap<String,Object> getResult() {
		return result;
	}

	public void setResult(HashMap<String,Object> result) {
		this.result = result;
	}

}
