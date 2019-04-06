package org.bowlingTeam.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.bowlingTeam.domain.ScoreManageVO;
import org.springframework.stereotype.Repository;

@Repository //이 애노테이션을 등록해서 스프링에 DAOImpl 인식
public class ScoreManageDAOImpl implements ScoreManageDAO {

	@Inject
	private SqlSession sqlSession;//자동 의존성 주입.
	//mybatis 쿼리문 실행객체

	@Override
	public void insertScoreManage(ScoreManageVO b) {
      this.sqlSession.insert("scoreManage_in",b);
      //insert()메서드는 레코드 저장, scoreManage_in은 insert 아이디명
      //아이디명은 유일해야 한다.중복 있어면 안된다.
	}//게시판 저장	

	@Override
	public int getListCount(ScoreManageVO b) {
		return this.sqlSession.selectOne("scoreManage_row",b);
//selectOne() 메서드는 단 한개의 레코드만 반환. scoreManage_row는
//select 아이디명		
	}//총레코드 개수

	@Override
	public void updateHit(int scoreManage_no) {
		this.sqlSession.update("scoreManage_hi",scoreManage_no);
		//scoreManage_hi는 update 아이디명,update()메서드가 레코드
		//수정. this.은 생략가능
	}//조회수 증가	

	@Override
	public ScoreManageVO getScoreManageCont(int scoreManage_no) {
		return this.sqlSession.selectOne("scoreManage_co",scoreManage_no);
	}//내용보기

	@Override
	public void editScoreManage(ScoreManageVO eb) {
		this.sqlSession.update("scoreManage_up", eb);		
	}//게시물 수정

	@Override
	public void delScoreManage(int scoreManage_no) {
		this.sqlSession.delete("scoreManage_del",scoreManage_no);
		//delete()메서드로 레코드 삭제, scoreManage_del은 delete 아이
		//디 명
	}//게시물 삭제
}












