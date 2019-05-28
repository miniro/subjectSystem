package team.ftthzj.subjectsystem.serviceimpl;

import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.Teacher;
import team.ftthzj.subjectsystem.service.BasicService;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.TeacherService;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class BasicServiceImpl implements BasicService {

    @Override
    public Set<String> getTypeDicts(int typeId) {
        Set<String> result = new HashSet<>();
        if(typeId == 1){
            TeacherService teacherService = new TeacherServiceImpl();
            List<Teacher> teachers = teacherService.searchAllTeachers();
            for(Teacher teacher : teachers){
                result.add(teacher.getName());
            }
        }else{
            CourseService courseService = new CourseServiceImpl();
            List<Course> courses = courseService.loadAllCourses();
            if(typeId == 2){
                for(Course course : courses){
                    result.add(String.valueOf(course.getCredit()));
                }
            }else {
                for(Course course : courses){
                    if(course.getProperty() == 1){
                        result.add("必修课");
                    }else {
                        result.add("选修课");
                    }
                }
            }
        }
        return result;
    }
}
