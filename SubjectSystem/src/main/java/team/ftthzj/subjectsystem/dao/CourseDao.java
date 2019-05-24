package team.ftthzj.subjectsystem.dao;

import java.util.List;

import team.ftthzj.subjectsystem.po.Course;

public interface CourseDao {
	
	//新建课程
	public int addCourse(Course course);
	
	//通过id查询课程
	public Course searchCourseById(String courseId);
	
	//通过其他条件查询课程
	public List<Course> searchCourses(Course course);
	
	//修改课程
	public int updateCourse(Course course);
	
	//删除课程
	public int deleteCourse(String courseId);
}
