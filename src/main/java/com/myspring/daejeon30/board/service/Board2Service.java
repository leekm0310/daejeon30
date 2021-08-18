package com.myspring.daejeon30.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.daejeon30.board.vo.Board2VO;
import com.myspring.daejeon30.paging.Criteria;

public interface Board2Service {

	public List listboard2() throws Exception;
	public int addNewBoard(Map boardMap) throws Exception;
	public Board2VO view_r(int rb_num) throws Exception;
	
	
	public void modBoard(Map boardMap) throws Exception;
	public void removeBoard(int rb_num) throws Exception;
	public int boardView(int boardNO) throws Exception;
	public int count() throws Exception;
	public List listPage(int displayPost, int postNum) throws Exception;
	
	//페이지테스트
	public List selectBoardList(Criteria cri) throws Exception;
	public int countBoardListTotal() throws Exception;
	
	//검색
	public List searchTitle(Map map) throws Exception;


}
