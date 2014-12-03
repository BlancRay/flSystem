package cn.nwsuaf.action.user;

import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import cn.nwsuaf.dao.LoginUserDao;
import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.LoginUserBean;

public class LoginAction extends BaseAction{
	private LoginUserBean user=new  LoginUserBean();
	private String loginName;
	private String passwd;
	private String tip;
	private String checkCode;
	
	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	
	
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public LoginUserBean getUser() {
		return user;
	}

	public void setUser(LoginUserBean user) {
		this.user = user;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String execute(){
		LoginUserDao luDao = new LoginUserDao();
		String result = Action.LOGIN;
		LoginUserBean lu=new LoginUserBean();
		user.setLoginName(loginName);
		user.setPasswd(passwd);
		
		try{
			lu = luDao.login(user);
			Map<String, Object> session = ActionContext.getContext().getSession();
			Object valcode = session.get("valcode");
			if(valcode == null || checkCode == null){
				return Action.LOGIN;
				
			}
			if(!checkCode.equalsIgnoreCase(valcode.toString())){
				tip = "验证码输入出错误....";
				return Action.LOGIN;
			}
			if(lu!= null){				
				result="_notice";
			}
			if(lu != null){
				session.put("userInfo", lu);
				if("student".equals(lu.getRole())){
					result = "student";
				}
				else if("tutor".equals(lu.getRole())){
					result = "tutor";
				}else if("admin".equals(lu.getRole())){
					result = "admin";
				}
				
			}
			else{
				tip = "用户名或密码有误....";				
			}			
		}
		catch(Exception e){
			e.printStackTrace();
			tip = e.getMessage();
			result = Action.ERROR;
		}	
		return result;
	}
}