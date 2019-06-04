package team.ftthzj.subjectsystem.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * ftt控制器类
 */
@Controller
public class FttController {

    @RequestMapping(value = "/fttAndHzj/list.action")
    public String toFttAndHzj(HttpSession session, Model model) {
        model.addAttribute("flag", session.getAttribute("FLAG"));

        return "fttAndHzj";
    }


}
