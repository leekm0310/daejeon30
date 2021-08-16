package com.myspring.daejeon30.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.paging.Criteria;

public interface AdminMemberDAO {
	public List selectAllMember() throws DataAccessException;
	public void deleteMember(String id) throws DataAccessException;
	public MemberVO oneMem(String id) throws DataAccessException;
	public void updateMem(MemberVO mem) throws DataAccessException;
	public List selectMemType(String memType) throws DataAccessException;
	
	//ȸ���˻�
	public List searchMember(Map map) throws DataAccessException;
	
	//�ű�ȸ��
	public int newMember()throws DataAccessException;
	
	//������
	public List selectMemberList(Criteria cri) throws Exception;
	public int countMemberList()throws Exception;
}