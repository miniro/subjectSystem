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
	
	public int addTeacher(String teacherId, String name, String sex, String grade, String school, String major,
			String qq, String phone, String email, String password, String address, Date enrollmentDate) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Student searchTeacherById(String teacherId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Student> searchTeachersByName(String teacherName) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateTeacher(Student teacher) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteTeacherById(String teacherId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Teacher> searchAllTeachers() {
		// TODO Auto-generated method stub
		return null;
	}

}
