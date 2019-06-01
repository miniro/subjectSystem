package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Message;
import java.util.List;

public interface MessageService {

	//新建消息
	public int addMessage(Message message);

	//删除消息
	public int deleteMessage(int messageId);

	//查询消息
	public Page<Message> searchMessage(Integer page, Integer rows, String errorType, String studentId, String content);

	//获取消息
	public Message searchMessageById(int messageId);

	//更新消息
	public int updateMessage(Message message);

}
