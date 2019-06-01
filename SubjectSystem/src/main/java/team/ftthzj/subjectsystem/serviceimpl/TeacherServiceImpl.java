package team.ftthzj.subjectsystem.serviceimpl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.dao.TeacherDao;
import team.ftthzj.subjectsystem.po.Teacher;
import team.ftthzj.subjectsystem.service.TeacherService;

@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherDao teacherDao;
	
	public int addTeacher(Teacher teacher) {
		teacherDao.addTeacher(teacher);
		return 1;
	}

	public Teacher searchTeacherById(String teacherId) {
		return teacherDao.searchTeacherById(teacherId);
	}

	public int updateTeacher(Teacher teacher) {
		teacherDao.updateTeacher(teacher);
		return 1;
	}

	public int deleteTeacherById(String teacherId) {
		teacherDao.deleteTeacher(teacherId);
		return 1;
	}

	public List<Teacher> searchAllTeachers() {
		Teacher teacher = new Teacher();
		teacher.setId(0);
		return teacherDao.searchTeacher(teacher);
	}

	@Override
	public Page<Teacher> searchTeachers(Integer page, Integer rows, String teacherId, String name) {
		Teacher teacher = new Teacher();
		List<Teacher> teacherList;
		if(StringUtils.isNotBlank(teacherId) || StringUtils.isNotBlank(name)){
			if(StringUtils.isNotBlank(teacherId)){
				teacher.setTeacherId(teacherId);
			}
			if(StringUtils.isNotBlank(name)){
				teacher.setName(name);
			}
		}else {
			teacher.setId(0);
		}
		teacher.setStart((page-1) * rows);
		teacher.setRows(rows);
		teacherList = teacherDao.searchTeacher(teacher);
		Integer count = teacherDao.getTeacherNum(teacher);
		Page<Teacher> result = new Page<>();
		result.setPage(page);
		result.setRows(teacherList);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 通过账号和密码查询教师
	@Override
	public Teacher findTea(String email, String password) {
		return this.teacherDao.findTea(email, password);
	}
}
