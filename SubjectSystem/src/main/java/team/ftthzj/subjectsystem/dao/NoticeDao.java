package team.ftthzj.subjectsystem.dao;

import java.util.List;

import team.ftthzj.subjectsystem.po.Notice;

public interface NoticeDao {

	//新建消息
	public int addNotice(Notice notice);

	//列出所有消息
	public List<Notice> loadAllNotice();

	//查询消息
	public List<Notice> searchNotice(Notice notice);
	
	//修改消息
	public int updateNotice(Notice notice);
	
	//删除消息
	public int deleteNotice(Notice notice);
}
