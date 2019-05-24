package team.ftthzj.subjectsystem.service;

import java.util.Date;
import java.util.List;

import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;

public interface TeacherService {
	// 添加教师
	public int addTeacher(Teacher teacher);

	//通过id查询教师
	public Teacher searchTeacherById(String teacherId);
	
	//通过姓名模糊查询教师
	public List<Teacher> searchTeachersByName(String teacherName);
	
	//查询所有老师
	public List<Teacher> searchAllTeachers();
	
	//修改教师信息
	public int updateTeacher(Teacher teacher);
	
	//删除教师
	public int deleteTeacherById(String teacherId);
}
