package com.myspring.daejeon30.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.board.dao.Board2DAO;
import com.myspring.daejeon30.board.vo.Board2VO;

@Service("board2Service")
public class Board2ServiceImpl implements Board2Service {
	
	@Autowired
	private Board2DAO board2DAO;
	
	
	public List<Board2VO> listboard2() throws Exception{
		List<Board2VO> board2list = board2DAO.selectAllBoard2List();
		return board2list;
	}


	@Override
	public int addNewBoard(Map boardMap) throws Exception{
		
		return board2DAO.insertNewBoard(boardMap);
		
	}


	@Override
	public Board2VO view_r(int boardNO) throws Exception {
		Board2VO board2VO = board2DAO.selectBoard(boardNO);
		return board2VO;
	}


	@Override
	public void modBoard(Map boardMap) throws Exception {
		board2DAO.updateBoard(boardMap);
		
	}
	
	//조회수 증가 기능
	@Override
	public int boardView(int boardNO) throws Exception{
		int board2V = board2DAO.updateBoardView(boardNO);
		return board2V;
	}
	
	//게시글 총 수
	@Override
	public int count() throws Exception{
		return board2DAO.count();
	}
		
	//게시물 목록 + 페이징
	@Override
	public List listPage(int displayPost, int postNum) throws Exception {
		return board2DAO.listPage(displayPost, postNum);
	}



	@Override
	public void removeBoard(int boardNO) throws Exception {
		board2DAO.deleteBoard(boardNO);
		
	}
}
