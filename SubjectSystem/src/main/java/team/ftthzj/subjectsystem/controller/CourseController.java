package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.BasicService;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.ScoreService;
import team.ftthzj.subjectsystem.serviceimpl.BasicServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * 课程控制器类
 */
@Controller
public class CourseController {
    // 依赖注入
    @Autowired
    private CourseService courseService;
    @Autowired
    private ScoreService scoreService;
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
    public String toCourseTable(HttpSession session, Model model) {
        Student student = (Student) session.getAttribute("STU_SESSION");
        List<Score> scores= scoreService.searchScoreByStudentId(student.getStudentId());
        List<Course> courses=new ArrayList<>();
        List<Course> coursesPreset=new ArrayList<>();
        for(Score score:scores){
            Course course=courseService.searchCourseById(score.getCourseId());
            if(course.getPreset()==0)
                courses.add(course);
            else
                coursesPreset.add(course);
        }
        List<List<String>> coursesName=getCoursesName(courses);
        List<List<String>> coursesPresetName=getCoursesName(coursesPreset);
        model.addAttribute("coursesTable", courses);
        model.addAttribute("coursesName", coursesName);
        model.addAttribute("coursesPresetName", coursesPresetName);
        return "courseTable";
    }
    class CourseComparator implements Comparator<Course> {
        public int compare(Course object1, Course object2) {// 实现接口中的方法
            return new Integer(object1.getStartingTime()).compareTo(object2.getStartingTime());
        }
    }
    public void sortCourse(List<Course> list){
        Collections.sort(list,new CourseComparator());
    }
    List<String> generate(List<Course> list){
        List<String> day=new ArrayList<>();
        for(int i=0;i<12;i++)
            day.add("''");
        for(Course course:list){
            int start=course.getStartingTime();
            int during=course.getDuration();
            System.out.println(course.getcourseName());
            for(int j=0;j<during;j++){
                day.remove(start-1+j);
                day.add(start-1+j,"'"+course.getcourseName()+"'");
            }
        }
        return day;
    }
    public List<List<String>> getCoursesName(List<Course> courses){
        List<List<String>> coursesName=new ArrayList<>();
        List<Course> day1=new ArrayList<>();List<Course> day2=new ArrayList<>();
        List<Course> day3=new ArrayList<>();List<Course> day4=new ArrayList<>();
        List<Course> day5=new ArrayList<>();List<Course> day6=new ArrayList<>();
        List<Course> day7=new ArrayList<>();
        for(Course course:courses){
            if (course.getWeekTime()==1)
                day1.add(course);
            if (course.getWeekTime()==2)
                day2.add(course);
            if (course.getWeekTime()==3)
                day3.add(course);
            if (course.getWeekTime()==4)
                day4.add(course);
            if (course.getWeekTime()==5)
                day5.add(course);
            if (course.getWeekTime()==6)
                day6.add(course);
            if (course.getWeekTime()==7)
                day7.add(course);
        }
        sortCourse(day1);sortCourse(day2);sortCourse(day3);sortCourse(day4);
        sortCourse(day5);sortCourse(day6);sortCourse(day7);
        List<String> day11=generate(day1);List<String> day22=generate(day2);
        List<String> day33=generate(day3);List<String> day44=generate(day4);
        List<String> day55=generate(day5);List<String> day66=generate(day6);
        List<String> day77=generate(day7);
        coursesName.add(day11);coursesName.add(day22);
        coursesName.add(day33);coursesName.add(day44);
        coursesName.add(day55);coursesName.add(day66);
        coursesName.add(day77);
        return coursesName;
    }
}
