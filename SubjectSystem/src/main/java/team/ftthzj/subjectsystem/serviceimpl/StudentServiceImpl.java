package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
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
		return this.studentDao.searchStudentById(studentId);
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
		return this.studentDao.findStu(email, password);
	}

	public List<Student> searchAllStudents() {
		Student student = new Student();
		student.setId(0);
		return studentDao.searchStudent(student);
	}

	@Override
	public List<Student> getStudents(Student student) {
		return studentDao.searchStudent(student);
	}

	@Override
	public Page<Student> searchStudents(Integer page, Integer rows, String studentId, String name) {
		Student student = new Student();
		List<Student> studentList;
		if(StringUtils.isNotBlank(studentId) || StringUtils.isNotBlank(name)){
			if(StringUtils.isNotBlank(studentId)){
				student.setStudentId(studentId);
			}
			if(StringUtils.isNotBlank(name)){
				student.setName(name);
			}
		}else {
			student.setId(0);
		}
		student.setStart((page-1) * rows);
		student.setRows(rows);
		studentList = studentDao.searchStudent(student);
		Integer count = studentDao.getStudentNum(student);
		Page<Student> result = new Page<>();
		result.setPage(page);
		result.setRows(studentList);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
