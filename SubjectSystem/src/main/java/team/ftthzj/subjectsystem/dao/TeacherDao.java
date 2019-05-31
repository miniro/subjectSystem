package team.ftthzj.subjectsystem.dao;

import java.util.List;

import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;

public interface TeacherDao {

	//添加教师
	public int addTeacher(Teacher teacher);
	
	//通过id查询教师
	public Teacher searchTeacherById(String teacherId);

	//查询教师
	public List<Teacher> searchTeacher(Teacher teacher);

	//查询教师数目
	public Integer getTeacherNum(Teacher teacher);
	
	//修改教师信息
	public int updateTeacher(Teacher teacher);
	
	//删除教师信息
	public int deleteTeacher(String teacher);
}
