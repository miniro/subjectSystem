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
}
