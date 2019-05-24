package team.ftthzj.subjectsystem.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.dao.ScoreDao;
import team.ftthzj.subjectsystem.po.Score;
import team.ftthzj.subjectsystem.po.Student;
import team.ftthzj.subjectsystem.service.ScoreService;

import java.util.List;

@Service("scoreService")
@Transactional
public class ScoreServiceImpl implements ScoreService{

	@Autowired
	private ScoreDao scoreDao;
	
	public int chooseCourse(String studentId, String courseId) {
		Score score = new Score();
		score.setStudentId(studentId);
		score.setCourseId(courseId);
		scoreDao.chooseCourse(score);
		return 1;
	}

	public int addScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore,
			double sumScore) {
		Score score = new Score();
		score.setCourseId(courseId);
		score.setStudentId(studentId);
		score.setPacificScore(pacificScore);
		score.setMidtermScore(midtermScore);
		score.setFinalScore(finalScore);
		score.setSumScore(sumScore);
		return 1;
	}

	@Override
	public List<Score> searchScoreByStudentId(String studentId) {
		Score score = new Score();
		score.setStudentId(studentId);
		return scoreDao.searchScores(score);
	}

	@Override
	public List<Score> searchScoreByCourseId(String courseId) {
		Score score = new Score();
		score.setStudentId(courseId);
		return scoreDao.searchScores(score);
	}

	@Override
	public int updateScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore, double sumScore) {
		Score score = new Score();
		score.setCourseId(courseId);
		score.setStudentId(studentId);
		score.setPacificScore(pacificScore);
		score.setMidtermScore(midtermScore);
		score.setFinalScore(finalScore);
		score.setSumScore(sumScore);
		scoreDao.addScore(score);
		return 1;
	}


}
