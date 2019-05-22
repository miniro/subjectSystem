package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.CourseDao;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.service.CourseService;

@Service("courseService")
@Transactional
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDao;
	
	public int addCourse(String courseId, String courseName, double credit, String teacherId, String schoolTime,
			Date beginTime, Date finishTime, Date endTime, int property) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Course searchCourseById(String courseId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Course> searchCoursesByName(String courseName) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Course> searchCoursesByProperty(int property) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateCourse(Course course) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteCourse(String courseId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
