package org.bowlingTeam.domain;


public class GameManageVO {
 /*
  *   GAME_ID number primary key --게임_ID
	 ,GAME_NM varchar2(300) not null --게임_명
	 ,GAME_CONT varchar2(4000) not null --게임_내용
	 ,GAME_DTIME varchar2(14) not null --게임_일시
	 ,GAME_GB_CD varchar2(2) not null --게임_구분_코드(01:정기전,02:교류전)
	 ,CLUB_ID number --클럽_ID
	 ,WRIGHTER_ID VARCHAR2(100)
	 ,WRIGHTER_NM VARCHAR2(100)
	 ,WRIGHT_DATE DATE --등록_일자
	 ,UPDATE_DATE DATE --수정_일자
  */
	private int gameId;
	private String memId;
	private String memName;
	private String gameNm;
	private String gameCont;
	private String gameDtime;
	private String gameGbCd;
	private String clubId;
	private String memList;
	private String wrighterId;
	private String wrighterNm;
	private String wrightDate;
	private String updateDate;
	private int rank;
	private String teamNm;
	private String attendYn;
	private String gameScore;
	private String gameRound;
	private String game1;
	private String game2;
	private String game3;
	private String avgGameScore;
	private String totalScore;
	private String handicap;

	private String[] regScoreList;
	private String[] regScoreMemIdList;
	private String[] regScoreMemNmList;
	
	private String[] regGameMemCheckIdList;
	
	private int gameSeq;
	private String regScoreOne;
	private String regScoreMemIdOne;
	private String regScoreMemNmOne;
	private String regGameMemCheckIdOne;
	
	public String getRegScoreOne() {
		return regScoreOne;
	}
	public void setRegScoreOne(String regScoreOne) {
		this.regScoreOne = regScoreOne;
	}
	public String getRegScoreMemIdOne() {
		return regScoreMemIdOne;
	}
	public void setRegScoreMemIdOne(String regScoreMemIdOne) {
		this.regScoreMemIdOne = regScoreMemIdOne;
	}
	public String getRegScoreMemNmOne() {
		return regScoreMemNmOne;
	}
	public void setRegScoreMemNmOne(String regScoreMemNmOne) {
		this.regScoreMemNmOne = regScoreMemNmOne;
	}
	public String[] getRegScoreMemIdList() {
		return regScoreMemIdList;
	}
	public void setRegScoreMemIdList(String[] regScoreMemIdList) {
		this.regScoreMemIdList = regScoreMemIdList;
	}
	public String getTeamNm() {
		return teamNm;
	}
	public void setTeamNm(String teamNm) {
		this.teamNm = teamNm;
	}
	public String getGame1() {
		return game1;
	}
	public void setGame1(String game1) {
		this.game1 = game1;
	}
	public String getGame2() {
		return game2;
	}
	public void setGame2(String game2) {
		this.game2 = game2;
	}
	public String getGame3() {
		return game3;
	}
	public void setGame3(String game3) {
		this.game3 = game3;
	}
	public String getAvgGameScore() {
		return avgGameScore;
	}
	public void setAvgGameScore(String avgGameScore) {
		this.avgGameScore = avgGameScore;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getHandicap() {
		return handicap;
	}
	public void setHandicap(String handicap) {
		this.handicap = handicap;
	}
	//페이징 쪽나누기 관련변수
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public String getGameNm() {
		return gameNm;
	}
	public void setGameNm(String gameNm) {
		this.gameNm = gameNm;
	}
	public String getGameCont() {
		return gameCont;
	}
	public void setGameCont(String gameCont) {
		this.gameCont = gameCont;
	}
	public String getGameDtime() {
		return gameDtime;
	}
	public void setGameDtime(String gameDtime) {
		this.gameDtime = gameDtime;
	}
	public String getGameGbCd() {
		return gameGbCd;
	}
	public void setGameGbCd(String gameGbCd) {
		this.gameGbCd = gameGbCd;
	}
	public String getClubId() {
		return clubId;
	}
	public void setClubId(String clubId) {
		this.clubId = clubId;
	}
	public String getWrighterId() {
		return wrighterId;
	}
	public void setWrighterId(String wrighterId) {
		this.wrighterId = wrighterId;
	}

	public String getWrightDate() {
		return wrightDate;
	}
	public void setWrightDate(String wrightDate) {
		this.wrightDate = wrightDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
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
	public String getWrighterNm() {
		return wrighterNm;
	}
	public void setWrighterNm(String wrighterNm) {
		this.wrighterNm = wrighterNm;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemList() {
		return memList;
	}
	public void setMemList(String memList) {
		this.memList = memList;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getAttendYn() {
		return attendYn;
	}
	public void setAttendYn(String attendYn) {
		this.attendYn = attendYn;
	}
	public String getGameScore() {
		return gameScore;
	}
	public void setGameScore(String gameScore) {
		this.gameScore = gameScore;
	}
	public String getGameRound() {
		return gameRound;
	}
	public void setGameRound(String gameRound) {
		this.gameRound = gameRound;
	}
	public String[] getRegScoreList() {
		return regScoreList;
	}
	public void setRegScoreList(String[] regScoreList) {
		this.regScoreList = regScoreList;
	}
	public String[] getRegScoreMemNmList() {
		return regScoreMemNmList;
	}
	public void setRegScoreMemNmList(String[] regScoreMemNmList) {
		this.regScoreMemNmList = regScoreMemNmList;
	}
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String[] getRegGameMemCheckIdList() {
		return regGameMemCheckIdList;
	}
	public void setRegGameMemCheckIdList(String[] regGameMemCheckIdList) {
		this.regGameMemCheckIdList = regGameMemCheckIdList;
	}
	public String getRegGameMemCheckIdOne() {
		return regGameMemCheckIdOne;
	}
	public void setRegGameMemCheckIdOne(String regGameMemCheckIdOne) {
		this.regGameMemCheckIdOne = regGameMemCheckIdOne;
	}

}



















