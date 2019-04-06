package org.bowlingTeam.persistence;

import java.util.List;

import org.bowlingTeam.domain.GameManageVO;

public interface GameManageDAO {

	void insertGameManage(GameManageVO b);
	void insertScoreManage(GameManageVO b);
	List<GameManageVO> getGameManageList(GameManageVO b);
	int getListCount(GameManageVO b);
	void updateHit(int gameId);
	GameManageVO gameManageContDetl(GameManageVO gameId);
	void editGameManage(GameManageVO eb);
	void delGameManage(int gameId);
	List<GameManageVO> getScoreManageList(int gameId);
	List<GameManageVO> getGameMemList(int gameId);
	void attendGameManage(GameManageVO b);
	void cancleGameManage(GameManageVO b);
	void deleteScoreGameManage(GameManageVO b);
	void regScoreInsert(GameManageVO gameManageVO);
	List<GameManageVO> getScoreManageRegList(GameManageVO gameManageVO);
	List<GameManageVO> getGameMemRegList(GameManageVO gameManageVO);
	void regGameMemInsert(GameManageVO gameManageVO);
}
