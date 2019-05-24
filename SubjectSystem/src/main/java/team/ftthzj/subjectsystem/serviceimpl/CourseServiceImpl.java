package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.CourseDao;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.CourseService;

@Service("courseService")
@Transactional
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDao;

	public int addCourse(Course course) {
		courseDao.addCourse(course);
		return 1;
	}

	public Course searchCourseById(String courseId) {
		return courseDao.searchCourseById(courseId);
	}

	public List<Course> searchCoursesByName(String courseName) {
		Course course = new Course();
		course.setCourceName(courseName);
		return courseDao.searchCourses(course);
	}

	public List<Course> searchCoursesByProperty(int property) {
		Course course = new Course();
		course.setProperty(property);
		return courseDao.searchCourses(course);
	}

	public int updateCourse(Course course) {
		courseDao.updateCourse(course);
		return 1;
	}

	public int deleteCourse(String courseId) {
		courseDao.deleteCourse(courseId);
		return 1;
	}

}
