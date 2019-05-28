package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.ftthzj.subjectsystem.po.Message;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.MessageService;
import javax.servlet.http.HttpSession;


/**
 * ftt控制器类
 */
@Controller
public class MessageController {
    // 依赖注入
    @Autowired
    private MessageService messageService;

    /**
     * 接收页面请求的JSON数据，并打印JSON格式结果
     */
    @RequestMapping(value = "/message/addMessage.action")
    public String addMessage(String content,String service,HttpSession session) {
        Student student = (Student) session.getAttribute("STU_SESSION");
        Message message =new Message();
        message.setStudentId(student.getStudentId());
        message.setContent(content);
        if(service.equals("系统错误"))
            message.setErrorType(0);
        if(service.equals("课程信息错误"))
            message.setErrorType(1);
        if(service.equals("课表显示错误"))
            message.setErrorType(2);
        if(service.equals("公告显示错误"))
            message.setErrorType(3);
        if(service.equals("成绩录入错误"))
            message.setErrorType(4);
        if(service.equals("其他错误"))
            message.setErrorType(5);
        messageService.addMessage(message);
        return "homepage";
    }

    @RequestMapping(value = "/connectUs.action")
    public String toConnectUs() {
        return "connectUs";
    }

}
