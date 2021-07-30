package com.myspring.daejeon30.member.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

import com.myspring.daejeon30.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}
	
	@Override
	public int insertMember(MemberVO memberVO)throws DataAccessException{
		int result=sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public String overlappedId(String id)throws Exception{
		String result=sqlSession.selectOne("mapper.member.overlappedId", id);
		return result;
	}
	
	//ȸ��Ż��
	//@Override
	//public int deleteMember(String id)throws DataAccessException{
	//	int result=sqlSession.delete("mapper.member.deleteMember", id);
	//	return result;
	//}
	
	//ȸ��Ż��2
	@Override
	public MemberVO deleteMember(MemberVO memberVO) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.deleteMember", memberVO);
		return vo;
	}
	
	//ȸ����������
	@Override
	public int updateMember(MemberVO memberVO)throws DataAccessException{
		int result = sqlSession.update("mapper.member.updateMember", memberVO);
		return result;
	}
	
	//���̵� ã��
	public MemberVO findId(MemberVO memberVO)throws Exception{
		MemberVO vo =sqlSession.selectOne("mapper.member.findId", memberVO);
		return vo;	
	}
	
	//��й�ȣ ã��
	public MemberVO findPw(MemberVO memberVO)throws Exception{
		MemberVO vo=sqlSession.selectOne("mapper.member.findPw", memberVO);
		return vo;
	}
	
	//�� ���� ���� ���̵� ��ȿ��
	public MemberVO thisId(MemberVO memberVO)throws Exception{
		MemberVO vo = sqlSession.selectOne("mapper.member.thisId",memberVO);
		return vo;
	}
}