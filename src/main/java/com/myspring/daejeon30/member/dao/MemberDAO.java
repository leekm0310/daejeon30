package com.myspring.daejeon30.member.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface MemberDAO{
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public String overlappedId(String id)throws Exception;
	
	//회원탈퇴
	//public int deleteMember(String id)throws DataAccessException;
	
	//회원탈퇴2
	public MemberVO deleteMember(MemberVO memberVO)throws DataAccessException;
	
	//회원정보수정
	public int updateMember(MemberVO memberVO)throws DataAccessException;
	
	//아이디찾기
	public MemberVO findId(MemberVO memberVO)throws Exception;
	
	//비밀번호찾기
	public MemberVO findPw(MemberVO memberVO)throws Exception;
	
	public MemberVO thisId(MemberVO memberVO) throws Exception;
}
