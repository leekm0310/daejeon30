package com.myspring.daejeon30.rsvmember.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;


public interface RsvMemberService {
	public int insertRsvMember(RsvMemberVO rsvMemberVO) throws DataAccessException, Exception;
	public List<RsvMemberVO> listrsv(String id) throws Exception;
	public void cancelRsv(String rsvNum) throws DataAccessException;
	public RsvMemberVO viewOneRsv(int rsvNum) throws Exception;
	//public void updateRsvOne (String rsvNum) throws DataAccessException;
	public int updateRsvOne (RsvMemberVO rsvMemberVO) throws DataAccessException;
	
	public int countStatus(Map main)throws Exception;
	
	//페이지테스트
	public List selectRsvList(Map map) throws Exception;
	public int countRsvListTotal(Map map) throws Exception;
}