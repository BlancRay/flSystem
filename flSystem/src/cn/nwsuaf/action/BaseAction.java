package cn.nwsuaf.action;

import org.apache.struts2.ServletActionContext;

public class BaseAction {
	private String contextPath;//上下文路径
	private int page; //请求的页面号
	private int rows; //页面大小
	
	public BaseAction(){
		contextPath=ServletActionContext.getServletContext().getContextPath();
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page == 0) page = 1;
		this.page = page;
	}
	public int getRows() {
		if(rows == 0)rows = 10;
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getContextPath() {
		return contextPath;
	}	
}
