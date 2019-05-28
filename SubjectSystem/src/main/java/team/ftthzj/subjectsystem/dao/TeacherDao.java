package team.ftthzj.subjectsystem.dao;

import java.util.List;

import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;

public interface TeacherDao {

	//添加教师
	public int addTeacher(Teacher teacher);
	
	//通过id查询教师
	public Teacher searchTeacherById(String teacherId);
	
	//通过其他条件查询所有教师
	public List<Teacher> searchTeachers(Teacher teacher);
	
	//修改教师信息
	public int updateTeacher(Teacher teacher);
	
	//删除教师信息
	public int deleteTeacher(String teacher);
	
	//修改密码
	public int updatePwd(String teacherId, String pwd);
}
