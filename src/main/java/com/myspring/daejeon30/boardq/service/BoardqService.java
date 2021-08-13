package com.myspring.daejeon30.boardq.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

public interface BoardqService{
	public List qnaList() throws Exception;
	public int addQna(BoardqVO boardqVO) throws Exception;
	public BoardqVO adminQna(int num) throws Exception;
	public void updateQna(BoardqVO boardqVO) throws Exception;
	public void deleteQna(int num) throws Exception;
	
	public BoardqVO passthrow(BoardqVO boardqVO) throws Exception;
	
	//���
	public List<QcommentVO> allcomments(int num) throws Exception;
	
	//����˻�
	public List searchTitle(Map map) throws Exception;
	
	//���̵� ���Ǳ� - ����������
		public List searchbyId(String id)throws Exception;
}