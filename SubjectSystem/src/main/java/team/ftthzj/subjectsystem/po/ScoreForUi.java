package team.ftthzj.subjectsystem.po;

public class ScoreForUi {
    private String courseId;
    private String courseName;
    private String property;
    private String credit;
    private String pacificScore;
    private String midtermScore;
    private String sumScore;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String finalScore;
    private int id;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getFinalScore() {
        return finalScore;
    }

    public void setFinalScore(String finalScore) {
        this.finalScore = finalScore;
    }

    public String getPacificScore() {
        return pacificScore;
    }

    public void setPacificScore(String pacificScore) {
        this.pacificScore = pacificScore;
    }

    public String getMidtermScore() {
        return midtermScore;
    }

    public void setMidtermScore(String midtermScore) {
        this.midtermScore = midtermScore;
    }

    public String getSumScore() {
        return sumScore;
    }

    public void setSumScore(String sumScore) {
        this.sumScore = sumScore;
    }
}
