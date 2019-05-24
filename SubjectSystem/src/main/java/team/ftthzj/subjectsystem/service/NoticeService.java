package team.ftthzj.subjectsystem.service;

import java.util.List;

import team.ftthzj.subjectsystem.po.Notice;

public interface NoticeService {

	//新建消息
	public int addNotice(int noticeId, String title, String startTime, String stopTime, String description);

	//列出所有消息
	public List<Notice> loadAllNotice();

	//查询消息
	public List<Notice> searchNotices(Notice notice);
	
	//删除消息
	public int deleteNotice(String noticeId);
}
