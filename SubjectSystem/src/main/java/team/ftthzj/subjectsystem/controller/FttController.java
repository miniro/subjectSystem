package team.ftthzj.subjectsystem.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ftt控制器类
 */
@Controller
public class FttController {

    @RequestMapping(value = "/fttAndHzj/list.action")
    public String toFttAndHzj() {
        return "fttAndHzj";
    }

}
