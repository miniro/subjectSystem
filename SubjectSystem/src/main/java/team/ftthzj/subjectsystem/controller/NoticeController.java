package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.po.Notice;
import team.ftthzj.subjectsystem.service.NoticeService;


import javax.servlet.http.HttpServletRequest;

/**
 * 公告控制器类
 */
@Controller
public class NoticeController {
    // 依赖注入
    @Autowired
    private NoticeService noticeService;

    /**
     * 公告列表
     */
    @RequestMapping(value = "/notice/list.action")
    public String list() {
        return "notice";
    }


    @RequestMapping(value = "/notice/create.action")
    @ResponseBody
    public String creatNotice(HttpServletRequest request){
        int rows = noticeService.addNotice(request.getParameter("title"),request.getParameter("startTime")
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
    @RequestMapping(value = "/notice/getnoticeById.action")
    @ResponseBody
    public Notice getNoticeById(Integer id) {
        Notice notice = noticeService.searchNoticeById(id);
        return notice;
    }

    @RequestMapping(value = "/notice/delete.action")
    @ResponseBody
    public String deleteNotice(HttpServletRequest request) {
        int flag=noticeService.deleteNotice(Integer.valueOf(request.getParameter("noticeId")));
        if(flag==1){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/notice/update.action")
    @ResponseBody
    public String updateNotice(Notice notice){
        int rows = noticeService.updateNotice(notice);
        if(rows > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }
}
