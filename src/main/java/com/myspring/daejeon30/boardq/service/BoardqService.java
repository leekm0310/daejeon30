package com.myspring.daejeon30.boardq.service;

import java.util.List;

import com.myspring.daejeon30.boardq.vo.BoardqVO;

public interface BoardqService{
	public List qnaList() throws Exception;
	public int addQna(BoardqVO boardqVO) throws Exception;
}