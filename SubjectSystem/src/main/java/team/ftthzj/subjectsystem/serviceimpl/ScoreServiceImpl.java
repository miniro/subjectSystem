package team.ftthzj.subjectsystem.serviceimpl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.dao.CourseDao;
import team.ftthzj.subjectsystem.dao.ScoreDao;
import team.ftthzj.subjectsystem.dao.TeacherDao;
import team.ftthzj.subjectsystem.po.*;
import team.ftthzj.subjectsystem.service.CourseForUiService;
import team.ftthzj.subjectsystem.service.ScoreService;

import java.util.ArrayList;
import java.util.List;

@Service("scoreService")
@Transactional
public class ScoreServiceImpl implements ScoreService{

	@Autowired
	private ScoreDao scoreDao;
	@Autowired
	private CourseDao courseDao;
	
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
		scoreDao.addScore(score);
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
	public int deleteScore(Score score){
		scoreDao.deleteScore(score);
		return 1;
	}

	@Override
	public Page<ScoreForUi> searchSelectedCourses(Integer page, Integer rows, String studentId, String courseName, String property) {
		List<ScoreForUi> scoreForUiList = new ArrayList<>();
		List<Course> courseList;
		Page<ScoreForUi> result = new Page<>();
		Course course = new Course();
		int cnt = 0;
		if(StringUtils.isNotBlank(courseName) || StringUtils.isNotBlank(property)){
			if(StringUtils.isNotBlank(courseName)){
				course.setcourseName(courseName);
				cnt += 1;
			}
			if(StringUtils.isNotBlank(property)){
				course.setProperty(Integer.valueOf(property));
				cnt += 1;
			}
		}
		if(cnt == 0){
			course.setId(0);
		}
		course.setStart((page-1) * rows);
		course.setRows(rows);
		courseList = courseDao.searchCourses(course);
		//补充
		List<Course> courseList1 = new ArrayList<>();
		Score score1 = new Score();
		score1.setStudentId(studentId);
		List<Score> scoreList = scoreDao.searchScores(score1);
		List<String> courseIdList = new ArrayList<>();
		for(Score score2 : scoreList){
			courseIdList.add(score2.getCourseId());
		}
		for(Course course2 : courseList){
			if(courseIdList.contains(course2.getcourseId())){
				courseList1.add(course2);
			}
		}
		//
		for(Course course1 : courseList1){
			Score score = new Score();
			score.setStudentId(studentId);
			score.setCourseId(course1.getcourseId());
			List<Score> scores = scoreDao.searchScores(score);
			ScoreForUi scoreForUi = new ScoreForUi();
			scoreForUi.setCourseId(course1.getcourseId());
			scoreForUi.setCourseName(course1.getcourseName());
			scoreForUi.setCredit(String.valueOf(course1.getCredit()));
			if(course1.getProperty() == 1){
				scoreForUi.setProperty("必修课");
			}else{
				scoreForUi.setProperty("选修课");
			}
			scoreForUi.setFinalScore(String.valueOf(scores.get(0).getFinalScore()));
			scoreForUiList.add(scoreForUi);
		}
		Integer count = courseDao.getCourseNum(course);
		result.setPage(page);
		result.setRows(scoreForUiList);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}


	@Override
	public List<Score> getScoreByStuAndCourse(String stuId,String courseId){
		Score score=new Score();
		score.setStudentId(stuId);
		score.setCourseId(courseId);
		return scoreDao.searchScores(score);
	}

	@Override
	public List<Score> getScoreByScoreId(int scoreId){
		Score score=new Score();
		score.setId(scoreId);
		return scoreDao.searchScoresById(score);
	}

	@Override
	public int updateScore(Score score){
		scoreDao.updateScore(score);
		return 1;
	}

}
