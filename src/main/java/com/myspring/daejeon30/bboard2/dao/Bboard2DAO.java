package com.myspring.daejeon30.bboard2.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.bboard2.vo.Bboard2VO;
import com.myspring.daejeon30.board.vo.Board2VO;
import com.myspring.daejeon30.paging.Criteria;

public interface Bboard2DAO{
	public List selectAllReview() throws DataAccessException;
	public int addreview(Map reviewMap) throws DataAccessException;
	public Bboard2VO selectReview(int num) throws DataAccessException;
	public void deleteReview(int num) throws DataAccessException;
	public void updateReview(Map reviewMap) throws DataAccessException;
	public List selectedReview(int resNum) throws DataAccessException;
	
	//∆‰¿Ã¡ˆ
	public List selectReviewList(Criteria cri) throws Exception;
	public int countReviewList()throws Exception;
}