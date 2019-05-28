package team.ftthzj.subjectsystem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ftthzj.subjectsystem.dao.TeacherDao;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.CourseForUi;
import team.ftthzj.subjectsystem.po.Teacher;
import team.ftthzj.subjectsystem.service.CourseForUiService;


public class CourseForUiServiceImpl implements CourseForUiService {
    @Override
    public CourseForUi format(Course course) {
        CourseForUi courseForUi = new CourseForUi();
        courseForUi.setCourseId(course.getcourseId());
        courseForUi.setCourseName(course.getcourseName());
        courseForUi.setCredit(course.getCredit());
        if(course.getProperty() == 1){
            courseForUi.setProperty("必修课");
        }else {
            courseForUi.setProperty("选修课");
        }
        String[] week = {"一", "二", "三", "四", "五", "六", "日"};
        String words = "周" + week[course.getWeekTime()-1];
        for(int i = course.getStartingTime(); i<=course.getEnddingTime(); i++){
            if(i != course.getStartingTime()){
                words += ",";
            }
            words += String.valueOf(i);
        }
        words += "节";
        courseForUi.setTime(words);

        return courseForUi;
    }
}
