package team.ftthzj.subjectsystem.service;

import java.util.Date;
import java.util.List;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.CourseForUi;

public interface CourseService {

	// 新增课程
	public int addCourse(Course course);

	//通过id查询课程
	public Course searchCourseById(String courseId);

	//通过课程名查询课程
	public List<Course> searchCoursesByName(String courseName);

	//通过课程类型查询课程
	public List<Course> searchCoursesByProperty(int property);

	//列出所有课程
	public List<Course> loadAllCourses();

	//查询课程
	public Page<CourseForUi> searchCourses(Integer page, Integer rows, String courseId, String courseName, String teacherName, String property, String credit);
	
	//修改课程
	public int updateCourse(Course course);
	
	//通过id删除课程
	public int deleteCourse(String courseId);

	//通过id查询预置课程
	public Course searchPresetCourseById(String courseId);
}
