package team.ftthzj.subjectsystem.serviceimpl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.ftthzj.subjectsystem.common.utils.Page;
import team.ftthzj.subjectsystem.dao.CourseDao;
import team.ftthzj.subjectsystem.dao.ScoreDao;
import team.ftthzj.subjectsystem.dao.StudentDao;
import team.ftthzj.subjectsystem.dao.TeacherDao;
import team.ftthzj.subjectsystem.po.*;
import team.ftthzj.subjectsystem.service.CourseForUiService;
import team.ftthzj.subjectsystem.service.ScoreService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("scoreService")
@Transactional
public class ScoreServiceImpl implements ScoreService{

	@Autowired
	private ScoreDao scoreDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private StudentDao studentDao;
	
	public int chooseCourse(String studentId, String courseId) {
		Course course = courseDao.searchCourseById(courseId);
		if(course.getBeginTime().after(new Date())||course.getFinishTime().before(new Date())){
			return -1;
		}
		Score score = new Score();
		score.setCourseId(courseId);
		score.setStudentId(studentId);
		List<Score> scoreList = scoreDao.searchScores(score);
		if(scoreList.size()!=0){
			return 0;
		}
		Boolean[][] hashTable = new Boolean[8][];
		for(int i=0;i<8;i++){
			hashTable[i] = new Boolean[13];
			for(int j=0;j<13;j++)
				hashTable[i][j]=false;
		}
		Score score1 = new Score();
		score1.setStudentId(studentId);
		List<Score> scores = scoreDao.searchScores(score1);
		for(Score score2 : scores){
			Course course1 = courseDao.searchCourseById(score2.getCourseId());
			for(int i=course1.getStartingTime();i<=course1.getEnddingTime();i++){
				hashTable[course1.getWeekTime()][i]=true;
			}
		}
		Course course1 = courseDao.searchCourseById(courseId);
		for(int i=course1.getStartingTime();i<=course1.getEnddingTime();i++){
			if(hashTable[course1.getWeekTime()][i]){
				return -2;
			}
		}
		scoreDao.chooseCourse(score);
		return 1;
	}

	@Override
	public int dropCourse(String studentId, String courseId) {
		Course course = courseDao.searchCourseById(courseId);
		if(course.getBeginTime().after(new Date())||course.getFinishTime().before(new Date())){
			return -1;
		}
		Score score = new Score();
		score.setStudentId(studentId);
		score.setCourseId(courseId);
		scoreDao.deleteScore(score);

		return 1;
	}


	public int addScore(String courseId, String studentId, double pacificScore, double midtermScore, double finalScore,
			double sumScore) {
//		if(course.getBeginTime().after(new Date())||course.getFinishTime().before(new Date())){
//			return -1;
//		}
		Course course = courseDao.searchCourseById(courseId);
		if(course.getFinishTime().after(new Date())){
			return -1;
		}else if(course.getEndTime().before(new Date())){
			return -2;
		}
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
			scoreForUi.setId(course1.getId());
			scoreForUi.setCourseId(course1.getcourseId());
			scoreForUi.setCourseName(course1.getcourseName());
			scoreForUi.setCredit(String.valueOf(course1.getCredit()));
			if(course1.getProperty() == 1){
				scoreForUi.setProperty("必修课");
			}else{
				scoreForUi.setProperty("选修课");
			}
			scoreForUi.setPacificScore(String.valueOf(scores.get(0).getPacificScore()));
			scoreForUi.setMidtermScore(String.valueOf(scores.get(0).getMidtermScore()));
			scoreForUi.setFinalScore(String.valueOf(scores.get(0).getFinalScore()));
			scoreForUi.setSumScore(String.valueOf(scores.get(0).getSumScore()));
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
	public Page<ScoreForUi> searchMyCourses(Integer page, Integer rows, String courseId) {
		if(courseId == null)
			return null;
		List<ScoreForUi> scoreForUiList = new ArrayList<>();
		Score score1 = new Score();
		score1.setCourseId(courseId);
		List<Score> scores = scoreDao.searchScores(score1);
		for(Score score : scores){
			Student student = studentDao.searchStudentById(score.getStudentId());
			Course course = courseDao.searchCourseById(courseId);
			ScoreForUi scoreForUi = new ScoreForUi();
			scoreForUi.setStudentId(student.getStudentId());
			scoreForUi.setStudentName(student.getName());
			scoreForUi.setCourseId(score.getCourseId());
			scoreForUi.setCourseName(course.getcourseName());
			scoreForUi.setPacificScore(String.valueOf(score.getPacificScore()));
			scoreForUi.setMidtermScore(String.valueOf(score.getMidtermScore()));
			scoreForUi.setFinalScore(String.valueOf(score.getFinalScore()));
			scoreForUi.setSumScore(String.valueOf(score.getSumScore()));
			scoreForUiList.add(scoreForUi);
		}
		Page<ScoreForUi> result = new Page<>();
		int count = scoreDao.getScoreNum(score1);
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
