package team.ftthzj.subjectsystem.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.NoticeDao;
import team.ftthzj.subjectsystem.po.Notice;
import team.ftthzj.subjectsystem.service.NoticeService;

@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	public int addNotice(int noticeId, String title, String startTime, String stopTime, String description) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Notice> searchNotices(Notice notice) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

}
