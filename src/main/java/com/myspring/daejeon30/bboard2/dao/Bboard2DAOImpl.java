package com.myspring.daejeon30.bboard2.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.bboard2.vo.Bboard2VO;
import com.myspring.daejeon30.paging.Criteria;

@Repository("bboard2DAO")
public class Bboard2DAOImpl implements Bboard2DAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllReview() throws DataAccessException{
		List reviewList = sqlSession.selectList("mapper.bboard2.selectAllReview");
		return reviewList;
	}
	
	@Override
	public int addreview(Map reviewMap) throws DataAccessException{
		int num = selectNewNo();
		reviewMap.put("num", num);
		sqlSession.insert("mapper.bboard2.addreview", reviewMap);
		return num;
	}
	
	@Override
	public Bboard2VO selectReview(int num) throws DataAccessException{
		return sqlSession.selectOne("mapper.bboard2.selectReview", num);
	}
	
	@Override
	public void deleteReview(int num) throws DataAccessException{
		sqlSession.delete("mapper.bboard2.deleteReview", num);
	}
	
	@Override
	public void updateReview(Map reviewMap) throws DataAccessException{
		sqlSession.update("mapper.bboard2.updateReview", reviewMap);
	}
	
	//게시물 번호
	private int selectNewNo() throws DataAccessException{
		return sqlSession.selectOne("mapper.bboard2.selectNewNo");
	}
	
	//식당상세에 쓸 리뷰
	@Override
	public List selectedReview(int resNum) throws DataAccessException{
		return sqlSession.selectList("mapper.bboard2.selectedReview", resNum);
	}
	
	//페이지테스트
		@Override
		@SuppressWarnings("unchecked")
		public List selectReviewList(Criteria cri) {
		    return sqlSession.selectList("mapper.bboard2.getPage", cri);
		}
		@Override
		public int countReviewList()throws Exception{
			return (Integer)sqlSession.selectOne("mapper.bboard2.countreviewList");
		}
}