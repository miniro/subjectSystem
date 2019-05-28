package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.service.BasicService;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.serviceimpl.BasicServiceImpl;

import java.util.List;

/**
 * 课程控制器类
 */
@Controller
public class CourseController {
    // 依赖注入
    @Autowired
    private CourseService courseService;
    /**
     *  课程列表
     */
    @RequestMapping(value = "/course/list.action")
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,String courseId,
                       String courseName, String teacherId, String property, String credit,
                       Model model) {
        Page<Course> courses = courseService.searchCourses(page, rows,
                courseId, courseName, teacherId, property, credit);
        model.addAttribute("page", courses);
        BasicService basicService = new BasicServiceImpl();
        List<String> propertyType = basicService.getTypeDicts(1);
        List<String> creditType = basicService.getTypeDicts(2);
        model.addAttribute("propertyType", propertyType);
        model.addAttribute("creditType", creditType);
        model.addAttribute("courseId", courseId);
        model.addAttribute("courseName", courseName);
        model.addAttribute("teacherId", teacherId);
        model.addAttribute("property", property);
        model.addAttribute("credit", credit);

        return "homepage";
    }

    @RequestMapping(value = "/course/toCourseTable.action")
    public String toCourseTable() {
        return "courseTable";
    }

}
