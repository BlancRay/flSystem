/**
 * tutorlistBean
 */
package cn.nwsuaf.bean;

public class TutorListBean {
	private int loginName;// 工号
	private String uname;// 姓名
	private String introduce;// 个人简介
	private String specialtyID;// 招生专业
	private String res_interests;// 研究方向
	private int quota;// 招生名额
	private String photo;// 照片地址
	private String type;// 教师类型
	private String checked;
	private int id;
	public int getLoginName() {
		return loginName;
	}
	public void setLoginName(int loginName) {
		this.loginName = loginName;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getSpecialtyID() {
		return specialtyID;
	}
	public void setSpecialtyID(String specialtyID) {
		this.specialtyID = specialtyID;
	}
	public String getRes_interests() {
		return res_interests;
	}
	public void setRes_interests(String res_interests) {
		this.res_interests = res_interests;
	}
	public int getQuota() {
		return quota;
	}
	public void setQuota(int quota) {
		this.quota = quota;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
