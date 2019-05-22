package team.ftthzj.subjectsystem.service;

import java.util.Date;
import java.util.List;

import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;

public interface TeacherService {
	// 添加教师
	public int addTeacher(String teacherId, String name, String sex, String grade, String school, String major,
			String qq, String phone, String email, String password, String address, Date enrollmentDate);

	//通过id查询教师
	public Student searchTeacherById(String teacherId);
	
	//通过姓名模糊查询教师
	public List<Student> searchTeachersByName(String teacherName);
	
	//查询所有老师
	public List<Teacher> searchAllTeachers();
	
	//修改教师信息
	public int updateTeacher(Student teacher);
	
	//删除教师
	public int deleteTeacherById(String teacherId);
}
