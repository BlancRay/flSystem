package cn.nwsuaf.dao;

public class ControlDao extends BaseDao {
	
	/**
	 * 可分流的年级
	 * @return
	 * @throws Exception
	 */
	public Object divertedGrade() throws Exception{
		return getList("control.divertedGrade");
	}
	/**
	 * 互选年度
	 * @return
	 * @throws Exception
	 */
	public Object selectIsExist() throws Exception{
		return getOne("control.selectIsExist");
	}
	
	/**
	 * 互选开始
	 * @param annual
	 * @throws Exception
	 */
	public void eachSelectStart(String annual) throws Exception{
		insert("control.insertSelect", annual);
		insert("control.insertEachSelect",annual);
	}
	/**
	 * 结束互选
	 * @param annual
	 * @throws Exception
	 */
	public void eachSelectEnd(String annual) throws Exception{
		update("control.endEachSelect",annual);
	}
	
	/**
	 * 互选状态信息
	 * @param annual
	 * @return
	 * @throws Exception
	 */
	public Object eachSelect(String annual) throws Exception{
		return getOne("control.eachSelect", annual);
	}
	
	/**
	 * 通道选择状态
	 * @param annual
	 * @return
	 * @throws Exception
	 */
	public Object channelSelect(String annual) throws Exception{
		return getOne("control.channelSelect", annual);
	}
	
	/**
	 * 通道选择开始
	 * @param annual
	 * @throws Exception
	 */
	public void channelSelectStart(String annual) throws Exception{
		update("control.startChannelSelect",annual);
	}
	
	/**
	 * 通道选择结束
	 * @param annual
	 * @throws Exception
	 */
	public void channelSelectEnd(String annual) throws Exception{
		update("control.endChannelSelect",annual);
	}
	
	/**
	 * 清除年度信息
	 * @throws Exception
	 */
	public void deleteAnnual() throws Exception{
		delete("control.deleteSelect");
	}
	
	/**
	 * 所有参选人数
	 * @param grade 年级
	 * @return
	 * @throws Exception
	 */
	public int allSelectedStudent(String grade) throws  Exception{
		return Integer.parseInt(getOne("control.allSelect",grade).toString());
	}
	
	/**
	 * 互选列表
	 * @return
	 * @throws Exception
	 */
	public Object selectedList() throws Exception{
		return getList("control.selectedList");
	}
	
	/**
	 * 未进行选择学生
	 * @param grade
	 * @return
	 * @throws Exception
	 */
	public Object notSelectList(String grade) throws Exception{
		return getList("control.notSelectList", grade);
	}
	
	/**
	 * 通道专业选择信息
	 * @param grade
	 * @return
	 * @throws Exception
	 */
	public Object channelSelectInfo(String grade) throws Exception{
		return getList("control.channelSelectInfo", grade);
	}
	
	/**
	 * 管理员审核专业选择
	 * @param stuID 学号
	 * @throws Exception
	 */
	public void adminCheckSpec(String stuID) throws Exception{
		update("control.adminCheckSpec", stuID);
	}
}
