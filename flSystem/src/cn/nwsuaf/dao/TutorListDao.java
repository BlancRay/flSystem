package cn.nwsuaf.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.nwsuaf.bean.TutorListBean;

public class TutorListDao {
	private SqlSession sqlSession;

	public List<TutorListBean> getTutorList() {
		sqlSession = SqlMapperFactory.getSqlSessionFactory().openSession();
		List<TutorListBean> list = new ArrayList<TutorListBean>();
		try {
			list = sqlSession.selectList("tutorlist.getTutorList");
		} catch (Exception e) {
			System.out.println(e);

		} finally {

			sqlSession.close();
		}
		return list;
	}
/*	public List<TutorListBean> getTutorListByName() {
		sqlSession = SqlMapperFactory.getSqlSessionFactory().openSession();
		List<TutorListBean> list = new ArrayList<TutorListBean>();
		try {
			list = sqlSession.selectList("tutorlist.getTutorListByName");
		} catch (Exception e) {
			System.out.println(e);

		} finally {

			sqlSession.close();
		}
		return list;
	}
	public List<TutorListBean> getTutorListBySpecialtyID() {
		sqlSession = SqlMapperFactory.getSqlSessionFactory().openSession();
		List<TutorListBean> list = new ArrayList<TutorListBean>();
		try {
			list = sqlSession.selectList("tutorlist.getTutorListBySpecialtyID");
		} catch (Exception e) {
			System.out.println(e);

		} finally {

			sqlSession.close();
		}
		return list;
	}*/

}
