package cn.nwsuaf.action.admin;

import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.dao.TtsDao;

public class TtsAction extends BaseAction {
	private TtsDao ttsDao;
	private HashMap<String, Object> ttsList;
	private boolean success = true;
	private String errMsg;
	private Integer ttsID;
	
	//筛选用
	private String tName;
	private String sName;
	
	
	public TtsAction(){
		ttsDao = new TtsDao();
	}
	
	public String list(){
		try {
			ttsList = ttsDao.getTtsList(createWhere(), getPage(), getRows());
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "list";
	}
	public String pdf(){
		try {
			ttsList = ttsDao.getTtsList(createWhere(), getPage(), getRows());
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "pdf";
	}
	/**
	 * 创建查询条件
	 * @return
	 */
	private String createWhere(){
		String where = "1=1 ";
		if(sName != null && !"".equals(sName)){
			where += String.format(" and stu.uName='%s'", sName);
		}
		if(tName != null && !"".equals(tName)){
			where += String.format(" and tutor.uName='%s'", tName);
		}
		return where;
	}
	
	public String delete(){
		try {
			ttsDao.delOnetts(ttsID);
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return "delete";
	}
	
	public String add(){
		try {
			System.out.println(ttsID);
			ttsDao.addOnetts(ttsID);
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return "add";
	}

	public HashMap<String, Object> getTtsList() {
		return ttsList;
	}

	public void setTtsList(HashMap<String, Object> ttsList) {
		this.ttsList = ttsList;
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

	public Integer getTtsID() {
		return ttsID;
	}

	public void setTtsID(Integer ttsID) {
		this.ttsID = ttsID;
	}

	public String getTName() {
		return tName;
	}

	public void setTName(String tName) {
		this.tName = tName;
	}

	public String getSName() {
		return sName;
	}

	public void setSName(String sName) {
		this.sName = sName;
	}


}
