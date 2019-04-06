package org.bowlingTeam.service;

import java.util.List;

import org.bowlingTeam.domain.GameManageVO;

public interface GameManageService {

	void insertGameManage(GameManageVO b);
	List<GameManageVO> getGameManageList(GameManageVO b);
	int getListCount(GameManageVO b);
	void updateHit(int gameId);
	GameManageVO gameManageContDetl(GameManageVO b);
	void editGameManage(GameManageVO eb);
	void delGameManage(int gameId);
	List<GameManageVO> getScoreManageList(int gameId);
	List<GameManageVO> getGameMemList(int gameId);
	void attendGameManage(GameManageVO b);
	void cancleGameManage(GameManageVO b);
	void insertScoreManage(GameManageVO b);
	void deleteScoreGameManage(GameManageVO gameManageVO);
	void regScoreInsert(GameManageVO gameManageVO);
	List<GameManageVO> getScoreManageRegList(GameManageVO gameManageVO);
	List<GameManageVO> getGameMemRegList(GameManageVO gameManageVO);
	void regGameMemInsert(GameManageVO gameManageVO);
}
