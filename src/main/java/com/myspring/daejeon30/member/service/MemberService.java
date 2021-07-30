package com.myspring.daejeon30.member.service;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO memberVO) throws Exception;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	//회원탈퇴
	//public int removeMember(String id) throws DataAccessException;
	//회원탈퇴2
	public MemberVO removeMember(MemberVO memberVO)throws DataAccessException;
	
	//회원정보수정
	public int modifyMember(MemberVO memberVO)throws DataAccessException;
	
	//아이디 찾기
	public MemberVO findMember(MemberVO memberVO) throws Exception;
	
	//비밀번호 찾기
	public MemberVO findPassword(MemberVO memberVO) throws Exception;
	
	public MemberVO thisBoard(MemberVO memberVO) throws Exception;
	
	
}