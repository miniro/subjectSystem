package team.ftthzj.subjectsystem.dao;

import team.ftthzj.subjectsystem.po.Score;

import java.util.List;

public interface ScoreDao {
	
	//学生选课
	public int chooseCourse(Score score);
	
	//录入或修改成绩
	public int addScore(Score score);
	
	//查询成绩
	public List<Score> searchScores(Score score);

	//查询成绩数目
	public Integer getScoreNum(Score score);

	//删除成绩
	public int deleteScore(Score score);

	//根据学生id和课程id获取成绩
	public Score getScoreByStuAndCourse(String stuId,String courseId);

	//更新成绩
	public int updateScore(Score score);

	public List<Score> searchScoresById(Score score);

}
