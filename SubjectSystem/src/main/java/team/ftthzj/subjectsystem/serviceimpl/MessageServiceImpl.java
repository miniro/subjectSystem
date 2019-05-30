package team.ftthzj.subjectsystem.serviceimpl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.dao.CourseDao;
import team.ftthzj.subjectsystem.dao.MessageDao;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.Message;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.MessageService;

import java.util.List;

@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;

	@Override
	public int addMessage(Message message){
		messageDao.addMessage(message);
		return 1;
	}

	//删除消息
	public int deleteMessage(int messageId){
		messageDao.deleteMessage(messageId);
		return 1;
	}

	//获取消息
	public Message searchMessageById(int messageId){
		return  messageDao.getMessage(messageId);
	}

	//更新消息
	public int updateMessage(Message message){
		messageDao.updateMessage(message);
		return 1;
	}


}
