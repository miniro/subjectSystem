package team.ftthzj.subjectsystem.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;
import team.ftthzj.subjectsystem.service.StudentService;
import team.ftthzj.subjectsystem.service.TeacherService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


/**
 * 学生控制器类
 */
@Controller
public class PersonalInforController {
    // 依赖注入
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "/personalInfor/createStu.action")
    @ResponseBody
    public String creatPersonalInforStu(HttpServletRequest request){
        Student student = new Student();
        student.setName(request.getParameter("Name"));
        student.setAddress(request.getParameter("Address"));
        student.setEmail(request.getParameter("Email"));
        student.setEnrollmentDate(new Date(System.currentTimeMillis()));
        student.setGrade(request.getParameter("Grade"));
        student.setMajor(request.getParameter("Major"));
        student.setPassword(request.getParameter("Password"));
        student.setQq(request.getParameter("Qq"));
        student.setPhone(request.getParameter("Phone"));
        student.setSex(request.getParameter("Sex"));
        student.setStudentId(request.getParameter("StudentId"));
        student.setSchool(request.getParameter("School"));
        int rows=rows = studentService.addStudent(student);
        if(rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/personalInfor/createTea.action")
    @ResponseBody
    public String creatPersonalInforTea(HttpServletRequest request){
        Teacher teacher = new Teacher();
        teacher.setName(request.getParameter("Name"));
        teacher.setAddress(request.getParameter("Address"));
        teacher.setEmail(request.getParameter("Email"));
        teacher.setMajor(request.getParameter("Major"));
        teacher.setPassword(request.getParameter("Password"));
        teacher.setQq(request.getParameter("Qq"));
        teacher.setPhone(request.getParameter("Phone"));
        teacher.setSex(request.getParameter("Sex"));
        teacher.setTeacherId(request.getParameter("teacherId"));
        teacher.setPosition(request.getParameter("position"));
        int rows = teacherService.addTeacher(teacher);
        if(rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    @RequestMapping(value = "/personalInfor/update.action")
    @ResponseBody
    public String updatePersonalInforStu(HttpServletRequest request){
        int flag1=0,flag2=0;
        if(request.getParameter("studentId")!=null) {
            Student student = new Student();
            student.setName(request.getParameter("name"));
            student.setAddress(request.getParameter("address"));
            student.setEmail(request.getParameter("email"));
            student.setEnrollmentDate(new Date(System.currentTimeMillis()));
            student.setGrade(request.getParameter("grade"));
            student.setMajor(request.getParameter("major"));
            student.setPassword(request.getParameter("password"));
            student.setQq(request.getParameter("qq"));
            student.setPhone(request.getParameter("phone"));
            student.setSex(request.getParameter("sex"));
            student.setStudentId(request.getParameter("studentId"));
            student.setSchool(request.getParameter("school"));
            flag1 = studentService.updateStudent(student);
        }
        if(request.getParameter("teacherId")!=null){
            Teacher teacher=new Teacher();
            teacher.setTeacherId(request.getParameter("teacherId"));
            teacher.setName(request.getParameter("name"));
            teacher.setAddress(request.getParameter("address"));
            teacher.setEmail(request.getParameter("email"));
            teacher.setMajor(request.getParameter("major"));
            teacher.setPassword(request.getParameter("password"));
            teacher.setPhone(request.getParameter("phone"));
            teacher.setPosition(request.getParameter("position"));
            teacher.setQq(request.getParameter("qq"));
            flag2=teacherService.updateTeacher(teacher);
        }
        if(flag1 > 0||flag2 > 0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    @RequestMapping(value = "/personalInfor/delete.action")
    @ResponseBody
    public String deletePersonalInforStu(HttpServletRequest request) {
        int flag=studentService.deleteStudentById(request.getParameter("UserId"));
        int flag2=teacherService.deleteTeacherById(request.getParameter("UserId"));
        if(flag==1||flag2==1){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    /**
     * 通过id获取成绩信息
     */
    @RequestMapping(value = "/personalInfor/getpersonalInforStuById.action")
    @ResponseBody
    public Object getpersonalInforByIdStu(String id) {
        Student student=studentService.searchStudentById(id);
        Teacher teacher=teacherService.searchTeacherById(id);
        if(student!=null){
            return student;
        }
        else {
            return teacher;
        }
    }
    /**
     * 通过id获取成绩信息
     */
    @RequestMapping(value = "/personalInfor/getpersonalInfor.action")
    @ResponseBody
    public Object getpersonalInfor(String studentId,String teacherId) {
        String id="";
        System.out.println(studentId);
        System.out.println(teacherId);
        if(studentId!=null)id=studentId;
        else if(teacherId!=null)id=teacherId;
        Student student=studentService.searchStudentById(id);
        Teacher teacher=teacherService.searchTeacherById(id);
        if(student!=null){
            return student;
        }
        else {
            return teacher;
        }
    }

    @RequestMapping(value = "/personalInfor/list.action")
    public String toINformation(@RequestParam(defaultValue="1")Integer page,
                                @RequestParam(defaultValue="10")Integer rows, String userId,
                                String userName, String userType, Model model) {
        if(userType == null || Integer.valueOf(userType) == 1){
            Page<Student> studentPage = studentService.searchStudents(page, rows, userId, userName);
            model.addAttribute("page", studentPage);
            model.addAttribute("userType", "学生");
        }else {
            Page<Teacher> teacherPage = teacherService.searchTeachers(page, rows, userId, userName);
            model.addAttribute("page", teacherPage);
            model.addAttribute("userType", "教师");
        }
        model.addAttribute("userId", userId);
        model.addAttribute("userName", userName);

        return "personalInfor";
    }

}
