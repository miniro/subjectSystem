package team.ftthzj.subjectsystem.dao;
import team.ftthzj.subjectsystem.po.Message;

import java.util.List;


public interface MessageDao {
    public int addMessage(Message Message);

    //查询消息数目
    public Integer getMessageNum(Message message);

    //查询消息
    public List<Message> searchMessage(Message message);

    //修改消息
    public int updateMessage(Message message);

    //删除消息
    public int deleteMessage(int messageId);

    public Message getMessage(int messageId);
}
