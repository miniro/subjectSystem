package team.ftthzj.subjectsystem.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.*;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.ScoreService;
import team.ftthzj.subjectsystem.service.TeacherService;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ScoreController {
    // 依赖注入
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private CourseService courseService;

    /**
     *  成绩列表
     */
    @RequestMapping(value = "/student/score/list.action")
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,
                       String courseName, String property, Model model, HttpSession sesstion){
        Page<ScoreForUi> scoreForUiPage = scoreService.searchSelectedCourses(page, rows, ((Student)sesstion.getAttribute("STU_SESSION")).getStudentId() ,courseName, property);

        model.addAttribute("page", scoreForUiPage);
        model.addAttribute("flag", sesstion.getAttribute("FLAG"));

        return "score";
    }

    @RequestMapping(value = "/teacher/score/list.action")
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows, String courseId, Model model, HttpSession session){
        Page<ScoreForUi> scoreForUiPage = scoreService.searchMyCourses(page, rows, courseId);
        model.addAttribute("page", scoreForUiPage);
        model.addAttribute("flag", session.getAttribute("FLAG"));
        List<Course> courseList = courseService.searchCoursesByTeacherId(((Teacher)session.getAttribute("STU_SESSION")).getTeacherId());
        model.addAttribute("courseList",courseList);

        return "score";
    }

    //选课
    @RequestMapping(value = "/score/chooseCourse.action")
    @ResponseBody
    public String chooseCourse(String courseId, HttpSession session){
        int status = scoreService.chooseCourse(((Student)session.getAttribute("STU_SESSION")).getStudentId(), courseId);
        if(status == -1){
            return "Not Time";
        }else if(status == 0){
            return "Has";
        }else if(status == -2){
            return "Time Clash";
        }else {
            return "OK";
        }
    }

    @RequestMapping(value = "/score/dropCourse.action")
    @ResponseBody
    public String dropCourse(String courseId, HttpSession session){
        int status = scoreService.dropCourse(((Student)session.getAttribute("STU_SESSION")).getStudentId(), courseId);
        if(status == -1)
            return "Not Time";
        else {
            return "OK";
        }
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


//    @RequestMapping(value = "/score/delete.action")
//    @ResponseBody
//    public String deletescore(HttpServletRequest request) {
//        Score score=new Score();
//        score.setCourseId(request.getParameter("courseId"));
//        score.setStudentId(request.getParameter("studentId"));
//        int flag=scoreService.deleteScore(score);
//        if(flag==1){
//            return "OK";
//        }else {
//            return "FAIL";
//        }
//    }

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
