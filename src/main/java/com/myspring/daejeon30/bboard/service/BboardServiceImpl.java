package com.myspring.daejeon30.bboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.bboard.dao.BboardDAO;
import com.myspring.daejeon30.bboard.vo.BboardVO;

@Service("bboardService")
public class BboardServiceImpl implements BboardService{
	@Autowired
	BboardDAO bboardDAO;
	
	//@Override
	//public List nboardList()throws Exception{
	//	List nList = bboardDAO.selectNBoard();
	//	return nList;
	//}
	
	@Override
	public int addNotice(BboardVO bboardVO) throws Exception {
		return bboardDAO.addNotice(bboardVO);
	}
	
	@Override
	public List bboardList(String sort)throws Exception{
		List bboard=bboardDAO.selectbboard(sort);
		return bboard;
	}
	
	@Override
	public BboardVO oneNo(String num)throws Exception{
		BboardVO bbo = bboardDAO.oneNo(num);
		return bbo;
	}
	
	@Override
	public void deleteOneNo(int num)throws Exception{
		bboardDAO.deleteOne(num);
	}
	
	@Override
	public void updateOneNo(BboardVO bboardVO)throws Exception{
		bboardDAO.updateOne(bboardVO);
	}
}