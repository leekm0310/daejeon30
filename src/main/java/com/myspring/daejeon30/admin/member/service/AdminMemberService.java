package com.myspring.daejeon30.admin.member.service;

import java.util.List;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface AdminMemberService{
	public List Allmember() throws Exception;
	public void deleteMem(String id) throws Exception;
	public MemberVO oneMem(String id)throws Exception;
	public void updateMem(MemberVO mem)throws Exception;
	public List selectMemType(String memType)throws Exception;
	
}