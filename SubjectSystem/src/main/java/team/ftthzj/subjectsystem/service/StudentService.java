package team.ftthzj.subjectsystem.service;

import java.util.Date;
import java.util.List;

import team.ftthzj.subjectsystem.po.Student;

public interface StudentService {

	// 添加学生
	public int addStudent(Student student);

	//通过id查询学生
	public Student searchStudentById(String studentId);
	
	//通过姓名模糊查询学生
	public List<Student> searchStudentsByName(String studentName);
	
	//查询所有学生
	public List<Student> searchAllStudents();
	
	//修改学生信息
	public int updateStudent(Student student);
	
	//删除学生
	public int deleteStudentById(String studentId);

	// 通过账号和密码查询学生
	public Student findStu(String email,String password);

}

