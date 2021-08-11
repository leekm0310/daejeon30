package com.myspring.daejeon30.boardq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.boardq.dao.BoardqDAO;
import com.myspring.daejeon30.boardq.vo.BoardqVO;
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
	public int addQna(BoardqVO boardqVO) throws Exception{
		return boardqDAO.addQna(boardqVO);
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
	
	//댓글
	@Override
	public List<QcommentVO> allcomments(int num) throws Exception{
		return boardqDAO.allcomments(num);
	}
	
	//제목검색
	public List searchTitle(Map map) throws Exception{
		return boardqDAO.searchTitle(map);
	}
}