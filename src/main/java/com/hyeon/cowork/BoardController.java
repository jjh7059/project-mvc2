package com.hyeon.cowork;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyeon.dto.Board;
import com.hyeon.exception.BoardNotFoundException;
import com.hyeon.service.BoardService;
import com.hyeon.util.Pager;




@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/fqa")
	public String fqa() {
		return "board/fqa";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(@RequestParam(required = false) List<Board> boardList, Model model) {
		if(boardList == null) {
			model.addAttribute("boardList", boardService.getBoardList());
		} else {
			model.addAttribute("boardList", boardList);
		}
		
		return "board/board";
	}
	
	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public String board_write() {
		return "board/board_write";
	}
	
	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String board_write(@ModelAttribute Board board, Model model) {
		board.setSubject(board.getSubject().replace("<", "&lt;").replace(">", "&gt;"));
		board.setContent(board.getContent().replace("<", "&lt;").replace(">", "&gt;"));
		boardService.addBoard(board);
		
		model.addAttribute("boardList", boardService.getBoardList());
		
		return "board/board";
	}
	
	@RequestMapping("/board_list")
	public String boardList() {
		return "board/board_list";
	}
	
	@RequestMapping(value = "/board_list_ajax", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> boardListAjax(@RequestParam(defaultValue = "1") int pageNum) {
		int totalBoard = boardService.getPageBoardCount();
		int pageSize = 5;
		int blockSize = 5;
		
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("pageBoardList", boardService.getPageBoardList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	@RequestMapping("/board_manager")
	public String boardManager() {
		return "board/board_manager";
	}
	
	@RequestMapping(value = "/board_manager_ajax", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> boardManagerAjax(@RequestParam(defaultValue = "1") int pageNum, @RequestParam String writer) {
		int totalBoard = boardService.getEmailBoardCount(writer);
		int pageSize = 5;
		int blockSize = 5;
		
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("writer", writer);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("managerBoardList", boardService.getEmailBoard(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	@RequestMapping(value = "/board_modify", method = RequestMethod.PUT)
	@ResponseBody
	public String restBoardModify(@RequestBody Board board) throws BoardNotFoundException {
		boardService.modifyBoard(board);
		return "success";
	}
	
	@ExceptionHandler
	public String exceptionHandler(BoardNotFoundException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "member/login";
	}
	
	@RequestMapping(value = "/board_view/{num}", method = RequestMethod.GET)
	@ResponseBody
	public Board restBoardView(@PathVariable int num) throws BoardNotFoundException {
		return boardService.getNumBoard(num);
	}
}
