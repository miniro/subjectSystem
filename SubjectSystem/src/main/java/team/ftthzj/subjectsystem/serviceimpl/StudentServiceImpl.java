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
	
	public int addStudent(Student student) {
		studentDao.addStudent(student);
		return 1;
	}

	public Student searchStudentById(String studentId) {
		return studentDao.searchStudentById(studentId);
	}

	public List<Student> searchStudentsByName(String studentName) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateStudent(Student student) {
		studentDao.updateStudent(student);
		return 1;
	}

	public int deleteStudentById(String studentId) {
		studentDao.deleteStudent(studentId);
		return 1;
	}

	@Override
	public Student findStu(String email, String password) {
		Student  student = this.studentDao.findStu(email, password);
		return student;
	}

	public List<Student> searchAllStudents() {
		// TODO Auto-generated method stub
		return null;
	}

}
