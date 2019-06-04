package team.ftthzj.subjectsystem.po;

import java.util.Date;

public class Course {
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getcourseId() {
		return courseId;
	}
	public void setcourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getcourseName() {
		return courseName;
	}
	public void setcourseName(String courseName) {
		this.courseName = courseName;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getProperty() {
		return property;
	}
	public void setProperty(int property) {
		this.property = property;
	}
	private int id;
	private String courseId;

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	private String courseName;
	private double credit; //学分
	private String teacherId;
	private Date beginTime;
	private Date finishTime;
	private Date endTime;
	private int property;
	private int duration;
	private int startingTime;

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getStartingTime() {
		return startingTime;
	}

	public void setStartingTime(int startingTime) {
		this.startingTime = startingTime;
	}

	public int getEnddingTime() {
		return enddingTime;
	}

	public int getPreset() {
		return preset;
	}

	public void setPreset(int preset) {
		this.preset = preset;
	}

	public void setEnddingTime(int enddingTime) {
		this.enddingTime = enddingTime;
	}

	public int getWeekTime() {
		return weekTime;
	}

	public void setWeekTime(int weekTime) {
		this.weekTime = weekTime;
	}


	
	private int enddingTime;
	private int weekTime;
	private int preset;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
}
