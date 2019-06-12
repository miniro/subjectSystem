package team.ftthzj.subjectsystem.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;

public interface TeacherService {
	// 添加教师
	public int addTeacher(Teacher teacher);

	//通过id查询教师
	public Teacher searchTeacherById(String teacherId);

	//查询所有老师
	public List<Teacher> searchAllTeachers();

	//查询教师
	public List<Teacher> getTeachers(Teacher teacher);

	//查询教师
	public Page<Teacher> searchTeachers(Integer page, Integer rows,String teacherId, String name);
	
	//修改教师信息
	public int updateTeacher(Teacher teacher);
	
	//删除教师
	public int deleteTeacherById(String teacherId);

	// 通过账号和密码查询教师
	public Teacher findTea(String email, String password);
}
