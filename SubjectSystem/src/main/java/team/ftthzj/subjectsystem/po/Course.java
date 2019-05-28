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
	public String getSchoolTime() {
		return schoolTime;
	}
	public void setSchoolTime(String schoolTime) {
		this.schoolTime = schoolTime;
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
	private String schoolTime; //上课时间
	private Date beginTime;
	private Date endTime;
	private int property; //课程性质
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	
}
