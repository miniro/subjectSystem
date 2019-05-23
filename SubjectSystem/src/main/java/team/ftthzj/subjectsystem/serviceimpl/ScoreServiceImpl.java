package team.ftthzj.subjectsystem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.ScoreDao;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.service.ScoreService;

@Service("scoreService")
@Transactional
public class ScoreServiceImpl implements ScoreService{

	@Autowired
	private ScoreDao scoreDao;
	
	public int chooseCourse(String studentId, String courseId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore,
			double sumScore) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Score searchScoreByStudentId(String studentId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Score searchScoreByCourseId(String courseId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Score updateScore(String courseId, String studentId, double pacificScore, double midtermScore,
			double finalScore, double sumScore) {
		// TODO Auto-generated method stub
		return null;
	}

}
