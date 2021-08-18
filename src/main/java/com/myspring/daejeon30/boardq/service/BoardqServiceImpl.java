package com.myspring.daejeon30.boardq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.boardq.dao.BoardqDAO;
import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

@Service("boardqService")
public class BoardqServiceImpl implements BoardqService{
	@Autowired
	BoardqDAO boardqDAO;
	
	@Override
	public List qnaList() throws Exception{
		List allqna = boardqDAO.selectAllQNA();
		return allqna;
	}
	
	@Override
	public void addQna(BoardqVO boardqVO) throws Exception{
		 boardqDAO.addQna(boardqVO);
	}
	
	@Override
	public BoardqVO adminQna(int num) throws Exception{
		BoardqVO bVO = boardqDAO.adminQna(num);
		return bVO;
	}
	
	@Override
	public void updateQna(BoardqVO boardqVO) throws Exception{
		boardqDAO.updateQna(boardqVO);
	}
	
	@Override
	public void deleteQna(int num) throws Exception{
		boardqDAO.deleteQna(num);
	}
	
	@Override
	public BoardqVO passthrow(BoardqVO boardqVO) throws Exception{
		BoardqVO bb = boardqDAO.passthro(boardqVO);
		return bb;
	}
	
	//페이지 테스트
	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception{
	    return boardqDAO.selectBoardList(cri);
	}
	@Override
	public int countBoardListTotal() throws Exception{
		return boardqDAO.countBoardList();
	}
		
	
	//댓글
	@Override
	public List<QcommentVO> allcomments(int num) throws Exception{
		return boardqDAO.allcomments(num);
	}
	
	//검색
	public List searchTitle(Map map) throws Exception{
		return boardqDAO.searchTitle(map);
	}
	
	//아이디별 문의글 - 마이페이지
	@Override
	public List searchbyId(String id)throws Exception{
		return boardqDAO.searchbyId(id);
	}
	
	@Override
	public int newQna()throws Exception{
		return boardqDAO.newQna();
	}
}