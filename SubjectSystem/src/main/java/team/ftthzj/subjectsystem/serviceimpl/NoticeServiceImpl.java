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
	
	public int addNotice(String title, String startTime, String stopTime, String description) {
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setStartTime(startTime);
		notice.setStopTime(stopTime);
		notice.setDescription(description);
		noticeDao.addNotice(notice);
		return 1;
	}

	@Override
	public List<Notice> loadAllNotice() {
		Notice notice = new Notice();
		notice.setNoticeId(0);
		return this.noticeDao.searchNotice(notice);
	}

	@Override
	public List<Notice> searchNotices(String title) {
		Notice notice = new Notice();
		notice.setTitle(title);
		return this.noticeDao.searchNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeId) {
		noticeDao.deleteNotice(noticeId);
		return 1;
	}

	@Override
	public Notice searchNoticeById(int noticeId){
		return noticeDao.getNotice(noticeId);
	}

	@Override
	public int updateNotice(Notice notice){
		noticeDao.updateNotice(notice);
		return 1;
	}

}
