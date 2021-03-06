package com.myspring.daejeon30.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.paging.Criteria;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllMember() throws DataAccessException{
		List memberList = sqlSession.selectList("mapper.admin.member.allMember");
		return memberList;
	}
	
	@Override
	public void deleteMember(String id) throws DataAccessException{
		sqlSession.delete("mapper.admin.member.deleteMember", id);
	}
	
	@Override
	public MemberVO oneMem(String id) throws DataAccessException{
		MemberVO mem = sqlSession.selectOne("mapper.admin.member.memDetail", id);
		return mem;
	}
	
	@Override
	public void updateMem(MemberVO mem) throws DataAccessException{
		sqlSession.update("mapper.admin.member.updateMember", mem);
	}
	
	@Override
	public List selectMemType(String memType)throws DataAccessException{
		List memTypeList = sqlSession.selectList("mapper.admin.member.selectMemType", memType);
		return memTypeList;
	}
	
	//회원검색
	@Override
	public List searchMember(Map map) throws DataAccessException{
		return sqlSession.selectList("mapper.admin.member.searchMember", map);
	}
	//신규회원
	@Override
	public int newMember()throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.member.newMember");
	}
	
	//페이지테스트
	@Override
	@SuppressWarnings("unchecked")
	public List selectMemberList(Criteria cri) {
	    return sqlSession.selectList("mapper.admin.member.getPage", cri);
	}
	@Override
	public int countMemberList()throws Exception{
		return (Integer)sqlSession.selectOne("mapper.admin.member.countMemberList");
	}
}