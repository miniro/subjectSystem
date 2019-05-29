package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.CourseForUi;
import team.ftthzj.subjectsystem.po.Score;

import java.util.List;

public interface ScoreService {

	// 学生选课
	public int chooseCourse(String studentId, String courseId);

	// 录入成绩
	public int addScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore,
			double sumScore);

	// 通过学生id查询成绩
	public List<Score> searchScoreByStudentId(String studentId);

	// 通过课程id查询成绩
	public List<Score> searchScoreByCourseId(String courseId);

	// 修改成绩
	public int updateScore(String courseId, String studentId, double pacificScore, double midtermScore,
			double finalScore, double sumScore);

	// 删除成绩
	public int deleteScore(Score score);

	//查询成绩
//	public Page<Score> searchCourses(Integer page, Integer rows, String courseId, String studentId, double pacificScore, double midtermScore, double finalScore, double sumScore);
}
