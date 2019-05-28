package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.po.Message;
import team.ftthzj.subjectsystem.po.Notice;

import java.util.List;

public interface MessageService {

	//新建消息
	public int addMessage(Message message);

}
