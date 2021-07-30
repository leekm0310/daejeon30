package com.myspring.daejeon30.member.service;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO memberVO) throws Exception;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	//ȸ��Ż��
	//public int removeMember(String id) throws DataAccessException;
	//ȸ��Ż��2
	public MemberVO removeMember(MemberVO memberVO)throws DataAccessException;
	
	//ȸ����������
	public int modifyMember(MemberVO memberVO)throws DataAccessException;
	
	//���̵� ã��
	public MemberVO findMember(MemberVO memberVO) throws Exception;
	
	//��й�ȣ ã��
	public MemberVO findPassword(MemberVO memberVO) throws Exception;
	
	public MemberVO thisBoard(MemberVO memberVO) throws Exception;
	
	
}