package team.ftthzj.subjectsystem.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.common.utils.CSVUtils;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.*;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.ScoreService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
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
                       @RequestParam(defaultValue="10")Integer rows,Integer export,
                       String courseName, String property, Model model, HttpSession sesstion){
        Page<ScoreForUi> scoreForUiPage = scoreService.searchSelectedCourses(page, rows, ((Student)sesstion.getAttribute("STU_SESSION")).getStudentId() ,courseName, property);
        model.addAttribute("page", scoreForUiPage);
        model.addAttribute("flag", sesstion.getAttribute("FLAG"));
        if(export==null);
        else if(export.intValue()==1){
            List<String> dataList=new ArrayList<>();
            String tmp="课程编号,课程名称,学生编号,学生姓名,平时分,期中成绩,期末成绩,总分,学分";
            dataList.add(tmp);
            for(ScoreForUi score :scoreForUiPage.getRows()){
                String s="";
                s=s+score.getCourseId()+",";
                s=s+score.getCourseName()+",";
                s=s+score.getStudentId()+",";
                s=s+score.getStudentName()+",";
                s=s+score.getPacificScore()+",";
                s=s+score.getMidtermScore()+",";
                s=s+score.getFinalScore()+",";
                s=s+score.getSumScore()+",";
                s=s+score.getCredit();
                dataList.add(s);
            }
            CSVUtils.exportCsv(new File("/Users/abao/Desktop/大三下/ftthzj/SubjectSystem/output/score+"+System.currentTimeMillis()+".csv"), dataList);
        }
        return "score";
    }

    @RequestMapping(value = "/teacher/score/list.action")
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows, String courseId, Model model, HttpSession session){
        Page<ScoreForUi> scoreForUiPage = scoreService.searchMyCourses(page, rows, courseId);
        model.addAttribute("page", scoreForUiPage);
        model.addAttribute("flag", session.getAttribute("FLAG"));
        List<Course> courseList;
        if(session.getAttribute("FLAG").equals("TEACHER")){
            courseList = courseService.searchCoursesByTeacherId(((Teacher)session.getAttribute("STU_SESSION")).getTeacherId());
        }else{
            courseList = courseService.loadAllCourses();
        }
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
        int status = scoreService.addScore(request.getParameter("courseId"),request.getParameter("studentId")
                ,Double.valueOf(request.getParameter("pacificScore")),Double.valueOf(request.getParameter("midScore"))
                , Double.valueOf(request.getParameter("finalScore")),Double.valueOf(request.getParameter("sumScore")));
        if(status == -1){
            return "Time Error1";
        }else if(status == -2){
            return "Time Error2";
        }
        return "OK";
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
    public String deletescore(String studentId,String courseId) {
        System.out.println(studentId);
        System.out.println(courseId);
        Score score=scoreService.getScoreByStuAndCourse(studentId,courseId).get(0);
        score.setSumScore(0);
        score.setFinalScore(0);
        score.setMidtermScore(0);
        score.setPacificScore(0);
        int flag=scoreService.updateScore(score);
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
        System.out.println(id);
        List<Score>list=scoreService.getScoreByScoreId(id);
        System.out.println(list.get(0).getId());
        return list.get(0);
    }

    @RequestMapping(value = "/score/getscoreByStuIdAndCourseId.action")
    @ResponseBody
    public Score getScoreByStuIdAndCourseId(String studentId,String courseId) {
        System.out.println(studentId);
        List<Score>list=scoreService.getScoreByStuAndCourse(studentId,courseId);
        System.out.println(list.get(0).getId());
        return list.get(0);
    }

}
