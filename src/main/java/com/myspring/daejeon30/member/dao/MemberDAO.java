package com.myspring.daejeon30.member.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface MemberDAO{
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public String overlappedId(String id)throws Exception;
	
	//ȸ��Ż��
	//public int deleteMember(String id)throws DataAccessException;
	
	//ȸ��Ż��2
	public MemberVO deleteMember(MemberVO memberVO)throws DataAccessException;
	
	//ȸ����������
	public int updateMember(MemberVO memberVO)throws DataAccessException;
	
	//���̵�ã��
	public MemberVO findId(MemberVO memberVO)throws Exception;
	
	//��й�ȣã��
	public MemberVO findPw(MemberVO memberVO)throws Exception;
	
	public MemberVO thisId(MemberVO memberVO) throws Exception;
}
