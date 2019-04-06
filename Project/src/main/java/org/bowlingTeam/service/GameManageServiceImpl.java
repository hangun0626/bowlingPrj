package org.bowlingTeam.service;

import java.util.List;

import javax.inject.Inject;

import org.bowlingTeam.domain.GameManageVO;
import org.bowlingTeam.persistence.GameManageDAO;
import org.springframework.stereotype.Service;

@Service //서비스 애노테이션 추가해서 스프링에 서비스 등록
public class GameManageServiceImpl implements GameManageService {

	@Inject
	private GameManageDAO gameManageDAO;
	
	@Override
	public void insertGameManage(GameManageVO b) {
		this.gameManageDAO.insertGameManage(b);
	}

	@Override
	public void insertScoreManage(GameManageVO b) {
		this.gameManageDAO.insertScoreManage(b);
	}
	
	@Override
	public List<GameManageVO> getGameManageList(GameManageVO b) {
		return this.gameManageDAO.getGameManageList(b);
	}

	@Override
	public int getListCount(GameManageVO b) {
		return this.gameManageDAO.getListCount(b);
	}

	@Override
	public void updateHit(int gameId) {
		this.gameManageDAO.updateHit(gameId);		
	}

	@Override
	public GameManageVO gameManageContDetl(GameManageVO gameId) {
		return this.gameManageDAO.gameManageContDetl(gameId);
	}

	@Override
	public void editGameManage(GameManageVO eb) {
		this.gameManageDAO.editGameManage(eb);		
	}

	@Override
	public void delGameManage(int gameId) {
		this.gameManageDAO.delGameManage(gameId);		
	}
	
	@Override
	public List<GameManageVO> getScoreManageList(int gameId) {
		return this.gameManageDAO.getScoreManageList(gameId);
	}
	
	@Override
	public List<GameManageVO> getScoreManageRegList(GameManageVO gameManageVO) {
		return this.gameManageDAO.getScoreManageRegList(gameManageVO);
	}
	
	@Override
	public List<GameManageVO> getGameMemRegList(GameManageVO gameManageVO) {
		return this.gameManageDAO.getGameMemRegList(gameManageVO);
	}
	
	@Override
	public List<GameManageVO> getGameMemList(int gameId) {
		return this.gameManageDAO.getGameMemList(gameId); 
	}
	
	@Override
	public void attendGameManage(GameManageVO b) {
		this.gameManageDAO.attendGameManage(b);
	}
	
	@Override
	public void cancleGameManage(GameManageVO b) {
		this.gameManageDAO.cancleGameManage(b);
	}
	@Override
	public void deleteScoreGameManage(GameManageVO b) {
		this.gameManageDAO.deleteScoreGameManage(b);
	}
	
	@Override
	public void regScoreInsert(GameManageVO gameManageVO) {
		this.gameManageDAO.regScoreInsert(gameManageVO);		
	}
	
	@Override
	public void regGameMemInsert(GameManageVO gameManageVO) {
		this.gameManageDAO.regGameMemInsert(gameManageVO);		
	}
	
}






















