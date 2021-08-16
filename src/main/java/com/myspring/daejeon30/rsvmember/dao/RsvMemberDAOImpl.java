package com.myspring.daejeon30.rsvmember.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;

@Repository("rsvMemberDAO")
public class RsvMemberDAOImpl implements RsvMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertRsvMember(RsvMemberVO rsvMemberVO)throws Exception{
		//String tes = null;
		//System.out.println("::::::"+null);
		return sqlSession.insert("mapper.rsvMember.insertRsvMember", rsvMemberVO);
	}
	
	@Override
	public List<RsvMemberVO> selectRsv(String id) throws DataAccessException{
		List<RsvMemberVO> rsvlist = sqlSession.selectList("mapper.rsvMember.selectRsv", id);
		return rsvlist;
	}
	
	@Override
	public void updateRsvCancel(String rsvNum) throws DataAccessException{
		sqlSession.update("mapper.rsvMember.updateRsvCancel", rsvNum);
	}
	
	@Override
	public RsvMemberVO selectOneRsv(int rsvNum) throws DataAccessException{
		return sqlSession.selectOne("mapper.rsvMember.selectOneRsv", rsvNum);
	}
	
	//@Override
	//public void updateRsv(String rsvNum) throws DataAccessException{
	//	sqlSession.update("mapper.rsvMember.updateRsv", rsvNum);
	//}
	
	@Override
	public int updateRsv(RsvMemberVO rsvMemberVO) throws DataAccessException{
		int result = sqlSession.update("mapper.rsvMember.updateRsv", rsvMemberVO);
		return result;
	}
	
	@Override
	public int countStatus(Map main)throws DataAccessException{
		int result = sqlSession.selectOne("mapper.rsvMember.countStatus", main);
		return result;
	}
	
	
	//페이지테스트
			@Override
			@SuppressWarnings("unchecked")
			public List selectRsvList(Map map) {
			    return sqlSession.selectList("mapper.rsvMember.getPage", map);
			}
			@Override
			public int countRsvList(Map map)throws Exception{
				return (Integer)sqlSession.selectOne("mapper.rsvMember.countrsvList");
			}
	
	
}