package com.myspring.daejeon30.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.board.dao.Board2DAO;
import com.myspring.daejeon30.board.vo.Board2VO;
import com.myspring.daejeon30.paging.Criteria;

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
	
	//��ȸ�� ���� ���
	@Override
	public int boardView(int boardNO) throws Exception{
		int board2V = board2DAO.updateBoardView(boardNO);
		return board2V;
	}
	
	//�Խñ� �� ��
	@Override
	public int count() throws Exception{
		return board2DAO.count();
	}
		
	//�Խù� ��� + ����¡ - �Ⱦ��°�
	@Override
	public List listPage(int displayPost, int postNum) throws Exception {
		return board2DAO.listPage(displayPost, postNum);
	}
	
	
	//����˻�
	public List searchTitle(Map map) throws Exception{
		return board2DAO.searchTitle(map);
	}
	
	
	//������ �׽�Ʈ
	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception{
	    return board2DAO.selectBoardList(cri);
	}
	@Override
	public int countBoardListTotal() throws Exception{
		return board2DAO.countBoardList();
	}



	@Override
	public void removeBoard(int boardNO) throws Exception {
		board2DAO.deleteBoard(boardNO);
		
	}
	
	

	
}
