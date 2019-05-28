package team.ftthzj.subjectsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.StudentService;

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
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "redirect:login";
	}

	/**
	 * 用户基本信息页面
	 */
	@RequestMapping(value = "/information/list.action")
	public String toINformation() {
		return "personalInfor";
	}


}
