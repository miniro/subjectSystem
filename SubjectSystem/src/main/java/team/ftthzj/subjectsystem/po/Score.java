package team.ftthzj.subjectsystem.po;

public class Score {
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public double getPacificScore() {
		return pacificScore;
	}
	public void setPacificScore(double pacificScore) {
		this.pacificScore = pacificScore;
	}
	public double getMidtermScore() {
		return midtermScore;
	}
	public void setMidtermScore(double midtermScore) {
		this.midtermScore = midtermScore;
	}
	public double getFinalScore() {
		return finalScore;
	}
	public void setFinalScore(double finalScore) {
		this.finalScore = finalScore;
	}
	public double getSumScore() {
		return sumScore;
	}
	public void setSumScore(double sumScore) {
		this.sumScore = sumScore;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private int id;
	private String courseId;
	private String studentId;
	private double pacificScore; //平时分
	private double midtermScore;
	private double finalScore;
	private double sumScore;
	private int status;

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
}
