package org.bowlingTeam.domain;


public class ScoreManageVO {
 /*
  *  네임피라미터 이름,빈클래스변수명,테이블 컬럼명을 일치시킨다.
  */
	private int scoreManage_no;
	private String scoreManage_name;
	private String scoreManage_title;
	private String scoreManage_pwd;
	private String scoreManage_cont;
	private int scoreManage_hit;
	private int scoreManage_ref;
	private int scoreManage_step;
	private int scoreManage_level;
	private String scoreManage_date;
	
	//페이징 쪽나누기 관련변수
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
        
	public int getScoreManage_no() {
		return scoreManage_no;
	}
	public void setScoreManage_no(int scoreManage_no) {
		this.scoreManage_no = scoreManage_no;
	}
	public String getScoreManage_name() {
		return scoreManage_name;
	}
	public void setScoreManage_name(String scoreManage_name) {
		this.scoreManage_name = scoreManage_name;
	}
	public String getScoreManage_title() {
		return scoreManage_title;
	}
	public void setScoreManage_title(String scoreManage_title) {
		this.scoreManage_title = scoreManage_title;
	}
	public String getScoreManage_pwd() {
		return scoreManage_pwd;
	}
	public void setScoreManage_pwd(String scoreManage_pwd) {
		this.scoreManage_pwd = scoreManage_pwd;
	}
	public String getScoreManage_cont() {
		return scoreManage_cont;
	}
	public void setScoreManage_cont(String scoreManage_cont) {
		this.scoreManage_cont = scoreManage_cont;
	}
	public int getScoreManage_hit() {
		return scoreManage_hit;
	}
	public void setScoreManage_hit(int scoreManage_hit) {
		this.scoreManage_hit = scoreManage_hit;
	}
	public int getScoreManage_ref() {
		return scoreManage_ref;
	}
	public void setScoreManage_ref(int scoreManage_ref) {
		this.scoreManage_ref = scoreManage_ref;
	}
	public int getScoreManage_step() {
		return scoreManage_step;
	}
	public void setScoreManage_step(int scoreManage_step) {
		this.scoreManage_step = scoreManage_step;
	}
	public int getScoreManage_level() {
		return scoreManage_level;
	}
	public void setScoreManage_level(int scoreManage_level) {
		this.scoreManage_level = scoreManage_level;
	}
	public String getScoreManage_date() {
		return scoreManage_date;
	}
	public void setScoreManage_date(String scoreManage_date) {
		this.scoreManage_date = scoreManage_date.substring(0,10);
		//0이상 10미만 사이 년월일만 반환
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
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



















