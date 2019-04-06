package org.bowlingTeam.service;

import java.util.List;

import org.bowlingTeam.domain.ScoreStatsVO;

public interface ScoreStatsService {

	List<ScoreStatsVO> getScoreStatsList(ScoreStatsVO b);
}
