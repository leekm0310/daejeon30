package com.myspring.daejeon30.admin.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface AdminMemberDAO {
	public List selectAllMember() throws DataAccessException;
	public void deleteMember(String id) throws DataAccessException;
	public MemberVO oneMem(String id) throws DataAccessException;
	public void updateMem(MemberVO mem) throws DataAccessException;
	public List selectMemType(String memType) throws DataAccessException;
}