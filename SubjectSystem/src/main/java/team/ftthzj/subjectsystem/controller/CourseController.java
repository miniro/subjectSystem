package team.ftthzj.subjectsystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.*;
import team.ftthzj.subjectsystem.service.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

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
    @Autowired
    private TeacherService teacherService;

    /**
     *  课程列表
     */
    @RequestMapping(value = "/course/list.action")
    public String list(@RequestParam(defaultValue="1")Integer page,
                       @RequestParam(defaultValue="10")Integer rows,String courseId,
                       String courseName, String teacherName, String property, String credit,
                       Model model) {
        Page<CourseForUi> courses = courseService.searchCourses(page, rows,
                courseId, courseName, teacherName, property, credit);
        model.addAttribute("page", courses);
        model.addAttribute("courseId", courseId);
        model.addAttribute("courseName", courseName);
        model.addAttribute("teacherName", teacherName);
        model.addAttribute("property", property);
        model.addAttribute("credit", credit);
        List<Teacher> teacherList = teacherService.searchAllTeachers();
        model.addAttribute("teacherList", teacherList);
        List<Double> creditList = new ArrayList<>();
        for(double d = 0.5; d<=6.0; d+=0.5){
            creditList.add(d);
        }
        model.addAttribute("creditList", creditList);

        return "homepage";
    }


    @RequestMapping(value = "/course/create.action")
    @ResponseBody
    public String creatCourse(HttpServletRequest request){
        Course course = new Course();
        course.setcourseId(request.getParameter("courseId"));
        course.setcourseName(request.getParameter("courseName"));
        course.setTeacherId(request.getParameter("teacherId"));
        String credit = request.getParameter("credit");
        String weekTime = request.getParameter("weekTime");
        String startingTime = request.getParameter("startingTime");
        String endingTime = request.getParameter("endingTime");
        String property = request.getParameter("property");
        course.setCredit(Double.valueOf(credit));
        course.setWeekTime(Integer.valueOf(weekTime));
        course.setStartingTime(Integer.valueOf(startingTime));
        course.setEnddingTime(Integer.valueOf(endingTime));
        course.setProperty(Integer.valueOf(property));
        int rows = courseService.addCourse(course);
        if(rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }


    @RequestMapping(value = "/course/update.action")
    @ResponseBody
    public String editCourse(HttpServletRequest request){
        int flag = courseService.deleteCourse(request.getParameter("oldCourseId"));
        Course newcourse = new Course();
        newcourse.setcourseId(request.getParameter("courseId"));
        newcourse.setcourseName(request.getParameter("courseName"));
        newcourse.setTeacherId(request.getParameter("teacherId"));
        String startingTime = request.getParameter("startingTime");
        String endingTime = request.getParameter("endingTime");
        String property = request.getParameter("property");
        newcourse.setCredit(Double.valueOf(request.getParameter("credit")));
        newcourse.setWeekTime(Integer.valueOf(request.getParameter("weekTime")));
        newcourse.setStartingTime(Integer.valueOf(startingTime));
        newcourse.setEnddingTime(Integer.valueOf(endingTime));
        newcourse.setProperty(Integer.valueOf(property));
        int rows = courseService.addCourse(newcourse);
        if(flag==1&&rows==1){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/course/delete.action")
    public String deleteCourse(HttpServletRequest request) {
        int flag=courseService.deleteCourse(request.getParameter("courseId"));
        if(flag==1){
            return "OK";
        }else {
            return "FAIL";
        }
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