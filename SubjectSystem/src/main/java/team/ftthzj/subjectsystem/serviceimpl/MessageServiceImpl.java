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
import team.ftthzj.subjectsystem.po.Notice;
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

	@Override
	public Page<Message> searchMessage(Integer page, Integer rows, String errorType, String studentId, String content) {
		Message message = new Message();
		List<Message> messageList;
		if(StringUtils.isNotBlank(errorType) || StringUtils.isNotBlank(studentId) || StringUtils.isNotBlank(content)){
			if(StringUtils.isNotBlank(errorType)){
				message.setErrorType(Integer.valueOf(errorType));
			}
			if(StringUtils.isNotBlank(studentId)){
				message.setStudentId(studentId);
			}
			if(StringUtils.isNotBlank(content)){
				message.setContent(content);
			}
		}else {
			message.setId(0);
		}
		message.setStart((page-1)*rows);
		message.setRows(rows);
		messageList = messageDao.searchMessage(message);
		Integer count = messageDao.getMessageNum(message);
		Page<Message> result = new Page<>();
		result.setPage(page);
		result.setRows(messageList);
		result.setSize(rows);
		result.setTotal(count);
		return result;
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
