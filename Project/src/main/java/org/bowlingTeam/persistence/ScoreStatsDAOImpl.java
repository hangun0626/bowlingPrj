package org.bowlingTeam.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.bowlingTeam.domain.BoardVO;
import org.bowlingTeam.domain.ScoreStatsVO;
import org.springframework.stereotype.Repository;

@Repository //이 애노테이션을 등록해서 스프링에 DAOImpl 인식
public class ScoreStatsDAOImpl implements ScoreStatsDAO {

	@Inject
	private SqlSession sqlSession;//자동 의존성 주입.
	//mybatis 쿼리문 실행객체

	@Override
	public List<ScoreStatsVO> getScoreStatsList(ScoreStatsVO b) {
		return this.sqlSession.selectList("scoreStats_li",b);
		//selectList()메서드는 복수개의 레코드를 검색해서 컬렉션 List로
		//반환한다. select 아이디명 board_li		
	}//게시판 목록

}












