package cn.nwsuaf.action.student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;

import cn.nwsuaf.dao.TutorListDao;
import cn.nwsuaf.action.BaseAction;
import cn.nwsuaf.bean.TutorListBean;

public class TutorListAction extends BaseAction {

	public TutorListDao TutorListDao = new TutorListDao();
	public List<TutorListBean> list = new ArrayList<TutorListBean>();
	private Map<String, Object> result = new HashMap<String, Object>();

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}

	public TutorListAction() {
		list = new ArrayList<TutorListBean>();
	}

	public List<?> getList() throws Exception {
		return TutorListDao.getTutorList();
	}

	public void setList(List<TutorListBean> list) {
		this.list = list;
	}

	public String execute() {
		list = TutorListDao.getTutorList();
		List<Map<String, Object>> json = new ArrayList<Map<String, Object>>();

		Iterator<TutorListBean> it = list.iterator();
		while (it.hasNext()) {
			Map<String, Object> m = new HashMap<String, Object>();
			TutorListBean t = new TutorListBean();
			t = it.next();
			m.put("uname", t.getUname());
			m.put("introduce", t.getIntroduce());
			m.put("specialtyID", t.getSpecialtyID());
			m.put("res_interests", t.getRes_interests());
			m.put("quota", t.getQuota());
			json.add(m);
		}
		result.put("rows", json);
		this.setResult(result);
		return Action.SUCCESS;
	}

/*	public String uname() {
		list = TutorListDao.getTutorListByName();
		List<Map<String, Object>> json = new ArrayList<Map<String, Object>>();

		Iterator<TutorListBean> it = list.iterator();
		while (it.hasNext()) {
			Map<String, Object> m = new HashMap<String, Object>();
			TutorListBean t = new TutorListBean();
			t = it.next();
			m.put("uname", t.getUname());
			m.put("introduce", t.getIntroduce());
			m.put("specialtyID", t.getSpecialtyID());
			m.put("res_interests", t.getRes_interests());
			m.put("quota", t.getQuota());
			json.add(m);
		}
		result.put("rows", json);
		this.setResult(result);
		return Action.SUCCESS;
	}

	public String specialtyID() {
		list = TutorListDao.getTutorListBySpecialtyID();
		List<Map<String, Object>> json = new ArrayList<Map<String, Object>>();

		Iterator<TutorListBean> it = list.iterator();
		while (it.hasNext()) {
			Map<String, Object> m = new HashMap<String, Object>();
			TutorListBean t = new TutorListBean();
			t = it.next();
			m.put("uname", t.getUname());
			m.put("introduce", t.getIntroduce());
			m.put("specialtyID", t.getSpecialtyID());
			m.put("res_interests", t.getRes_interests());
			m.put("quota", t.getQuota());
			json.add(m);
		}
		result.put("rows", json);
		this.setResult(result);
		return Action.SUCCESS;
	}
*/
}