package com.myspring.daejeon30.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.board.vo.Board2VO;
import com.myspring.daejeon30.paging.Criteria;

public interface Board2DAO {

	

	public List selectAllBoard2List() throws DataAccessException;
	public int insertNewBoard(Map boardMap) throws DataAccessException;

	public Board2VO selectBoard(int rb_num) throws DataAccessException;
	public void updateBoard(Map boardMap) throws DataAccessException;
	public void deleteBoard(int boardNO) throws DataAccessException;
	public List selectImageFileList(int rb_num) throws DataAccessException;
	public int updateBoardView(int boardNO) throws DataAccessException;
	
	//총 게시판 수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<Board2VO> listPage(int displayPost, int postNum) throws Exception;
	
	//페이지
	public List selectBoardList(Criteria cri) throws Exception;
	public int countBoardList()throws Exception;

}
