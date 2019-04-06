package org.bowlingTeam.service;

import javax.inject.Inject;

import org.bowlingTeam.domain.ScoreManageVO;
import org.bowlingTeam.persistence.ScoreManageDAO;
import org.springframework.stereotype.Service;

@Service //서비스 애노테이션 추가해서 스프링에 서비스 등록
public class ScoreManageServiceImpl implements ScoreManageService {

	@Inject
	private ScoreManageDAO scoreManageDAO;
	
	@Override
	public void insertScoreManage(ScoreManageVO b) {
		this.scoreManageDAO.insertScoreManage(b);
	}

	@Override
	public int getListCount(ScoreManageVO b) {
		return this.scoreManageDAO.getListCount(b);
	}

	@Override
	public void updateHit(int scoreManage_no) {
		this.scoreManageDAO.updateHit(scoreManage_no);		
	}

	@Override
	public ScoreManageVO getScoreManageCont(int scoreManage_no) {
		return this.scoreManageDAO.getScoreManageCont(scoreManage_no);
	}

	@Override
	public void editScoreManage(ScoreManageVO eb) {
		this.scoreManageDAO.editScoreManage(eb);		
	}

	@Override
	public void delScoreManage(int scoreManage_no) {
		this.scoreManageDAO.delScoreManage(scoreManage_no);		
	}
}























