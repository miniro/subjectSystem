package team.ftthzj.subjectsystem.serviceimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.dao.CourseDao;
import team.ftthzj.subjectsystem.dao.ScoreDao;
import team.ftthzj.subjectsystem.dao.TeacherDao;
import team.ftthzj.subjectsystem.po.*;
import team.ftthzj.subjectsystem.service.CourseForUiService;
import team.ftthzj.subjectsystem.service.CourseService;

@Service("courseService")
@Transactional
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private TeacherDao teacherDao;
	@Autowired
	private ScoreDao scoreDao;

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
	public Page<CourseForUi> searchCourses(Integer page, Integer rows, String courseId, String courseName, String teacherName, String property, String credit, String content, String studentId) {
		Course course = new Course();
		List<String> teacherIdList = new ArrayList<>();
		int cnt = 0;
		if(StringUtils.isNotBlank(courseId)){
			course.setcourseId(courseId);
			cnt += 1;
		}
		if(StringUtils.isNotBlank(courseName)){
			course.setcourseName(courseName);
			cnt += 1;
		}
		if(StringUtils.isNotBlank(teacherName)){
			Teacher teacher = new Teacher();
			teacher.setName(teacherName);
			List<Teacher> teacherList = teacherDao.searchTeacher(teacher);
			for (Teacher t : teacherList){
				teacherIdList.add(t.getTeacherId());
			}
			cnt += 1;
		}
		if(StringUtils.isNotBlank(property)){
			course.setProperty(Integer.valueOf(property));
			cnt += 1;
		}
		if(cnt == 0){
			course.setId(0);
		}
		course.setStart((page-1) * rows);
		course.setRows(rows);
		List<Course> courses = new ArrayList<>();
		if(teacherIdList.size() > 0){
			for(String s : teacherIdList){
				course.setTeacherId(s);
				List<Course> coursesPart = courseDao.searchCourses(course);
				courses.addAll(coursesPart);
			}
		}else {
			courses = courseDao.searchCourses(course);
		}
        CourseForUiService courseForUiService = new CourseForUiServiceImpl();
        List<CourseForUi> list = new ArrayList<>();
        //补充
		List<String> courseIdList = new ArrayList<>();
		List<Score> scoreList;
		if(StringUtils.isNotBlank(content) && Integer.valueOf(content)==2){
			Score score = new Score();
			score.setStudentId(studentId);
			scoreList = scoreDao.searchScores(score);
			for(Score score1 : scoreList){
				courseIdList.add(score1.getCourseId());
			}
		}
		//
        for(Course course1 : courses){
        	if(courseIdList.size()!=0&&courseIdList.contains(course1.getcourseId())||courseIdList.size()==0){
				CourseForUi courseForUi = courseForUiService.format(course1);
				courseForUi.setTeacherName(teacherDao.searchTeacherById(course1.getTeacherId()).getName());
				list.add(courseForUi);
			}
        }
		Integer count = courseDao.getCourseNum(course);
		Page<CourseForUi> result = new Page<>();
		result.setPage(page);
		result.setRows(list);
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
