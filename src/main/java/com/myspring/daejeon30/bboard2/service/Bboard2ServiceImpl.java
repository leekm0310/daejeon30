package com.myspring.daejeon30.bboard2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.bboard2.dao.Bboard2DAO;
import com.myspring.daejeon30.bboard2.vo.Bboard2VO;
import com.myspring.daejeon30.paging.Criteria;

@Service("bboard2Service")
public class Bboard2ServiceImpl implements Bboard2Service{
	@Autowired
	Bboard2DAO bboard2DAO;
	
	@Override
	public List reviewList() throws Exception{
		List allreview = bboard2DAO.selectAllReview();
		return allreview;
	}
	
	@Override
	public int addreivew(Map reviewMap) throws Exception{
		return bboard2DAO.addreview(reviewMap);
	}
	
	@Override
	public Bboard2VO selectReview(int num) throws Exception{
		return bboard2DAO.selectReview(num);
	}
	
	@Override
	public void deleteReview(int num) throws Exception{
		bboard2DAO.deleteReview(num);
	}
	
	@Override
	public void updateReview(Map reviewMap) throws Exception{
		bboard2DAO.updateReview(reviewMap);
	}
	
	//식당상세에 쓸 리뷰
	@Override
	public List selectedReview(int resNum) throws Exception{
		return bboard2DAO.selectedReview(resNum);
	}
	
	//페이지 테스트
		@Override
		public List<Map<String, Object>> selectReviewList(Criteria cri) throws Exception{
		    return bboard2DAO.selectReviewList(cri);
		}
		@Override
		public int countReviewListTotal() throws Exception{
			return bboard2DAO.countReviewList();
		}

}