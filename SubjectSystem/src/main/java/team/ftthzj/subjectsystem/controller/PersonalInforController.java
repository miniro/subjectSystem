package team.ftthzj.subjectsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.StudentService;
import team.ftthzj.subjectsystem.service.TeacherService;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;


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

    /**
     *  用户信息列表
     */
    @RequestMapping(value = "/personalInfor/createStu.action")
    @ResponseBody
    public String creatPersonalInforStu(HttpServletRequest request){
        Student student =new Student();
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
        int rows = studentService.addStudent(student);
        if(rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }


    @RequestMapping(value = "/personalInfor/update.action")
    @ResponseBody
    public String updatePersonalInforStu(HttpServletRequest request){
        Student student =new Student();
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
        int rows = studentService.updateStudent(student);
        if(rows > 0){
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
    public Student getpersonalInforByIdStu(String id) {
        Student student=studentService.searchStudentById(id);
        return student;
    }

}
