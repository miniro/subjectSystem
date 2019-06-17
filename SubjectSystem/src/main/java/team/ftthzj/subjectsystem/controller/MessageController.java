package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import team.ftthzj.subjectsystem.common.utils.Page;
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

    @RequestMapping(value = "/message/addMessage.action")
    public String addMessage(String content,String service,HttpSession session) {
        Student student = (Student) session.getAttribute("STU_SESSION");
        Message message =new Message();
        message.setStudentId(student.getStudentId());
        message.setContent(content);
        if(service.equals("联系管理员"))
            message.setErrorType(0);
        if(service.equals("提出建议"))
            message.setErrorType(1);
        if(service.equals("其他类型"))
            message.setErrorType(2);
        message.setProperty(0);
        messageService.addMessage(message);
        return "redirect:list.action";
    }

    @RequestMapping(value = "/connectUs.action")
    public String toConnectUs() {
        return "connectUs";
    }

    /**
     * 消息列表
     */
    @RequestMapping(value = "/message/list.action")
    public String listMessage(@RequestParam(defaultValue="1")Integer page,
                              @RequestParam(defaultValue="10")Integer rows, String errorType, String studentId, String content, Model model, HttpSession session) {
        Page<Message> messagePage = messageService.searchMessage(page, rows, errorType, studentId, content);
        model.addAttribute("page", messagePage);
        model.addAttribute("errorType", errorType);
        model.addAttribute("studentId", studentId);
        model.addAttribute("content", content);
        model.addAttribute("flag", session.getAttribute("FLAG"));

        return "message";
    }


    @RequestMapping(value = "/message/create.action")
    @ResponseBody
    public String creatMessage(HttpServletRequest request){
        Message message=new Message();
        message.setErrorType(0);
        message.setContent(request.getParameter("content"));
        message.setStudentId(request.getParameter("studentId"));
        message.setProperty(1);
        int rows = messageService.addMessage(message);
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
    public Message getMessageById(Integer id) {
        Message message = messageService.searchMessageById(id);
        return message;
    }

    @RequestMapping(value = "/message/delete.action")
    @ResponseBody
    public String deleteMessage(HttpServletRequest request) {
        int flag=messageService.deleteMessage(Integer.valueOf(request.getParameter("id")));
        if(flag==1){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/message/update.action")
    @ResponseBody
    public String updateMessage(Message message){
        int rows = messageService.updateMessage(message);
        if(rows > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

}
