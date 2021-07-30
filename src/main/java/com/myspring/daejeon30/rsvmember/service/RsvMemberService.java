package com.myspring.daejeon30.rsvmember.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;


public interface RsvMemberService {
	public int insertRsvMember(RsvMemberVO rsvMemberVO) throws DataAccessException, Exception;
	public List<RsvMemberVO> listrsv(String id) throws Exception;
	public void cancelRsv(String rsvNum) throws DataAccessException;
	public RsvMemberVO viewOneRsv(int rsvNum) throws Exception;
	//public void updateRsvOne (String rsvNum) throws DataAccessException;
	public int updateRsvOne (RsvMemberVO rsvMemberVO) throws DataAccessException;
}