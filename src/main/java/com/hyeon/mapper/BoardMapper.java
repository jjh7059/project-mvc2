package com.hyeon.mapper;

import java.util.List;
import java.util.Map;

import com.hyeon.dto.Board;

public interface BoardMapper {
	int insertBoard(Board board);
	int updateBoard(Board board);
	Board selectNumBoard(int num);
	List<Board> selectEmailBoard(Map<String, Object> map);
	List<Board> selectBoardList();
	int selectPageBoardCount();
	List<Board> selectPageBoardList(Map<String, Object> map);
	int selectEmailBoardCount(String writer);
}
