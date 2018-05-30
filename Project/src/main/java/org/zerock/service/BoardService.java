package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {

	void insertBoard(BoardVO b);
	List<BoardVO> getBoardList(BoardVO b);
	int getListCount(BoardVO b);
	void updateHit(int board_no);
	BoardVO getBoardCont(int board_no);
	void replyBoard(BoardVO rb);
	void editBoard(BoardVO eb);
	void delBoard(int board_no);
}
