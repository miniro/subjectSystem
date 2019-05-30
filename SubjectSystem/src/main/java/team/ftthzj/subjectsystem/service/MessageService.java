package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.po.Message;
import java.util.List;

public interface MessageService {

	//新建消息
	public int addMessage(Message message);

	//删除消息
	public int deleteMessage(int messageId);

	//获取消息
	public Message searchMessageById(int messageId);

	//更新消息
	public int updateMessage(Message message);

}
