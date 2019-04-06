package org.bowlingTeam.service;

import java.util.List;

import javax.inject.Inject;

import org.bowlingTeam.domain.ScoreStatsVO;
import org.bowlingTeam.persistence.ScoreStatsDAO;
import org.springframework.stereotype.Service;

@Service //서비스 애노테이션 추가해서 스프링에 서비스 등록
public class ScoreStatsServiceImpl implements ScoreStatsService {

	@Inject
	private ScoreStatsDAO scoreStatsDAO;
	
	@Override
	public List<ScoreStatsVO> getScoreStatsList(ScoreStatsVO b) {
		return this.scoreStatsDAO.getScoreStatsList(b);
	}

}























