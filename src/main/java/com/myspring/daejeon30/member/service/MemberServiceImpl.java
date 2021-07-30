package com.myspring.daejeon30.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;

import com.myspring.daejeon30.member.dao.MemberDAO;
import com.myspring.daejeon30.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public String overlapped(String id)throws Exception{
		return memberDAO.overlappedId(id);
	}
	
	//회원탈퇴
	//@Override
	//public int removeMember(String id)throws DataAccessException{
	//	return memberDAO.deleteMember(id);
	//}
	
	//회원탈퇴2
	@Override
	public MemberVO removeMember(MemberVO memberVO) throws DataAccessException{
		return memberDAO.deleteMember(memberVO);
	}
	
	//회원정보수정
	public int modifyMember(MemberVO member)throws DataAccessException{
		return memberDAO.updateMember(member);
	}
	
	//아이디찾기
	public MemberVO findMember(MemberVO memberVO) throws Exception{
		return memberDAO.findId(memberVO);
	}
	
	//비밀번호찾기
	public MemberVO findPassword(MemberVO memberVO)throws Exception{
		return memberDAO.findPw(memberVO);
	}
	
	//글 삭제수정시 아이디 유효성 검사
	public MemberVO thisBoard(MemberVO memberVO) throws Exception{
		return memberDAO.thisId(memberVO);
	}
}

