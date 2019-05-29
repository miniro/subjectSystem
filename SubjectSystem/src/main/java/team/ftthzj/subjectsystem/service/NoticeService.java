package team.ftthzj.subjectsystem.service;

import java.util.List;

import team.ftthzj.subjectsystem.po.Notice;

public interface NoticeService {

	//新建消息
	public int addNotice(String title, String startTime, String stopTime, String description);

	//列出所有消息
	public List<Notice> loadAllNotice();

	//按标题查询消息
	public List<Notice> searchNotices(String title);
	
	//删除消息
	public int deleteNotice(int noticeId);

	//获取消息
    public Notice searchNoticeById(int noticeId);

    //更新消息
	public int updateNotice(Notice notice);
}
