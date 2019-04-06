package org.bowlingTeam.domain;


public class ScoreStatsVO {
 /*
  *  네임피라미터 이름,빈클래스변수명,테이블 컬럼명을 일치시킨다.
  */
	private int scoreNo;
	private String memId;
	private String memName;
	private int sumScore;
	private int avgScore;
	private int gameCnt;
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
	public int getScoreNo() {
		return scoreNo;
	}
	public void setScoreNo(int scoreNo) {
		this.scoreNo = scoreNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getSumScore() {
		return sumScore;
	}
	public void setSumScore(int sumScore) {
		this.sumScore = sumScore;
	}
	public int getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(int avgScore) {
		this.avgScore = avgScore;
	}
	public int getGameCnt() {
		return gameCnt;
	}
	public void setGameCnt(int gameCnt) {
		this.gameCnt = gameCnt;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
        

}



















