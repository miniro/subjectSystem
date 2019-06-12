package team.ftthzj.subjectsystem.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ftthzj.subjectsystem.common.utils.CSVUtils;
import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.Course;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.po.Teacher;
import team.ftthzj.subjectsystem.service.CourseService;
import team.ftthzj.subjectsystem.service.ScoreService;
import team.ftthzj.subjectsystem.service.StudentService;
import team.ftthzj.subjectsystem.service.TeacherService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    @Autowired
    private CourseService courseService;
    @Autowired
    private ScoreService scoreService;

    @RequestMapping(value = "/personalInfor/createStu.action")
    @ResponseBody
    public String creatPersonalInforStu(HttpServletRequest request){
        if(request.getParameter("StudentId").equals("")){
            return "StudentId Empty";
        }else if(request.getParameter("Name").equals("")){
            return "Name Empty";
        }else if(request.getParameter("Email").equals("")){
            return "Email Empty";
        }else if(request.getParameter("Password").equals("")){
            return "Password Empty";
        }
        Student student1 = new Student();
        student1.setStudentId(request.getParameter("StudentId"));
        student1.setEmail(request.getParameter("Email"));
        List<Student> studentList = studentService.getStudents(student1);
        if(studentList.size()>0){
            return "Duplicate";
        }
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
    @RequestMapping(value = "/personalInfor/import.action")
    @ResponseBody
    public String importPersonalInfor(HttpServletRequest request) throws ParseException {
        String file=request.getParameter("file");
        String filePath=request.getSession().getServletContext().getRealPath("")+"import/"+file.split("\\\\")[2];
        List<String> dataList= CSVUtils.importCsv(new File(filePath));
        if(dataList!=null && !dataList.isEmpty()){
            for(String data : dataList){
                Student student=new Student();
                String tmp[] = data.split(",");
                student.setStudentId(tmp[0]);
                student.setName(tmp[1]);
                student.setSex(tmp[2]);
                student.setGrade(tmp[3]);
                student.setSchool(tmp[4]);
                student.setMajor(tmp[5]);
                student.setQq(tmp[6]);
                student.setPhone(tmp[7]);
                student.setEmail(tmp[8]);
                student.setPassword(tmp[9]);
                student.setAddress(tmp[10]);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
                student.setEnrollmentDate(sdf.parse(tmp[11]));
                studentService.addStudent(student);
            }
        }
        return "OK";
    }
    @RequestMapping(value = "/personalInfor/createTea.action")
    @ResponseBody
    public String creatPersonalInforTea(HttpServletRequest request){
        if(request.getParameter("teacherId").equals("")){
            return "TeacherId Empty";
        }else if(request.getParameter("Name").equals("")){
            return "Name Empty";
        }else if(request.getParameter("Email").equals("")){
            return "Email Empty";
        }else if(request.getParameter("Password").equals("")){
            return "Password Empty";
        }
        Teacher teacher1 = new Teacher();
        teacher1.setTeacherId(request.getParameter("teacherId"));
        teacher1.setEmail(request.getParameter("Email"));
        List<Teacher> teacherList = teacherService.getTeachers(teacher1);
        if(teacherList.size()>0){
            return "Duplicate";
        }
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
//        int flag=studentService.deleteStudentById(request.getParameter("UserId"));
//        int flag2=teacherService.deleteTeacherById(request.getParameter("UserId"));
//        if(flag==1||flag2==1){
//            return "OK";
//        }else {
//            return "FAIL";
//        }
        if(request.getParameter("UserId").charAt(0)=='S'){
            List<Score> scoreList = scoreService.searchScoreByStudentId(request.getParameter("UserId"));
            if(scoreList.size() > 0){
                return "FAIL";
            }
            studentService.deleteStudentById(request.getParameter("UserId"));
        }else{
            List<Course> courseList = courseService.searchCoursesByTeacherId(request.getParameter("UserId"));
            if(courseList.size() > 0){
                return "FAIL";
            }
            teacherService.deleteTeacherById(request.getParameter("UserId"));
        }
        return "OK";
    }

    /**
     * 通过id获取成绩信息
     */
    @RequestMapping(value = "/personalInfor/getpersonalInforStuById.action")
    @ResponseBody
    public Object getpersonalInforByIdStu(String id, HttpSession session, Model model) {
        Student student=studentService.searchStudentById(id);
        Teacher teacher=teacherService.searchTeacherById(id);
        model.addAttribute("flag", session.getAttribute("FLAG"));
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
    @RequestMapping(value = "/personalInfor/getpersonalInforStu.action")
    @ResponseBody
    public Object getpersonalInforStu(String studentId) {
        Student student=studentService.searchStudentById(studentId);
        return student;
    }
    /**
     * 通过id获取成绩信息
     */
    @RequestMapping(value = "/personalInfor/getpersonalInforTea.action")
    @ResponseBody
    public Object getpersonalInforTea(String teacherId) {
        Teacher teacher=teacherService.searchTeacherById(teacherId);
        return teacher;
    }

    @RequestMapping(value = "/personalInfor/list.action")
    public String toINformation(@RequestParam(defaultValue="1")Integer page,
                                @RequestParam(defaultValue="10")Integer rows, String userId,
                                String userName, String userType, Model model, HttpSession session) {
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
        model.addAttribute("flag", session.getAttribute("FLAG"));

        return "personalInfor";
    }

}
