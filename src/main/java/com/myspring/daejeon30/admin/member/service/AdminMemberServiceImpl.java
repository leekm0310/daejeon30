package com.myspring.daejeon30.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.admin.member.dao.AdminMemberDAO;
import com.myspring.daejeon30.member.vo.MemberVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	@Autowired
	AdminMemberDAO adminMemberDAO;
	
	@Override
	public List Allmember() throws Exception{
		List memberList = adminMemberDAO.selectAllMember();
		return memberList;
	}
	
	@Override
	public void deleteMem(String id) throws Exception{
		adminMemberDAO.deleteMember(id);
	}
	
	@Override
	public MemberVO oneMem(String id) throws Exception{
		MemberVO mem = adminMemberDAO.oneMem(id);
		return mem;
	}
}