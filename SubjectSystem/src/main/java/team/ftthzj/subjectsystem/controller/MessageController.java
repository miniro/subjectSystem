package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.ftthzj.subjectsystem.po.Message;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.MessageService;
import javax.servlet.http.HttpServletRequest;
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

    /**
     * 消息列表
     */
    @RequestMapping(value = "/message/list.action")
    public String list() {
        return "message";
    }


    @RequestMapping(value = "/message/create.action")
    @ResponseBody
    public String creatmessage(HttpServletRequest request){
        int rows = messageService.addmessage(request.getParameter("title"),request.getParameter("startTime")
                ,request.getParameter("stopTime"),request.getParameter("description"));
        if(rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    /**
     * 通过id获取公告信息
     */
    @RequestMapping(value = "/message/getmessageById.action")
    @ResponseBody
    public message getmessageById(Integer id) {
        message message = messageService.searchmessageById(id);
        return message;
    }

    @RequestMapping(value = "/message/delete.action")
    @ResponseBody
    public String deletemessage(HttpServletRequest request) {
        int flag=messageService.deletemessage(Integer.valueOf(request.getParameter("messageId")));
        if(flag==1){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/message/update.action")
    @ResponseBody
    public String updatemessage(message message){
        int rows = messageService.updatemessage(message);
        if(rows > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

}
