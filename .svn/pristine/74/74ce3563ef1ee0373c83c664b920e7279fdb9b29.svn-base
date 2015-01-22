package cn.nwsuaf.action;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class BaseAction {
	private String contextPath;//上下文路径
	private int page; //请求的页面号
	private int rows; //页面大小
	private HttpSession session;
	
	
	public BaseAction(){
		contextPath=ServletActionContext.getServletContext().getContextPath();
		setSession(ServletActionContext.getRequest().getSession());
		HashMap<String,Object> usr = new HashMap<String,Object>();
		usr.put("loginName", "2012011001");
		session.setAttribute("loginUser", usr);
	}
	public int getPage() {
		if(page <= 0) page = 1;
		return page;
	}
	public void setPage(int page) {
		
		this.page = page;
	}
	public int getRows() {
		if(rows <= 0)rows = 10;
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getContextPath() {
		return contextPath;
	}
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	
}
