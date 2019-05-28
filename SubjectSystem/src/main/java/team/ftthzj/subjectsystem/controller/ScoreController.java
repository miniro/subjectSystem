package team.ftthzj.subjectsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScoreController {
    @RequestMapping(value = "/score/listScoreTable.action")
    public String listScoreTable() {
        return "score";
    }
}
