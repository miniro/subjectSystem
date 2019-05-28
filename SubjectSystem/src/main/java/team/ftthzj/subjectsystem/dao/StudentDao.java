package team.ftthzj.subjectsystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	public int deleteStudent(String studentId);
	
	//修改密码
	public int updatePwd(String studentId, String pwd);

	/**
	 * 通过账号和密码查询用户
	 */
	public Student findStu(@Param("email") String email,
						 @Param("password") String password);
}
