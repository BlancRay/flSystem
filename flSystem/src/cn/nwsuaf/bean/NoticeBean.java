/**
 * 通知Bean
 */
package cn.nwsuaf.bean;

import java.util.Date;

public class NoticeBean {
	private int noticeID;
	private String title;
	private String content;
	private Date pdate;
	private int skipNum;

	public int getNoticeID() {
		return noticeID;
	}

	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public int getSkipNum() {
		return skipNum;
	}

	public void setSkipNum(int skipNum) {
		this.skipNum = skipNum;
	}
	
}
