package com.neo.board.model.sevice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neo.board.model.dao.BoardDao;
import com.neo.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> getBoardList(Board vo) {
		return boardDao.getBoardList(vo);
	}
	
	@Override
	public int insertBoard(Board vo) {
		int insert = boardDao.insertBoard(vo);
		return insert;
	}
	
	@Override
	public Board getContent(Board vo) {
		return boardDao.getContent(vo);
	}

	@Override
	public int updateBoard(Board vo) {
		return boardDao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(Board vo) {
		return boardDao.deleteBoard(vo);
	}

	@Override
	public List<Board> getSearchList(HashMap<String, String> map) {
		
		return boardDao.getSearchList(map);
	}

}