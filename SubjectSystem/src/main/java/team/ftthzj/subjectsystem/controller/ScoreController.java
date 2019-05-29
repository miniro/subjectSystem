package team.ftthzj.subjectsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.po.Notice;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.ScoreService;
import team.ftthzj.subjectsystem.service.TeacherService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ScoreController {
    // 依赖注入
    @Autowired
    private ScoreService scoreService;

    /**
     *  成绩列表
     */
    @RequestMapping(value = "/score/listScoreTable.action")
    public String list(){
       return "score";
    }

    @RequestMapping(value = "/score/create.action")
    @ResponseBody
    public String creatscore(HttpServletRequest request){
        int rows = scoreService.addScore(request.getParameter("courseId"),request.getParameter("studentId")
                ,Double.valueOf(request.getParameter("pacificScore")),Double.valueOf(request.getParameter("midScore"))
                , Double.valueOf(request.getParameter("finalScore")),Double.valueOf(request.getParameter("sumScore")));
        if(rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }



    @RequestMapping(value = "/score/update.action")
    @ResponseBody
    public String updateScore(Score score){
        int rows = scoreService.updateScore(score);
        if(rows > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }


    @RequestMapping(value = "/score/delete.action")
    @ResponseBody
    public String deletescore(HttpServletRequest request) {
        Score score=new Score();
        score.setCourseId(request.getParameter("courseId"));
        score.setStudentId(request.getParameter("studentId"));
        int flag=scoreService.deleteScore(score);
        if(flag==1){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    /**
     * 通过id获取成绩信息
     */
    @RequestMapping(value = "/score/getscoreById.action")
    @ResponseBody
    public Score getScoreById(int id) {
        List<Score>list=scoreService.getScoreByScoreId(id);
        return list.get(0);
    }
}
