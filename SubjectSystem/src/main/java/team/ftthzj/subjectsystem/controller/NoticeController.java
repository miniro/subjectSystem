package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ftthzj.subjectsystem.service.NoticeService;

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
    public String toLogin() {
        return "notice";
    }

}
