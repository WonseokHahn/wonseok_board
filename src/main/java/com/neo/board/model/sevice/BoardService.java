package com.neo.board.model.sevice;

import java.util.HashMap;
import java.util.List;

import com.neo.board.model.vo.Board;;

public interface BoardService {
	
	// 글 목록 조회
	List<Board> getBoardList(Board vo);
	
	// 글 등록
	int insertBoard(Board vo);

	// 글 상세 조회
	Board getContent(Board vo);
	
	// 글 수정
	int updateBoard(Board vo);

	// 글 삭제
	int deleteBoard(Board vo);
	
	// 글 검색
	List<Board> getSearchList(HashMap<String, String> map);
}