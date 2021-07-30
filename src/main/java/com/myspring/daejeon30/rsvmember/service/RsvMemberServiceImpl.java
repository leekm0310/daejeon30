package com.myspring.daejeon30.rsvmember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;

import com.myspring.daejeon30.rsvmember.dao.RsvMemberDAO;
import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;

@Service("rsvMemberServiceImpl")
@Transactional(propagation = Propagation.REQUIRED)
public class RsvMemberServiceImpl implements RsvMemberService{
	
	@Autowired
	private RsvMemberDAO rsvMemberDAO;
	
	@Override
	public int insertRsvMember(RsvMemberVO rsvMemberVO) throws Exception {
		return rsvMemberDAO.insertRsvMember(rsvMemberVO);
	}
	
	@Override
	public List<RsvMemberVO> listrsv(String id) throws Exception {
		List<RsvMemberVO> rsvlist = rsvMemberDAO.selectRsv(id);
		return rsvlist;
	}
	
	@Override
	public void cancelRsv(String rsvNum) throws DataAccessException {
		rsvMemberDAO.updateRsvCancel(rsvNum);
	}
	
	@Override
	public RsvMemberVO viewOneRsv(int rsvNum) throws Exception{
		RsvMemberVO rsvMemberVO = rsvMemberDAO.selectOneRsv(rsvNum);
		return rsvMemberVO;
	}
	
	//@Override
	//public void updateRsvOne (String rsvNum) throws DataAccessException{
	//	rsvMemberDAO.updateRsv(rsvNum);
	//}
	
	@Override
	public int updateRsvOne(RsvMemberVO rsvMemberVO) throws DataAccessException{
		return rsvMemberDAO.updateRsv(rsvMemberVO);
	}
}