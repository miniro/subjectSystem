package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.Message;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.MessageService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * ftt控制器类
 */
@Controller
public class MessageController {
    // 依赖注入
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/message/addMessage.action",method = RequestMethod.POST)
    public String addMessage(String content, int errorType, HttpSession session) {
        Student student = (Student) session.getAttribute("STU_SESSION");
        Message message=new Message();
        message.setStudentId(student.getStudentId());
        message.setContent(content);
        message.setErrorType(errorType);
        messageService.addMessage(message);
        System.out.println(message.getContent());
        return "redirect:connectUs";
    }

    @RequestMapping(value = "/connectUs.action")
    public String toConnectUs() {
        return "connectUs";
    }

}
