package cn.nwsuaf.action.admin;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.dao.UserDao;

public class UserAction extends BaseAction {
	private String loginname;
	private boolean isExist;
	private UserDao uDao;
	private boolean success = true;
	
	public UserAction(){
		uDao = new UserDao();
	}
	
	public String exist(){
		try {
			isExist = uDao.loginNameIsExist(loginname);
		}catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return "exist";
	}
	
	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public boolean isExist() {
		return isExist;
	}

	public void setExist(boolean isExist) {
		this.isExist = isExist;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
}
