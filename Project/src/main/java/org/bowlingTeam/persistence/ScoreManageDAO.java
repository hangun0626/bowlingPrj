package org.bowlingTeam.persistence;

import org.bowlingTeam.domain.ScoreManageVO;

public interface ScoreManageDAO {

	void insertScoreManage(ScoreManageVO b);
	int getListCount(ScoreManageVO b);
	void updateHit(int scoreManage_no);
	ScoreManageVO getScoreManageCont(int scoreManage_no);
	void editScoreManage(ScoreManageVO eb);
	void delScoreManage(int scoreManage_no);
}
