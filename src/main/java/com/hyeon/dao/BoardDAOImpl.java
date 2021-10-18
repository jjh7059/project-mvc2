package com.hyeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyeon.dto.Board;
import com.hyeon.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).updateBoard(board);
	}

	@Override
	public Board selectNumBoard(int num) {
		return sqlSession.getMapper(BoardMapper.class).selectNumBoard(num);
	}

	@Override
	public List<Board> selectEmailBoard(Map<String, Object> map) {
		return sqlSession.getMapper(BoardMapper.class).selectEmailBoard(map);
	}

	@Override
	public List<Board> selectBoardList() {
		return sqlSession.getMapper(BoardMapper.class).selectBoardList();
	}

	@Override
	public int selectPageBoardCount() {
		return sqlSession.getMapper(BoardMapper.class).selectPageBoardCount();
	}

	@Override
	public List<Board> selectPageBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(BoardMapper.class).selectPageBoardList(map);
	}

	@Override
	public int selectEmailBoardCount(String writer) {
		return sqlSession.getMapper(BoardMapper.class).selectEmailBoardCount(writer);
	}

}
