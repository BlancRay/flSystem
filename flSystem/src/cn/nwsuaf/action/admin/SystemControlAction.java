package cn.nwsuaf.action.admin;

import java.util.Calendar;
import java.util.HashMap;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.dao.ControlDao;

public class SystemControlAction extends BaseAction {
	private String curAnnual;
	private Object wannual;
	private ControlDao cDao;
	private boolean flPassed = false;//当年分流是否已经完成

	private Object eachSelectInfo;
	private HashMap<String, Object> selectInfo;
	private String stuID;
	private String errMsg;
	
	public SystemControlAction(){
		cDao = new ControlDao();
	}
	
	public String eachSelect(){
		try {
			Object o = cDao.selectIsExist();
			curAnnual = o == null?"":o.toString();
			if(curAnnual != ""){
				eachSelectInfo = cDao.eachSelect(curAnnual);
			}
			else{
				wannual =  cDao.divertedGrade();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "eachSelectStart";
	}
	
	/**
	 * 导师学生互选开始
	 * @return
	 */
	public String eachSelectStart(){
		try {
			 String an = curAnnual.toString();
			 cDao.eachSelectStart(an);
			 eachSelectInfo = cDao.eachSelect(curAnnual);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "eachSelectStart";
	}

	/**
	 * 互选结束
	 * @return
	 */
	public String eachSelectEnd(){
		try {
			 cDao.eachSelectEnd(curAnnual);
			 eachSelectInfo = cDao.eachSelect(curAnnual);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "eachSelectStart";
	}
	
	/**
	 * 通道选择
	 * @return
	 */
	public String channelSelect(){
		try {
			Object o = cDao.selectIsExist();
			curAnnual = o == null?"":o.toString();
			if(curAnnual != ""){
				eachSelectInfo = cDao.channelSelect(curAnnual);
			}
			else{
				flPassed = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "channelSelect";
	}
	
	/**
	 * 通道选择开始
	 * @return
	 */
	public String channelSelectStart(){
		try {
			cDao.channelSelectStart(curAnnual);
			eachSelectInfo = cDao.channelSelect(curAnnual);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "channelSelect";
	}
	
	/**
	 * 通道选择关闭
	 * @return
	 */
	public String channelSelectEnd(){
		try {
			cDao.channelSelectEnd(curAnnual);
			cDao.deleteAnnual();
			flPassed = true;
			wannual =  Calendar.getInstance().get(Calendar.YEAR) + "";
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		return "channelSelect";
	}
	
	/**
	 * 互选信息
	 * @return
	 */
	public String eachSelectInfo(){
		selectInfo = new HashMap<String,Object>();
		try {
			selectInfo.put("allCount", cDao.allSelectedStudent(curAnnual));
			selectInfo.put("selectedList", cDao.selectedList());
			selectInfo.put("notSelectList", cDao.notSelectList(curAnnual));
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		
		return "eachSelectInfo";
	}
	
	/**
	 * 通道专业选择
	 * @return
	 */
	public String channelSelectInfo(){
		try {
			eachSelectInfo = cDao.channelSelectInfo(curAnnual);
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
		
		return "channelSelectInfo";
	}
	
	/**
	 * 管理员审核专业选择
	 * @return
	 */
	public String adminCheckSpec(){
		try {
			cDao.adminCheckSpec(stuID);
		} catch (Exception e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			flPassed = true;
		}
		
		return "adminCheckSpec";
	}
	
	public String getCurAnnual() {
		return curAnnual;
	}

	public void setCurAnnual(String curAnnual) {
		this.curAnnual = curAnnual;
	}

	public Object getEachSelectInfo() {
		return eachSelectInfo;
	}

	public void setEachSelectInfo(Object eachSelectInfo) {
		this.eachSelectInfo = eachSelectInfo;
	}

	public Object getWannual() {
		return wannual;
	}

	public void setWannual(Object wAnnual) {
		this.wannual = wAnnual;
	}

	public boolean isFlPassed() {
		return flPassed;
	}

	public void setFlPassed(boolean flPassed) {
		this.flPassed = flPassed;
	}

	public HashMap<String, Object> getSelectInfo() {
		return selectInfo;
	}

	public String getStuID() {
		return stuID;
	}

	public void setStuID(String stuID) {
		this.stuID = stuID;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

}
