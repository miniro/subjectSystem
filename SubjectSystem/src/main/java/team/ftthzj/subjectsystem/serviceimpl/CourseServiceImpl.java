package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
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
	public Course searchPresetCourseById(String courseId) {
		return courseDao.searchPresetCourseById(courseId);
	}
	public List<Course> searchCoursesByName(String courseName) {
		Course course = new Course();
		course.setcourseName(courseName);
		return courseDao.searchCourses(course);
	}

	public List<Course> searchCoursesByProperty(int property) {
		Course course = new Course();
		course.setProperty(property);
		return courseDao.searchCourses(course);
	}

	@Override
	public List<Course> loadAllCourses() {
		Course course = new Course();
		course.setId(0);
		return courseDao.searchCourses(course);
	}

	@Override
	public Page<Course> searchCourses(Integer page, Integer rows, String courseId, String courseName, String teacherName, String property, String credit) {
		Course course = new Course();
		int cnt = 0;
		if(StringUtils.isNotBlank(courseId)){
			course.setcourseId(courseId);
			cnt += 1;
		}
		if(StringUtils.isNotBlank(courseName)){
			course.setcourseName(courseName);
			cnt += 1;
		}
		if(StringUtils.isNotBlank(property)){
			course.setProperty(Integer.valueOf(property));
			cnt += 1;
		}
		if(StringUtils.isNotBlank(credit)){
			course.setCredit(Integer.valueOf(credit));
			cnt += 1;
		}
		if(cnt == 0){
			course.setId(0);
		}
		course.setStart((page-1) * rows);
		course.setRows(rows);
		List<Course> courses = courseDao.searchCourses(course);
		Integer count = courseDao.getCourseNum(course);
		Page<Course> result = new Page<>();
		result.setPage(page);
		result.setRows(courses);
		result.setSize(rows);
		result.setTotal(count);
		return result;
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
