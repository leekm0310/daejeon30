package com.myspring.daejeon30.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.paging.Criteria;

public interface AdminMemberService{
	public List Allmember() throws Exception;
	public void deleteMem(String id) throws Exception;
	public MemberVO oneMem(String id)throws Exception;
	public void updateMem(MemberVO mem)throws Exception;
	public List selectMemType(String memType)throws Exception;
	
	//회원검색
	public List searchMember(Map map) throws Exception;
	
	//신규회원
	public int newMember()throws Exception;
	
	//페이지테스트
		public List selectMemberList(Criteria cri) throws Exception;
		public int countMemberListTotal() throws Exception;
	
}