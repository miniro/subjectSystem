package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.CourseForUi;

public interface CourseForUiService {

    //转化格式
    public CourseForUi format(Course course);
}
