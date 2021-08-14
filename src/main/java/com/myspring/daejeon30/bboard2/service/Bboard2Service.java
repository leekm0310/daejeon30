package com.myspring.daejeon30.bboard2.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.bboard2.vo.Bboard2VO;
import com.myspring.daejeon30.paging.Criteria;

public interface Bboard2Service{
	public List reviewList() throws Exception;
	public int addreivew(Map reviewMap) throws Exception;
	public Bboard2VO selectReview(int num) throws Exception;
	public void deleteReview(int num) throws Exception;
	public void updateReview(Map reviewMap) throws Exception;
	public List selectedReview(int resNum) throws Exception;
	
	//페이지테스트
	public List selectReviewList(Criteria cri) throws Exception;
	public int countReviewListTotal() throws Exception;
	
	//아이디별 리뷰검색
	public List reviewById(String id)throws Exception;
}