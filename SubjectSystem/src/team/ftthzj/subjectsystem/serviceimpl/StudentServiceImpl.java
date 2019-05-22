package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.StudentDao;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.StudentService;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	public int addStudent(String studentId, String name, String sex, String grade, String school, String major,
			String qq, String phone, String email, String password, String address, Date enrollmentDate) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Student searchStudentById(String studentId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Student> searchStudentsByName(String studentName) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteStudentById(String studentId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Student> searchAllStudents() {
		// TODO Auto-generated method stub
		return null;
	}

}
