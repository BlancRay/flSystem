package cn.nwsuaf.action.admin;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.dao.SubjectDao;
//import cn.nwsuaf.util.DataPacked;

public class SubjectAction extends BaseAction {
	private SubjectDao subjectDao;
	private HashMap<String, Object> subjectList;
	private HashMap<String, String> subjectInfo;
	private boolean success = true;
	private String errMsg;
	private String bigClassName;
	private Integer bigClassID;
	private boolean isExist;
//	private HashMap<String, Object> bcMap;
	
	public SubjectAction(){
		subjectDao = new SubjectDao();
	}
		
	public String list(){
		try {
			subjectList = subjectDao.getSubjectList(createWhere(), getPage(), getRows());
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "list";
	}

	public String pdf(){
		try {
			subjectList = subjectDao.getSubjectList(createWhere(), getPage(), getRows());
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "pdf";
	}	
	/**
	 * 待审核列表
	 * @return
	 */
	public String checklist(){
		try {
			subjectList = subjectDao.getSubjectList("checked=1", getPage(), getRows());
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "checklist";
	}
	
	/**
	 * 审核
	 * @return
	 */
	public String check(){
		
		return Action.SUCCESS;
	}
	
	public String add(){
		try {
			return "edit";
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public String edit(){
		try {
			subjectInfo = (HashMap<String, String>) subjectDao.getSubjectById(bigClassID);
//			bcMap = DataPacked.bigclassMap();
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "edit";
	}
	
	public String save(){
		try {
			subjectDao.save(subjectInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "save";
	}
	
	public String delete(){
		try {
			subjectDao.delOneSubject(bigClassID);
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return "delete";
	}

	/**
	 * 创建查询条件
	 * @return
	 */
	private String createWhere(){
		String where = "1=1 ";
		if(bigClassID != null){
			where += "and bigClassID=" + bigClassID;
		}		
		if(bigClassName != null && !"".equals(bigClassName)){
			where += " and bigClassName='" + bigClassName+"'";
		}
		return where;
	}
	
	public String exist(){
		try {
			isExist = subjectDao.bigClassIDIsExist(bigClassID);
		}catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return "exist";
	}
	

	public HashMap<String, Object> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(HashMap<String, Object> subjectList) {
		this.subjectList = subjectList;
	}

	public HashMap<String, String> getSubjectInfo() {
		return subjectInfo;
	}

	public void setSubjectInfo(HashMap<String, String> subjectInfo) {
		this.subjectInfo = subjectInfo;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getBigClassName() {
		return bigClassName;
	}

	public void setBigClassName(String bigClassName) {
		this.bigClassName = bigClassName;
	}

	public Integer getBigClassID() {
		return bigClassID;
	}

	public void setBigClassID(Integer bigClassID) {
		this.bigClassID = bigClassID;
	}

	public boolean isExist() {
		return isExist;
	}

	public void setExist(boolean isExist) {
		this.isExist = isExist;
	}



}
