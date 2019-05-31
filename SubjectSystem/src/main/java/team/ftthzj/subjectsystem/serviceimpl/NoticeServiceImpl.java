package team.ftthzj.subjectsystem.serviceimpl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
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
	public Page<Notice> searchNotices(Integer page, Integer rows, String title) {
		Notice notice = new Notice();
		List<Notice> noticeList;
		if(StringUtils.isNotBlank(title)){
			notice.setTitle(title);
		}else{
			notice.setNoticeId(0);
		}
		notice.setStart((page-1) * rows);
		notice.setRows(rows);
		noticeList = noticeDao.searchNotice(notice);
		Integer count = noticeDao.getNoticeNum(notice);
		Page<Notice> result = new Page<>();
		result.setPage(page);
		result.setRows(noticeList);
		result.setSize(rows);
		result.setTotal(count);
		return result;
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
