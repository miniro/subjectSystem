package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.TeacherDao;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;
import team.ftthzj.subjectsystem.service.TeacherService;

@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherDao teacherDao;
	
	public int addTeacher(Teacher teacher) {
		teacherDao.addTeacher(teacher);
		return 1;
	}

	public Teacher searchTeacherById(String teacherId) {
		return teacherDao.searchTeacherById(teacherId);
	}

	public List<Teacher> searchTeachersByName(String teacherName) {
		Teacher teacher = new Teacher();
		teacher.setName(teacherName);
		return teacherDao.searchTeachers(teacher);
	}

	public int updateTeacher(Teacher teacher) {
		teacherDao.updateTeacher(teacher);
		return 1;
	}

	public int deleteTeacherById(String teacherId) {
		teacherDao.deleteTeacher(teacherId);
		return 1;
	}

	public List<Teacher> searchAllTeachers() {
		Teacher teacher = new Teacher();
		teacher.setId(0);
		return teacherDao.searchTeachers(teacher);
	}

}
