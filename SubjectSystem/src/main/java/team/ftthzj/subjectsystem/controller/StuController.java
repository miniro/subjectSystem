package team.ftthzj.subjectsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.ftthzj.subjectsystem.common.utils.VerifyCodeUtils;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 学生控制器类
 */
@Controller
public class StuController {
	// 依赖注入
	@Autowired
	private StudentService studentService;
	/**
	 * 学生登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String email, String password, Model model, HttpSession session) {
		// 通过账号和密码查询用户
		Student student = studentService.findStu(email, password);
		if(student != null){
			// 将用户对象添加到Session
			session.setAttribute("STU_SESSION", student);
			// 跳转到主页面
			return "redirect:course/list.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	/**
	 * 模拟其他类中跳转到选课页面的方法,测试拦截器
	 */
	@RequestMapping(value = "/toHomepage.action")
	public String toHomepage() {
	    return "homepage";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "login";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "redirect:login";
	}

	/**
	 * 学生基本信息页面
	 */
	@RequestMapping(value = "/information/list.action")
	public String toINformation(HttpSession session) {
		Student student = (Student) session.getAttribute("STU_SESSION");
		session.setAttribute("StudentId", student.getStudentId());
		session.setAttribute("Address", student.getAddress());
		session.setAttribute("Email", student.getEmail());
		session.setAttribute("EnrollmentDate", student.getEnrollmentDate());
		session.setAttribute("Grade", student.getGrade());
		session.setAttribute("Id", student.getId());
		session.setAttribute("Major", student.getMajor());
		session.setAttribute("Name", student.getName());
		session.setAttribute("Phone", student.getPhone());
		session.setAttribute("Qq", student.getQq());
		session.setAttribute("School", student.getSchool());
		session.setAttribute("Sex", student.getSex());
		return "personalInfor";
	}

	@RequestMapping(value="getYzm",method=RequestMethod.GET)
	public void getYzm(HttpServletResponse response,HttpServletRequest request){
		try {
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");
			//生成随机字串
			String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
			//存入会话session
			HttpSession session = request.getSession(true);
			session.setAttribute("_code", verifyCode.toLowerCase());
			//生成图片
			int w = 146, h = 33;
			VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
		} catch (Exception e) {
		}
	}

}
