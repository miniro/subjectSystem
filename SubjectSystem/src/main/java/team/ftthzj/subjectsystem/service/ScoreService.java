package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.po.CourseForUi;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.po.ScoreForUi;

import java.util.List;

public interface ScoreService {

	// 学生选课
	public int chooseCourse(String studentId, String courseId);

	//学生退课
	public int dropCourse(String studentId, String courseId);

	// 录入成绩
	public int addScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore,
						double sumScore);

	// 通过学生id查询成绩
	public List<Score> searchScoreByStudentId(String studentId);

	// 通过课程id查询成绩
	public List<Score> searchScoreByCourseId(String courseId);

	//查询成绩
	public Page<ScoreForUi> searchSelectedCourses(Integer page, Integer rows, String studentId, String courseName, String property);

	public List<Score> getScoreByStuAndCourse(String stuId, String courseId);

	public List<Score> getScoreByScoreId(int scoreId);

	public int updateScore(Score score);
}
