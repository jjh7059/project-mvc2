package com.hyeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyeon.dao.BoardDAO;
import com.hyeon.dto.Board;
import com.hyeon.exception.BoardNotFoundException;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	@Transactional
	public void addBoard(Board board) {
		boardDAO.insertBoard(board);
	}

	@Override
	@Transactional
	public void modifyBoard(Board board) throws BoardNotFoundException {
		if(boardDAO.selectNumBoard(board.getNum()) == null) {
			throw new BoardNotFoundException("해당 게시글이 존재하지 않습니다.");
		}
		
		boardDAO.updateBoard(board);
	}

	@Override
	public Board getNumBoard(int num) throws BoardNotFoundException {
		if(boardDAO.selectNumBoard(num) == null) {
			throw new BoardNotFoundException("해당 게시글이 존재하지 않습니다.");
		}
		
		return boardDAO.selectNumBoard(num);
	}

	@Override
	public List<Board> getEmailBoard(Map<String, Object> map) {
		return boardDAO.selectEmailBoard(map);
	}

	@Override
	public List<Board> getBoardList() {
		return boardDAO.selectBoardList();
	}

	@Override
	public int getPageBoardCount() {
		return boardDAO.selectPageBoardCount();
	}

	@Override
	public List<Board> getPageBoardList(Map<String, Object> map) {
		return boardDAO.selectPageBoardList(map);
	}

	@Override
	public int getEmailBoardCount(String writer) {
		return boardDAO.selectEmailBoardCount(writer);
	}
}
