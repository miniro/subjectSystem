package team.ftthzj.subjectsystem.dao;

import java.util.List;

import team.ftthzj.subjectsystem.po.Notice;

public interface NoticeDao {

	//新建消息
	public int addNotice(Notice notice);

	//查询消息数量
	public Integer getNoticeNum(Notice notice);

	//查询消息
	public List<Notice> searchNotice(Notice notice);
	
	//修改消息
	public int updateNotice(Notice notice);
	
	//删除消息
	public int deleteNotice(int noticeId);

	public Notice getNotice(int noticeId);

}
