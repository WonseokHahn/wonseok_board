package com.neo.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.neo.board.model.sevice.BoardService;
import com.neo.board.model.vo.Board;


@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	//글 목록 검색
	@RequestMapping("/getBoardList.do")
	public String getBoardList() {
		
		return "boardList"; // View 이름 리턴
	}
	
	// 글 쓰기 페이지 이동
	@RequestMapping("/moveInsertBoard.do") 
	public String moveInsertBoard()throws Exception{
		return "insertBoard";
	}
	

	// 글 상세 조회
	@RequestMapping("/getContent.do")
	public String getBoard(Board vo, Model model) {
		model.addAttribute("board", boardService.getContent(vo)); // Model 정보 저장
		return "contentBoard"; // View 이름 리턴
	}


}
