package org.bowlingTeam.persistence;

import java.util.List;

import org.bowlingTeam.domain.ScoreStatsVO;

public interface ScoreStatsDAO {

	List<ScoreStatsVO> getScoreStatsList(ScoreStatsVO b);
}
