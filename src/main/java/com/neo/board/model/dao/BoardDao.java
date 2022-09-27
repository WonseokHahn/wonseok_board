package com.neo.board.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neo.board.model.vo.Board;

@Repository
public class BoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Board> getBoardList(Board vo) {
		return sqlSession.selectList("BoardMapper.getBoardList", vo);	
	}
	
	public int insertBoard(Board vo) {
		return sqlSession.insert("BoardMapper.insertBoard", vo);
	}
	
	public Board getContent(Board vo) {
		return (Board) sqlSession.selectOne("BoardMapper.getContent", vo);
	}
	
	public int updateBoard(Board vo) {
		return sqlSession.update("BoardMapper.updateBoard", vo);
	}

	public int deleteBoard(Board vo) {
		return sqlSession.delete("BoardMapper.deleteBoard", vo);
	}
	
	public List<Board> getSearchList(HashMap<String, String> map) {
		return sqlSession.selectList("BoardMapper.getSearchList", map);	
	}
}
