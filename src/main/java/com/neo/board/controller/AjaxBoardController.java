package com.neo.board.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.neo.board.model.sevice.BoardService;
import com.neo.board.model.vo.Board;

@RestController
@RequestMapping(value = "ajax")
public class AjaxBoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="list")
	public Map<String, Object> AjaxBoardList(Board vo) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		List<Board> b = boardService.getBoardList(vo);
		map.put("b", b);
		
		return map;
	}
	
	@RequestMapping(value="write")
	public int AjaxWriteInsert(Board vo) {
		int result = boardService.insertBoard(vo);
		
		return result;
	}
	
	@RequestMapping(value="search")
	public List<Board> AjaxSearchList(String keyword, String condition) {
		HashMap<String, String> map = new HashMap<String, String>();
		System.out.println(keyword + condition);
		map.put("keyword", keyword);
		map.put("condition", condition);
		List<Board> b = boardService.getSearchList(map);
		
		return b;
	}
	
	@RequestMapping(value="update")
	public int AjaxUpdateBoard(Board vo) {
		System.out.println(vo);
		int result = boardService.updateBoard(vo);
		
		return result;
	}
	
	@RequestMapping(value="delete")
	public int AjaxDelete(Board vo) {
		System.out.println(vo);
		int result = boardService.deleteBoard(vo);
		
		return result;
	}
	
}
