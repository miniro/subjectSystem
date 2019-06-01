package team.ftthzj.subjectsystem.service;

import java.util.List;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Notice;

public interface NoticeService {

	//新建通知
	public int addNotice(String title, String startTime, String stopTime, String description);

	//列出所有通知
	public List<Notice> loadAllNotice();

	//查询通知
	public Page<Notice> searchNotices(Integer page, Integer rows, String title);
	
	//删除通知
	public int deleteNotice(int noticeId);

	//获取通知
    public Notice searchNoticeById(int noticeId);

    //更新通知
	public int updateNotice(Notice notice);
}
