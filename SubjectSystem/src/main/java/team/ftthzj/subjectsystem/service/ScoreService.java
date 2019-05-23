package team.ftthzj.subjectsystem.service;

import team.ftthzj.subjectsystem.po.Score;

public interface ScoreService {

	// 学生选课
	public int chooseCourse(String studentId, String courseId);

	// 录入成绩
	public int addScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore,
			double sumScore);

	// 通过学生id查询成绩
	public Score searchScoreByStudentId(String studentId);

	// 通过课程id查询成绩
	public Score searchScoreByCourseId(String courseId);

	// 修改成绩
	public Score updateScore(String courseId, String studentId, double pacificScore, double midtermScore,
			double finalScore, double sumScore);
}
