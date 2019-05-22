package team.ftthzj.subjectsystem.dao;

import java.util.List;

import team.ftthzj.subjectsystem.po.Student;

public interface StudentDao {
	
	//添加学生
	public int addStudent(Student student);
	
	//通过id查询学生
	public Student searchStudentById(String studentId);
	
	//通过其他条件查询所有学生
	public List<Student> searchStudents(Student student);
	
	//修改学生信息
	public int updateStudent(Student student);
	
	//删除学生信息
	public int deleteStudent(Student student);
	
	//修改密码
	public int updatePwd(String studentId, String pwd);
}
