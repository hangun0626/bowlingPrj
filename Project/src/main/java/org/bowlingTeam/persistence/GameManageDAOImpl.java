package org.bowlingTeam.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.bowlingTeam.domain.GameManageVO;
import org.springframework.stereotype.Repository;

@Repository //이 애노테이션을 등록해서 스프링에 DAOImpl 인식
public class GameManageDAOImpl implements GameManageDAO {

	@Inject
	private SqlSession sqlSession;//자동 의존성 주입.
	//mybatis 쿼리문 실행객체

	@Override
	public void insertGameManage(GameManageVO b) {
      this.sqlSession.insert("gameManage_in",b);
      //insert()메서드는 레코드 저장, gameManage_in은 insert 아이디명
      //아이디명은 유일해야 한다.중복 있어면 안된다.
	}//게시판 저장	

	@Override
	public void insertScoreManage(GameManageVO b) {
      this.sqlSession.insert("gameManage_insertScore",b);
      //insert()메서드는 레코드 저장, gameManage_in은 insert 아이디명
      //아이디명은 유일해야 한다.중복 있어면 안된다.
	}//게시판 저장	
	
	@Override
	public List<GameManageVO> getGameManageList(GameManageVO b) {
		return this.sqlSession.selectList("gameManage_li",b);
//selectList()메서드는 복수개의 레코드를 검색해서 컬렉션 List로
//반환한다. select 아이디명 gameManage_li		
	}//게시판 목록

	@Override
	public int getListCount(GameManageVO b) {
		return this.sqlSession.selectOne("gameManage_row",b);
//selectOne() 메서드는 단 한개의 레코드만 반환. gameManage_row는
//select 아이디명		
	}//총레코드 개수

	@Override
	public void updateHit(int gameId) {
		this.sqlSession.update("gameManage_hi",gameId);
		//gameManage_hi는 update 아이디명,update()메서드가 레코드
		//수정. this.은 생략가능
	}//조회수 증가	

	@Override
	public GameManageVO gameManageContDetl(GameManageVO gameId) {
		return this.sqlSession.selectOne("gameManage_co",gameId);
	}//내용보기

	@Override
	public void editGameManage(GameManageVO eb) {
		this.sqlSession.update("gameManage_up", eb);		
	}//게시물 수정

	@Override
	public void delGameManage(int gameId) {
		this.sqlSession.delete("gameManage_del",gameId);
		//delete()메서드로 레코드 삭제, gameManage_del은 delete 아이
		//디 명
	}//게시물 삭제
	
	@Override
	public List<GameManageVO> getScoreManageList(int gameId) {
		return this.sqlSession.selectList("scoreManage_li",gameId);
	}//점수 목록
	@Override
	public List<GameManageVO> getScoreManageRegList(GameManageVO gameManageVO) {
		return this.sqlSession.selectList("scoreManage_reg",gameManageVO);
	}//점수 목록
	
	@Override
	public List<GameManageVO> getGameMemRegList(GameManageVO gameManageVO) {
		return this.sqlSession.selectList("gameMem_reg",gameManageVO);
	}//게임멤버등록 목록
	
	@Override
	public List<GameManageVO> getGameMemList(int gameId) {
		return this.sqlSession.selectList("gameMem_li",gameId);
	}//게임 참석자 리스트
	
	@Override
	public void attendGameManage(GameManageVO b) {
      this.sqlSession.insert("gameManage_attend",b);
	}//게임 참석
	
	@Override
	public void cancleGameManage(GameManageVO b) {
      this.sqlSession.insert("gameManage_cancle",b);
	}//게임 취소
	
	@Override
	public void deleteScoreGameManage(GameManageVO b) {
      this.sqlSession.delete("gameManage_deleteScore",b);
	}//게임 취소
	
	
	@Override
	public void regGameMemInsert(GameManageVO gameManageVO) {
		for(int i=0; i < gameManageVO.getRegGameMemCheckIdList().length; i++) {
			gameManageVO.setRegGameMemCheckIdOne(gameManageVO.getRegGameMemCheckIdList()[i]);
			this.sqlSession.insert("regGameMemInsert",gameManageVO);
		System.out.println("회원추가인서트--------------------------");
		}

	}//점수 저장	
	
	@Override
	public void regScoreInsert(GameManageVO gameManageVO) {
		this.sqlSession.delete("scoreManage_regReadyDel",gameManageVO);
		for(int i=0; i < gameManageVO.getRegScoreList().length; i++) {
			gameManageVO.setRegScoreOne(gameManageVO.getRegScoreList()[i]);
			gameManageVO.setRegScoreMemIdOne(gameManageVO.getRegScoreMemIdList()[i]);
			gameManageVO.setRegScoreMemNmOne(gameManageVO.getRegScoreMemNmList()[i]);
			this.sqlSession.insert("regScoreInsert",gameManageVO);
		}

	}//회원추가
	
}














