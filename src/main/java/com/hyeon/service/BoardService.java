package com.hyeon.service;

import java.util.List;
import java.util.Map;

import com.hyeon.dto.Board;
import com.hyeon.exception.BoardNotFoundException;

public interface BoardService {
	void addBoard(Board board);
	void modifyBoard(Board board) throws BoardNotFoundException;
	Board getNumBoard(int num) throws BoardNotFoundException;
	List<Board> getEmailBoard(Map<String, Object> map);
	List<Board> getBoardList();
	int getPageBoardCount();
	List<Board> getPageBoardList(Map<String, Object> map);
	int getEmailBoardCount(String writer);
}
