package com.myspring.daejeon30.rsvmember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;

public interface RsvMemberDAO{
	public int insertRsvMember(RsvMemberVO rsvMemberVO) throws Exception;
	public List<RsvMemberVO> selectRsv(String id) throws DataAccessException;
	public void updateRsvCancel(String rsvNum) throws DataAccessException;
	public RsvMemberVO selectOneRsv(int rsvNum) throws DataAccessException;
	//public void updateRsv(String rsvNum)throws DataAccessException;
	public int updateRsv(RsvMemberVO rsvMemberVO) throws DataAccessException;
	
	
	public int countStatus(Map main)throws DataAccessException;
	
	//??????
	public List selectRsvList(Map map) throws Exception;
	public int countRsvList(Map map)throws Exception;
	
}
