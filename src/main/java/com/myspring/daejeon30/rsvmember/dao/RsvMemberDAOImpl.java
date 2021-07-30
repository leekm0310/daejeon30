package com.myspring.daejeon30.rsvmember.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
}